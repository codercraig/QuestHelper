-- [[
--  QuestHelper (v2.0.0 - Refactored)
--  Original by Oxos
--  Integrated with OnMob (v2.6.6) functionality.
--  Refactored into modular architecture
--
--  v2.0.0 - Complete refactor into separate modules for maintainability
--         - Same functionality, cleaner code organization
-- ]]

require('common')
addon.author   = 'Oxos'
addon.name     = 'QuestHelper'
addon.version  = '2.0.0'

-- Core Requirements
local imgui        = require('imgui')
local image_loader = require('images')
local helpers      = require('helpers')

-- External drawing modules (existing)
local drawArcModule = require('drawArc')
local drawingModule = require('drawing')

-- New modular architecture
local player_module    = require('modules.player')
local quest_data_loader = require('modules.quest_data')
local quest_state      = require('modules.quest_state')
local triggers_module  = require('modules.triggers')
local beam_drawing     = require('modules.beam_drawing')
local ui_main          = require('modules.ui_main')
local ui_images        = require('modules.ui_images')
local map_renderer     = require('modules.map_renderer')
local utils            = require('modules.utils')
local inventory_cache  = require('modules.inventory_cache')
local keyitem_module   = require('modules.keyitem')
local floor_debug      = require('debug_floor_state')

-- Validation
if not helpers then error("[" .. addon.name .. "] helpers.lua is missing.") end
if not drawArcModule then error("[" .. addon.name .. "] drawArc.lua is missing.") end
if not drawingModule then error("[" .. addon.name .. "] drawing.lua is missing.") end

--------------------------------------------------------------------------------
-- UI State Variables
--------------------------------------------------------------------------------
local currentTopCategory = nil
local currentSubfile     = nil
local current_mission    = nil
local is_open            = false
local showImagesDrawer   = true
local lastMainX, lastMainY = 300, 200
local lastMainW, lastMainH = 400, 600
local step_trigger_flags = T{}

--------------------------------------------------------------------------------
-- Data Storage
--------------------------------------------------------------------------------
local quest_data = T{}
local location_data = T{}
local zone_data = T{}
local map_db = T{}
local questIconTexture = nil
local floor_mappings = T{}  -- Floor ID mappings for multi-floor zones
local keyitems_db = require('data.keyitems')  -- Key items database

--------------------------------------------------------------------------------
-- Debug Settings
--------------------------------------------------------------------------------
local ENABLE_VERBOSE_DEBUG = false
local ENABLE_TRIGGER_DEBUG = false -- Toggle with /qh_debug
local DEBUG_PRINT_INTERVAL = 10
local lastDebugPrintTime = 0
local lastFrameTime = os.clock()

--------------------------------------------------------------------------------
-- Main Rendering Loop
--------------------------------------------------------------------------------
local lastInventoryTriggerCheck = 0
local INVENTORY_TRIGGER_CHECK_INTERVAL = 3.0 -- Check every 3 seconds
local lastZoneId = 0 -- Track zone changes to reset map
local lastFloorCheck = 0
local FLOOR_CHECK_INTERVAL = 5.0 -- Check floor every 5 seconds
local lastKnownFloor = 0 -- Track floor changes

ashita.events.register('d3d_present', 'present_callback', function()
    local systemCurrentTime = os.time()
    local frameCurrentTime = os.clock()
    local deltaTime = frameCurrentTime - lastFrameTime
    lastFrameTime = frameCurrentTime
    local shouldPrintDebugNow = false

    if ENABLE_VERBOSE_DEBUG then
        if (systemCurrentTime - lastDebugPrintTime) >= DEBUG_PRINT_INTERVAL then
            shouldPrintDebugNow = true
            lastDebugPrintTime = systemCurrentTime
        end
    end

    -- Update player position
    local memManager = AshitaCore:GetMemoryManager()
    if memManager then
        if not player_module.updatePosition(memManager) then
            if shouldPrintDebugNow then
                print("["..addon.name.."] Could not update player position.")
            end
        end

        -- Detect zone changes and auto-detect floor/map
        if player_module.zoneId ~= lastZoneId and player_module.zoneId ~= 0 then
            if lastZoneId ~= 0 then -- Don't print on initial load
                print(string.format("["..addon.name.."] Zone changed (ID: %d -> %d)", lastZoneId, player_module.zoneId))

                -- Try to auto-detect floor/map using CheckFloorNumber
                local detectedFloor = player_module.getFloorId()
                if detectedFloor and detectedFloor > 0 then
                    quest_state.setCurrentMap(player_module.zoneId, detectedFloor)
                    print(string.format("["..addon.name.."] Auto-detected floor/map: %d", detectedFloor))
                else
                    -- Fallback: reset to map 1
                    quest_state.setCurrentMap(player_module.zoneId, 1)
                    print(string.format("["..addon.name.."] Using default map 1 (floor auto-detection unavailable)"))
                end
            end
            lastZoneId = player_module.zoneId
        end
    else
        if shouldPrintDebugNow then
            print("["..addon.name.."] MemoryManager not ready.")
        end
    end

    -- Periodic floor check for multi-map zones (every 5 seconds)
    local timeSinceLastFloorCheck = frameCurrentTime - lastFloorCheck
    if timeSinceLastFloorCheck >= FLOOR_CHECK_INTERVAL then
        lastFloorCheck = frameCurrentTime

        -- Check current floor
        local currentFloor = player_module.getFloorId(floor_mappings)
        if currentFloor and currentFloor ~= lastKnownFloor and player_module.zoneId ~= 0 then
            -- Floor changed!
            if lastKnownFloor ~= 0 then
                print(string.format("["..addon.name.."] Floor changed: %d -> %d, updating map", lastKnownFloor, currentFloor))
                quest_state.setCurrentMap(player_module.zoneId, currentFloor)
            end
            lastKnownFloor = currentFloor
        end
    end

    -- Periodic inventory check for trigger_on_item_obtain
    if currentTopCategory and currentSubfile and current_mission then
        local timeSinceLastCheck = frameCurrentTime - lastInventoryTriggerCheck
        if timeSinceLastCheck >= INVENTORY_TRIGGER_CHECK_INTERVAL then
            lastInventoryTriggerCheck = frameCurrentTime

            local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
            if missionData and missionData.steps then
                local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
                if missionData.steps[step_idx] then
                    local step_data = missionData.steps[step_idx]

                    if type(step_data) == 'table' and step_data.trigger_on_item_obtain then
                        local inventory_module = require('modules.inventory')
                        local items_to_check = {}

                        -- Normalize to list
                        if type(step_data.trigger_on_item_obtain) == 'string' then
                            table.insert(items_to_check, step_data.trigger_on_item_obtain)
                        elseif type(step_data.trigger_on_item_obtain) == 'table' then
                            items_to_check = step_data.trigger_on_item_obtain
                        end

                        -- Check if step requires all items or just one
                        if step_data.require_all_items then
                            -- Check if player has ALL items
                            local hasAll = true
                            for _, itemName in ipairs(items_to_check) do
                                -- Search ALL storages (true flag)
                                local hasItem = inventory_module.hasItem(itemName, true)
                                if hasItem then
                                    -- Mark this specific item as obtained in partial progress
                                    if not quest_state.getPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, itemName) then
                                        quest_state.setPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, itemName, true)
                                    end
                                else
                                    hasAll = false
                                end
                            end

                            -- If all items found, complete the step
                            if hasAll then
                                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                            end
                        else
                            -- Just need ONE of the items
                            for _, itemName in ipairs(items_to_check) do
                                -- Search ALL storages (true flag)
                                local hasItem = inventory_module.hasItem(itemName, true)
                                if hasItem then
                                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                                    break
                                end
                            end
                        end
                    end

                    -- Periodic key item check for trigger_on_keyitem_obtain
                    if type(step_data) == 'table' and step_data.trigger_on_keyitem_obtain then
                        local keyitems_to_check = {}

                        -- Normalize to list
                        if type(step_data.trigger_on_keyitem_obtain) == 'number' then
                            table.insert(keyitems_to_check, step_data.trigger_on_keyitem_obtain)
                        elseif type(step_data.trigger_on_keyitem_obtain) == 'table' then
                            keyitems_to_check = step_data.trigger_on_keyitem_obtain
                        end

                        -- Check if step requires all key items or just one
                        if step_data.require_all_keyitems then
                            -- Check if player has ALL key items
                            local hasAll = true
                            for _, ki in ipairs(keyitems_to_check) do
                                local ki_id = type(ki) == 'number' and ki or (type(ki) == 'table' and ki.id) or nil
                                if ki_id then
                                    local hasKI = keyitem_module.hasKeyItem(ki_id)
                                    if hasKI then
                                        -- Mark this specific key item as obtained in partial progress
                                        local ki_key = "ki_" .. ki_id
                                        if not quest_state.getPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, ki_key) then
                                            quest_state.setPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, ki_key, true)
                                        end
                                    else
                                        hasAll = false
                                    end
                                end
                            end

                            -- If all key items found, complete the step
                            if hasAll then
                                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                            end
                        else
                            -- Just need ONE of the key items
                            for _, ki in ipairs(keyitems_to_check) do
                                local ki_id = type(ki) == 'number' and ki or (type(ki) == 'table' and ki.id) or nil
                                if ki_id then
                                    local hasKI = keyitem_module.hasKeyItem(ki_id)
                                    if hasKI then
                                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Resolve targets to draw beams to
    local targetsToDraw = {}
    local targetStepText = nil

    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]

                -- Check zone entry trigger
                if triggers_module.checkZoneTrigger(step_data, player_module.zoneId, zone_data,
                                                   quest_state, currentTopCategory, currentSubfile,
                                                   current_mission, step_idx) then
                    return
                end

                -- Check trigger zones (square/line)
                -- NOTE: posY_height is actually the Z coordinate (depth), posZ_depth is actually Y (elevation)
                if triggers_module.checkTriggerZones(step_data, player_module.posX, player_module.posY_height,
                                                    quest_state, currentTopCategory, currentSubfile,
                                                    current_mission, step_idx, ENABLE_TRIGGER_DEBUG, player_module.zoneId, zone_data) then
                    return
                end

                if type(step_data) == 'table' then
                    targetStepText = step_data.text or ("Step " .. step_idx)
                    local target_ref = step_data.onmob_target

                    local potential_targets = {}
                    if type(target_ref) == 'string' then
                        table.insert(potential_targets, target_ref)
                    elseif type(target_ref) == 'table' then
                        if target_ref[1] and type(target_ref[1]) == 'string' then
                            potential_targets = target_ref
                        else
                            table.insert(targetsToDraw, target_ref)
                        end
                    end

                    for _, name in ipairs(potential_targets) do
                        if location_data[name] then
                            table.insert(targetsToDraw, location_data[name])
                        else
                            if shouldPrintDebugNow then
                                print(string.format("[%s Debug] Error: Step references location key '%s', but it's not in locations.lua.", addon.name, name))
                            end
                        end
                    end
                end
            end
        end
    end

    -- Draw trigger zones and draw types
    if currentTopCategory and currentSubfile and current_mission then
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if missionData and missionData.steps then
            local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
            if missionData.steps[step_idx] then
                local step_data = missionData.steps[step_idx]
                if type(step_data) == 'table' then
                    -- Check if we should draw based on zone
                    local shouldDraw = false
                    local requiredZone = step_data.zone_name or step_data.zone

                    if requiredZone and zone_data[requiredZone] then
                        local required_zone_id = zone_data[requiredZone]
                        if player_module.zoneId == required_zone_id then
                            shouldDraw = true
                            if shouldPrintDebugNow then
                                print(string.format("["..addon.name.."] Zone match: Drawing in %s (ID: %d)", requiredZone, required_zone_id))
                            end
                        else
                            if shouldPrintDebugNow then
                                print(string.format("["..addon.name.."] Zone mismatch: Required %s (ID: %d), Current (ID: %d)",
                                    requiredZone, required_zone_id, player_module.zoneId))
                            end
                        end
                    else
                        -- No zone restriction, always draw
                        shouldDraw = true
                        if shouldPrintDebugNow and requiredZone then
                            print(string.format("["..addon.name.."] Warning: Zone '%s' not found in zone_data", requiredZone))
                        end
                    end

                    if shouldDraw then
                        beam_drawing.calculateDynamicColor()

                        if step_data.trigger_zones then
                            for _, zone in ipairs(step_data.trigger_zones) do
                                if zone.type == 'square' and zone.center and zone.size then
                                    drawingModule.drawSquare(zone.center, zone.size, beam_drawing.ARGB_BEAM_COLOR)
                                elseif zone.type == 'line' and zone.start and zone.stop then
                                    drawingModule.drawLine(zone.start, zone.stop, beam_drawing.ARGB_BEAM_COLOR)
                                end
                            end
                        end

                        if step_data.draw_type then
                            if step_data.draw_type == 'line' and step_data.start_pos and step_data.end_pos then
                                drawingModule.drawLine(step_data.start_pos, step_data.end_pos, beam_drawing.ARGB_BEAM_COLOR)
                            elseif step_data.draw_type == 'square' and step_data.center and step_data.size then
                                drawingModule.drawSquare(step_data.center, step_data.size, beam_drawing.ARGB_BEAM_COLOR)
                            end
                        end
                    end
                end
            end
        end
    end

    -- Filter targets by zone
    local filteredTargets = {}
    for _, targetData in ipairs(targetsToDraw) do
        if targetData then
            if targetData.zone and zone_data[targetData.zone] then
                if player_module.zoneId == zone_data[targetData.zone] then
                    table.insert(filteredTargets, targetData)
                end
            else
                table.insert(filteredTargets, targetData)
            end
        end
    end

    -- Draw beams and icons
    beam_drawing.updateBeamProgress(deltaTime)
    beam_drawing.drawBeamsToTargets(filteredTargets, player_module.posX, player_module.posZ_depth,
                                   player_module.posY_height, memManager, drawArcModule,
                                   questIconTexture, helpers, shouldPrintDebugNow,
                                   targetStepText, addon.name)

    -- Render UI
    if not is_open then return end

    local window_open, mainX, mainY, mainW, mainH, newShowDrawer, newTopCat, newSubfile, newMission =
        ui_main.render(is_open, currentTopCategory, currentSubfile, current_mission, showImagesDrawer,
                      quest_data, quest_state, utils, inventory_cache, keyitem_module, keyitems_db)

    if mainW > 0 and mainH > 0 then
        lastMainX = mainX
        lastMainY = mainY
        lastMainW = mainW
        lastMainH = mainH
    end

    showImagesDrawer = newShowDrawer
    currentTopCategory = newTopCat
    currentSubfile = newSubfile
    current_mission = newMission

    -- Render image drawer
    if not window_open then
        showImagesDrawer = false
        return
    end

    if showImagesDrawer and currentTopCategory and currentSubfile and current_mission then
        ui_images.render(lastMainX, lastMainY, lastMainW, lastMainH,
                        currentTopCategory, currentSubfile, current_mission,
                        quest_state, quest_data, utils, image_loader, map_renderer,
                        player_module, zone_data, map_db, floor_mappings, ui_main.settings)
    end
end)

--------------------------------------------------------------------------------
-- Commands
--------------------------------------------------------------------------------
ashita.events.register('command', 'command_callback', function(e)
    local args = e.command:args()
    if not args[1] then return false end

    local command_base = args[1]:gsub("^/", ""):lower()

    if command_base == 'questhelper' then
        is_open = not is_open
        e.blocked = true
        return true
    end

    if command_base == 'qh_zone_id' then
        local mem = AshitaCore:GetMemoryManager()
        if mem and mem:GetParty() then
            local zone_id = mem:GetParty():GetMemberZone(0)
            print(string.format("[%s] Current Zone ID: %d", addon.name, zone_id))
        else
            print(string.format("[%s] Could not retrieve zone ID.", addon.name))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_events' then
        if not current_mission then
            print(string.format("[%s] No mission selected.", addon.name))
            e.blocked = true
            return true
        end
        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if not missionData or not missionData.steps then
            print(string.format("[%s] No steps found for current mission.", addon.name))
            e.blocked = true
            return true
        end

        print(string.format("[%s] Available events for %s:", addon.name, current_mission))
        for i, step_data in ipairs(missionData.steps) do
            local text = (type(step_data) == 'table' and step_data.text) or tostring(step_data)
            print(string.format("  Event ID %d: %s", i, text))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_trigger' then
        if not current_mission then
            print(string.format("[%s] No mission selected.", addon.name))
            e.blocked = true
            return true
        end
        local step_to_trigger = tonumber(args[2])
        if not step_to_trigger then
            print(string.format("[%s] Usage: /qh_trigger <step_number>", addon.name))
            e.blocked = true
            return true
        end

        local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
        if not missionData or not missionData.steps or step_to_trigger > #missionData.steps or step_to_trigger < 1 then
            print(string.format("[%s] Invalid step number.", addon.name))
            e.blocked = true
            return true
        end

        print(string.format("[%s] Triggering events up to %d...", addon.name, step_to_trigger))
        for i = 1, step_to_trigger do
            if not quest_state.getStepState(currentTopCategory, currentSubfile, current_mission, i) then
                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, i, true, step_trigger_flags)
            end
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_find' then
        local itemName = table.concat(args, ' ', 2)
        if not itemName or itemName == "" then
            print(string.format("[%s] Usage: /qh_find <item name>", addon.name))
            print(string.format("[%s] Example: /qh_find Dark Crystal", addon.name))
            e.blocked = true
            return true
        end

        local inventory_module = require('modules.inventory')
        -- Search ALL storages (true flag)
        local hasItem, count, locations = inventory_module.hasItem(itemName, true)

        print(string.format("[%s] Searching for '%s' in ALL storages...", addon.name, itemName))
        if hasItem then
            print(string.format("\30\106[FOUND]\30\01 You have %d x %s", count, itemName))
            for storageName, storageCount in pairs(locations) do
                print(string.format("  - %s: %d", storageName, storageCount))
            end
        else
            print(string.format("\30\68[NOT FOUND]\30\01 Item '%s' not found in any storage.", itemName))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_debug' then
        ENABLE_TRIGGER_DEBUG = not ENABLE_TRIGGER_DEBUG
        print(string.format("[%s] Trigger zone debug: %s", addon.name, ENABLE_TRIGGER_DEBUG and "ENABLED" or "DISABLED"))
        e.blocked = true
        return true
    end

    if command_base == 'qh_verbose' then
        ENABLE_VERBOSE_DEBUG = not ENABLE_VERBOSE_DEBUG
        print(string.format("[%s] Verbose debug (zone checking): %s", addon.name, ENABLE_VERBOSE_DEBUG and "ENABLED" or "DISABLED"))
        e.blocked = true
        return true
    end

    if command_base == 'qh_resetmap' then
        if player_module.zoneId and player_module.zoneId ~= 0 then
            quest_state.setCurrentMap(player_module.zoneId, 1)
            print(string.format("[%s] Manually reset map to 1 for current zone (ID: %d)", addon.name, player_module.zoneId))
        else
            print(string.format("[%s] Cannot reset map - zone ID not available", addon.name))
        end
        e.blocked = true
        return true
    end

    if command_base == 'qh_checkfloor' then
        print(string.format("[%s] ========== Floor Detection Test ==========", addon.name))
        print(string.format("[%s] Zone ID: %d", addon.name, player_module.zoneId or 0))
        print(string.format("[%s] Position: X=%.2f, Y=%.2f, Z=%.2f", addon.name,
            player_module.posX, player_module.posY_height, player_module.posZ_depth))
        print(string.format("[%s] -----------------------------------------------", addon.name))

        local floorIdRaw = player_module.getFloorIdRaw()
        local floorIdMapped = player_module.getFloorId(floor_mappings)
        local mapinfo = player_module.getMapInfo()

        if floorIdRaw ~= nil then
            print(string.format("[%s] CheckFloorNumber (raw):    %d", addon.name, floorIdRaw))
            print(string.format("[%s] Mapped floor number:       %d", addon.name, floorIdMapped or floorIdRaw))

            -- Show mapinfo FloorId if available
            if mapinfo and mapinfo.FloorId then
                print(string.format("[%s] mapinfo_t FloorId:        %d", addon.name, mapinfo.FloorId))
                if mapinfo.FloorId ~= floorIdRaw then
                    print(string.format("[%s]   ⚠ FloorId differs from CheckFloorNumber!", addon.name))
                    print(string.format("[%s]   ⚠ Use FloorId=%d for floor_mappings.lua", addon.name, mapinfo.FloorId))
                end
            end

            print(string.format("[%s] -----------------------------------------------", addon.name))
            print(string.format("[%s] Current saved map:         %d", addon.name, quest_state.getCurrentMap(player_module.zoneId)))

            -- Check if this zone has a mapping
            if floor_mappings and floor_mappings[player_module.zoneId] then
                print(string.format("[%s] Zone has floor mapping configured:", addon.name))
                for raw_id, map_num in pairs(floor_mappings[player_module.zoneId]) do
                    local marker = (raw_id == floorIdRaw) and " ← YOU ARE HERE" or ""
                    local marker2 = (mapinfo and raw_id == mapinfo.FloorId) and " ← mapinfo FloorId" or ""
                    print(string.format("[%s]   [%d] = %d%s%s", addon.name, raw_id, map_num, marker, marker2))
                end
            else
                print(string.format("[%s] No floor mapping for this zone", addon.name))
                print(string.format("[%s] Assuming incremental (raw ID = floor number)", addon.name))
            end

            print(string.format("[%s] -----------------------------------------------", addon.name))
            print(string.format("[%s] Floor detection: SUCCESS!", addon.name))
        else
            print(string.format("[%s] Floor detection: FAILED - could not initialize", addon.name))
        end
        print(string.format("[%s] ==========================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_mapinfo' then
        print(string.format("[%s] ========== Map Info Structure Debugger ==========", addon.name))

        local mapinfo = player_module.getMapInfo()

        if mapinfo then
            print(string.format("[%s] Successfully read mapinfo_t structure!", addon.name))

            if mapinfo.warning then
                print(string.format("[%s] WARNING: %s", addon.name, mapinfo.warning))
            end

            print(string.format("[%s] -----------------------------------------------", addon.name))
            print(string.format("[%s] Array Index:   %d", addon.name, mapinfo.array_index or -1))
            print(string.format("[%s] ZoneId:        %d (current zone: %d) %s", addon.name,
                mapinfo.ZoneId, player_module.zoneId,
                (mapinfo.ZoneId == player_module.zoneId) and "✓" or "✗ MISMATCH"))
            print(string.format("[%s] FloorId:       %d", addon.name, mapinfo.FloorId))
            print(string.format("[%s] FloorIndex:    %d", addon.name, mapinfo.FloorIndex))
            print(string.format("[%s] Flags:         0x%02X", addon.name, mapinfo.Flags))
            print(string.format("[%s] Scale:         %d", addon.name, mapinfo.Scale))
            print(string.format("[%s] KeyItemOffset: %d", addon.name, mapinfo.KeyItemOffset))
            print(string.format("[%s] Unknown0000:   %d", addon.name, mapinfo.Unknown0000))
            print(string.format("[%s] MapDatOffset:  %d", addon.name, mapinfo.MapDatOffset))
            print(string.format("[%s] OffsetX:       %d", addon.name, mapinfo.OffsetX))
            print(string.format("[%s] OffsetY:       %d", addon.name, mapinfo.OffsetY))
            print(string.format("[%s] -----------------------------------------------", addon.name))

            -- Calculate derived values
            local scale_divisor = player_module.getMapScale(mapinfo)
            if scale_divisor then
                print(string.format("[%s] Calculated Scale: %.2f (2560.0 / %d)", addon.name, scale_divisor, mapinfo.Scale))
            end

            -- Calculate calibration
            local cal = player_module.calculateMapCalibration(mapinfo)
            if cal then
                print(string.format("[%s] -----------------------------------------------", addon.name))
                print(string.format("[%s] maps.lua Format (copy to test):", addon.name))
                print(string.format("[%s] -----------------------------------------------", addon.name))
                print(string.format("[%s]     origin_x = %d,", addon.name, cal.origin_x))
                print(string.format("[%s]     origin_y = %d,", addon.name, cal.origin_y))
                print(string.format("[%s]     scale_x  = %.2f,", addon.name, cal.scale_x))
                print(string.format("[%s]     scale_y  = %.2f", addon.name, cal.scale_y))
                print(string.format("[%s] -----------------------------------------------", addon.name))
                print(string.format("[%s] Debug Info:", addon.name))
                print(string.format("[%s]   Raw OffsetX: %d", addon.name, cal.raw_offset_x))
                print(string.format("[%s]   Raw OffsetY: %d", addon.name, cal.raw_offset_y))
                print(string.format("[%s]   Raw Scale: %d", addon.name, cal.raw_scale))
                print(string.format("[%s]   Scale Divisor: %.2f", addon.name, cal.scale_divisor))
                print(string.format("[%s]   Pixels/Yalm: %.2f", addon.name, cal.scale_x))
            end

            print(string.format("[%s] -----------------------------------------------", addon.name))
            print(string.format("[%s] Current Position: X=%.2f, Y=%.2f, Z=%.2f", addon.name,
                player_module.posX, player_module.posY_height, player_module.posZ_depth))

        else
            print(string.format("[%s] FAILED to read mapinfo_t structure", addon.name))
            print(string.format("[%s] Possible reasons:", addon.name))
            print(string.format("[%s]   - mapinfo array pointer not found (signature mismatch)", addon.name))
            print(string.format("[%s]   - Floor detection not initialized", addon.name))
            print(string.format("[%s]   - Player position not available", addon.name))
        end

        print(string.format("[%s] ==================================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_test_floors' then
        print(string.format("[%s] ========== FLOOR DETECTION STATE TEST ==========", addon.name))

        -- Get current step images
        local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
        local step_imgs = utils.get_images_for_step(currentTopCategory, currentSubfile, current_mission, step_idx, quest_data)

        -- Generate floor state report
        local report = floor_debug.get_state_report(player_module, zone_data, floor_mappings, map_db, step_imgs)

        -- Print each line
        for _, line in ipairs(report) do
            print(string.format("[%s] %s", addon.name, line))
        end

        print(string.format("[%s] ==================================================", addon.name))
        print(string.format("[%s] TIP: Use /qh_checkfloor for raw floor ID data", addon.name))
        print(string.format("[%s] TIP: See test_floor_scenarios.md for full test plan", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_textures' then
        local loaded_count = image_loader.GetLoadedCount()
        local avg_size_kb = 443  -- Average map texture size in KB
        local estimated_mb = (loaded_count * avg_size_kb) / 1024

        print(string.format("[%s] ========== Texture Memory Usage ==========", addon.name))
        print(string.format("[%s] Loaded textures: %d", addon.name, loaded_count))
        print(string.format("[%s] Estimated memory: %.2f MB", addon.name, estimated_mb))
        print(string.format("[%s] (Based on ~%d KB average per texture)", addon.name, avg_size_kb))
        print(string.format("[%s] ==========================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_keyitems' then
        print(string.format("[%s] ========== Key Item Tracking Status ==========", addon.name))

        if keyitem_module.isInitialized() then
            local owned_kis, count = keyitem_module.listOwnedKeyItems()
            print(string.format("[%s] Total key items tracked: %d", addon.name, count))

            if count > 0 then
                print(string.format("[%s] -----------------------------------------------", addon.name))
                print(string.format("[%s] Owned Key Item IDs:", addon.name))
                local line = ""
                for i, ki_id in ipairs(owned_kis) do
                    line = line .. string.format("%d ", ki_id)
                    if i % 10 == 0 or i == #owned_kis then
                        print(string.format("[%s]   %s", addon.name, line))
                        line = ""
                    end
                end
            else
                print(string.format("[%s] No key items currently owned", addon.name))
            end
        else
            print(string.format("[%s] Key item tracking NOT initialized", addon.name))
            print(string.format("[%s] Waiting for packet 0x55 from server...", addon.name))
        end

        print(string.format("[%s] ==========================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_findzone' then
        print(string.format("[%s] ========== Searching for Current Zone in Map Array ==========", addon.name))

        local zoneToFind = player_module.zoneId
        print(string.format("[%s] Searching for Zone ID: %d", addon.name, zoneToFind))
        print(string.format("[%s] Current Floor Index: %d", addon.name, player_module.getFloorIdRaw() or -1))
        print(string.format("[%s] -----------------------------------------------", addon.name))

        -- Search up to 1000 entries
        local maxSearch = 1000
        local foundEntries = {}

        -- Get array data
        local arrayData = player_module.debugDumpMapArray(maxSearch)
        if not arrayData then
            print(string.format("[%s] FAILED: Could not access mapinfo array", addon.name))
            e.blocked = true
            return true
        end

        print(string.format("[%s] Searching %d entries...", addon.name, maxSearch))

        for i, entry in ipairs(arrayData.entries) do
            if entry.ZoneId == zoneToFind then
                table.insert(foundEntries, {
                    index = i - 1,
                    entry = entry
                })
            end
        end

        if #foundEntries > 0 then
            print(string.format("[%s] ✓ Found %d entries for Zone %d:", addon.name, #foundEntries, zoneToFind))
            for _, found in ipairs(foundEntries) do
                local entry = found.entry
                local isFloorMatch = (entry.FloorIndex == (arrayData.current_floor or -1)) and " ← CURRENT FLOOR" or ""
                print(string.format("[%s]   [%d] Floor=%d/%d Scale=%d OffX=%d OffY=%d Flags=0x%02X%s",
                    addon.name, found.index,
                    entry.FloorId, entry.FloorIndex, entry.Scale,
                    entry.OffsetX, entry.OffsetY, entry.Flags, isFloorMatch))
            end
        else
            print(string.format("[%s] ✗ No entries found for Zone %d in %d entries", addon.name, zoneToFind, maxSearch))
            print(string.format("[%s] Zone range found: %d - %d", addon.name,
                arrayData.entries[1].ZoneId,
                arrayData.entries[#arrayData.entries].ZoneId))
        end

        print(string.format("[%s] ==================================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_dumpmaparray' then
        print(string.format("[%s] ========== Map Array Memory Dump ==========", addon.name))

        -- Get the raw mapinfo array data from player module
        local mapArrayData = player_module.debugDumpMapArray(20)

        if not mapArrayData then
            print(string.format("[%s] FAILED: Could not access mapinfo array", addon.name))
            print(string.format("[%s] Check that floor detection is initialized", addon.name))
        else
            print(string.format("[%s] Base Pointer: 0x%08X", addon.name, mapArrayData.base_ptr))
            print(string.format("[%s] Current Zone: %d", addon.name, player_module.zoneId))
            print(string.format("[%s] Current Floor Index (from CheckFloorNumber): %d", addon.name, mapArrayData.current_floor or -1))
            print(string.format("[%s] -----------------------------------------------", addon.name))
            print(string.format("[%s] Dumping first %d entries:", addon.name, #mapArrayData.entries))
            print(string.format("[%s] -----------------------------------------------", addon.name))

            for i, entry in ipairs(mapArrayData.entries) do
                local idx = i - 1  -- 0-based index
                local match_zone = (entry.ZoneId == player_module.zoneId) and " ← ZONE MATCH" or ""
                local match_floor = (entry.FloorIndex == (mapArrayData.current_floor or -1)) and " ← FLOOR MATCH" or ""

                print(string.format("[%s] [%d] Addr=0x%08X Zone=%d Floor=%d/%d Scale=%d OffX=%d OffY=%d%s%s",
                    addon.name, idx, entry.address,
                    entry.ZoneId, entry.FloorId, entry.FloorIndex,
                    entry.Scale, entry.OffsetX, entry.OffsetY,
                    match_zone, match_floor))
            end

            print(string.format("[%s] -----------------------------------------------", addon.name))

            -- Check if we found a matching entry
            local found_match = false
            for i, entry in ipairs(mapArrayData.entries) do
                if entry.ZoneId == player_module.zoneId and entry.FloorIndex == (mapArrayData.current_floor or -1) then
                    found_match = true
                    print(string.format("[%s] ✓ Found matching entry at array index %d", addon.name, i - 1))
                    break
                end
            end

            if not found_match then
                print(string.format("[%s] ✗ No matching entry found in first %d entries", addon.name, #mapArrayData.entries))
                print(string.format("[%s] This suggests:", addon.name))
                print(string.format("[%s]   - Array pointer might be wrong", addon.name))
                print(string.format("[%s]   - Structure size (0x0E) might be incorrect", addon.name))
                print(string.format("[%s]   - Need to search more entries", addon.name))
            end
        end

        print(string.format("[%s] ==================================================", addon.name))
        e.blocked = true
        return true
    end

    if command_base == 'qh_dump_inv' then
        print(string.format("[%s] Dumping first 20 items in Inventory...", addon.name))

        local mem = AshitaCore:GetMemoryManager()
        if not mem then
            print("ERROR: MemoryManager not available")
            e.blocked = true
            return true
        end

        local inventory = mem:GetInventory()
        local resources = AshitaCore:GetResourceManager()

        if not inventory or not resources then
            print("ERROR: Inventory or Resources not available")
            e.blocked = true
            return true
        end

        local count = 0
        for j = 0, math.min(inventory:GetContainerCountMax(0), 20) do
            local itemEntry = inventory:GetContainerItem(0, j)

            if itemEntry and itemEntry.Id ~= 0 and itemEntry.Id ~= 65535 then
                local item = resources:GetItemById(itemEntry.Id)

                print(string.format("\n[Slot %d] ItemID: %d", j, itemEntry.Id))

                if item then
                    -- Get the item name (Name[1] is English in Ashita v4)
                    local itemName = item.Name and item.Name[1] or "Unknown"
                    local quantity = itemEntry.Count or 1

                    print(string.format("  Name: %s x%d", itemName, quantity))

                    count = count + 1
                else
                    print("  ERROR: GetItemById returned nil")
                end
            end
        end

        if count == 0 then
            print("\nNo items found. API might not be working correctly.")
        else
            print(string.format("\nFound %d items.", count))
        end

        e.blocked = true
        return true
    end

    if command_base == 'onmob_target' or command_base == 'onmob_list' then
        print(string.format("[%s] Info: This command is disabled. Beams are now automatic based on your active quest step.", addon.name))
        e.blocked = true
        return true

    elseif command_base == 'onmob_getpos' then
        local mem = AshitaCore:GetMemoryManager()
        if not mem then
            print(string.format("[%s] MemoryManager not available.", addon.name))
            e.blocked = true
            return true
        end

        if player_module.updatePosition(mem) then
            print(string.format("[%s] Player Position (Raw): X: %.2f, Y(Height): %.2f, Z(Depth): %.2f",
                addon.name, player_module.posX, player_module.posY_height, player_module.posZ_depth))
            print(string.format("[%s] For locations.lua: target_pos = { x = %.1f, y = %.1f, z = %.1f },",
                addon.name, player_module.posX, player_module.posZ_depth, player_module.posY_height))
        else
            print(string.format("[%s] Failed to get player position.", addon.name))
        end
        e.blocked = true
        return true

    elseif command_base == 'onmob_offset_x' then
        if args[2] then
            beam_drawing.PLAYER_ARC_START_X_OFFSET = tonumber(args[2]) or beam_drawing.PLAYER_ARC_START_X_OFFSET
            print(string.format("[%s] Player arc start X offset set to: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_X_OFFSET))
        else
            print(string.format("[%s] Current player arc start X offset: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_X_OFFSET))
        end
        e.blocked = true
        return true

    elseif command_base == 'onmob_offset_y' then
        if args[2] then
            beam_drawing.PLAYER_ARC_START_Y_OFFSET_ON_PLAYER = tonumber(args[2]) or beam_drawing.PLAYER_ARC_START_Y_OFFSET_ON_PLAYER
            print(string.format("[%s] Player arc start Y offset set to: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_Y_OFFSET_ON_PLAYER))
        else
            print(string.format("[%s] Current player arc start Y offset: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_Y_OFFSET_ON_PLAYER))
        end
        e.blocked = true
        return true

    elseif command_base == 'onmob_offset_z' then
        if args[2] then
            beam_drawing.PLAYER_ARC_START_Z_OFFSET = tonumber(args[2]) or beam_drawing.PLAYER_ARC_START_Z_OFFSET
            print(string.format("[%s] Player arc start Z offset set to: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_Z_OFFSET))
        else
            print(string.format("[%s] Current player arc start Z offset: %.2f", addon.name, beam_drawing.PLAYER_ARC_START_Z_OFFSET))
        end
        e.blocked = true
        return true
    end

    return false
end)

--------------------------------------------------------------------------------
-- Load Event
--------------------------------------------------------------------------------
ashita.events.register('load', 'load_callback', function()
    print(string.format("[%s] v%s loading...", addon.name, addon.version))

    -- Load all data
    quest_data = quest_data_loader.loadQuestData(addon.name)
    location_data = quest_data_loader.loadLocations(addon.name)
    zone_data = quest_data_loader.loadZones(addon.name)
    map_db = quest_data_loader.loadMaps(addon.name)

    -- Load floor mappings for multi-floor zones
    local floor_mappings_path = string.format('%sdata/floor_mappings.lua', addon.path)
    local success, loaded_mappings = pcall(loadfile, floor_mappings_path)
    if success and loaded_mappings then
        floor_mappings = loaded_mappings() or T{}
        print(string.format("[%s] Floor mappings loaded.", addon.name))
    else
        print(string.format("[%s] Warning: Could not load floor_mappings.lua", addon.name))
    end

    -- Load quest icon texture
    questIconTexture = helpers.getTexture(addon.path .. 'assets/quest_icon.png')
    if not questIconTexture then
        print(string.format("[%s] WARNING: Could not load 'assets/quest_icon.png'.", addon.name))
    end

    print(string.format("[%s] Data loaded. Use /questhelper to open.", addon.name))

    if ENABLE_VERBOSE_DEBUG then
        print(string.format("[%s] Player Arc Offsets: X=%.2f, Y=%.2f, Z=%.2f",
            addon.name, beam_drawing.PLAYER_ARC_START_X_OFFSET,
            beam_drawing.PLAYER_ARC_START_Y_OFFSET_ON_PLAYER,
            beam_drawing.PLAYER_ARC_START_Z_OFFSET))
    end
end)

--------------------------------------------------------------------------------
-- Unload Event
--------------------------------------------------------------------------------
ashita.events.register('unload', 'unload_callback', function()
    quest_state.save()
    print(string.format("[%s] Settings saved. Unloaded.", addon.name))
end)

--------------------------------------------------------------------------------
-- Packet Events
--------------------------------------------------------------------------------
ashita.events.register('packet_in', 'qh_packet_in_cb', function(e)
    -- Key item tracking (Packet 0x55)
    keyitem_module.handlePacket(e)

    triggers_module.handlePacketIn(e, currentTopCategory, currentSubfile, current_mission,
                                  quest_data, quest_state, step_trigger_flags)

    -- Kill tracking (Action packets)
    triggers_module.handleActionPacket(e, currentTopCategory, currentSubfile, current_mission,
                                      quest_data, quest_state, player_module.zoneId)
end)

--------------------------------------------------------------------------------
-- Text Events
--------------------------------------------------------------------------------
ashita.events.register('text_in', 'text_in_callback', function(e)
    player_module.name = triggers_module.handleTextIn(e, currentTopCategory, currentSubfile, current_mission,
                                                     quest_data, quest_state, step_trigger_flags,
                                                     player_module.name) or player_module.name

    -- Kill tracking via text messages
    if e.message_modified then
        local incoming_text = e.message_modified
        -- Remove FFXI color codes
        incoming_text = incoming_text:gsub('[\x1E\x1F].', '')
        incoming_text = incoming_text:gsub('[\xEF\x7F].', '')

        triggers_module.handleKillText(e, incoming_text, player_module.name, currentTopCategory, currentSubfile, current_mission,
                                      quest_data, quest_state, player_module.zoneId)
    end
end)
