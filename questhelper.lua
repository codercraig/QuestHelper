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
    else
        if shouldPrintDebugNow then
            print("["..addon.name.."] MemoryManager not ready.")
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
                                                    current_mission, step_idx, ENABLE_TRIGGER_DEBUG, player_module.zoneId) then
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
                      quest_data, quest_state, utils, inventory_cache)

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
                        player_module, zone_data, map_db)
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
