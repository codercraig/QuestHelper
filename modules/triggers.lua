-- Triggers module - Handles all quest step trigger logic
-- Includes: packet events, text chat, item obtains, zone entries, trigger zones
local triggers = {}

local ffi = require('ffi')

-- Helper: Cleans text by removing FFXI color codes and special characters
local function clean_text(text)
    if not text then return "" end
    local cleaned = text
    -- Strip standard FFXI colors (0x1E/0x1F + byte)
    cleaned = cleaned:gsub('[\x1E\x1F].', '')
    -- Strip auto-translate markers (0xEF/0x7F + byte)
    cleaned = cleaned:gsub('[\xEF\x7F].', '')
    -- Strip newlines/returns
    cleaned = cleaned:gsub('[\r\n]+', ' ')
    -- Trim whitespace
    return cleaned:match("^%s*(.-)%s*$")
end

-- Helper: Ensures nested key path exists
local function ensure_key_path(t, ...)
    local keys = {...}
    local current = t
    for _, key in ipairs(keys) do
        if not current[key] then
            current[key] = T{}
        end
        current = current[key]
    end
    return current
end

-- Helper: Calculate distance to line segment (for trigger zones)
local function distToSegmentSquared(p, v, w)
    local l2 = (v.x - w.x)^2 + (v.z - w.z)^2
    if l2 == 0 then return (p.x - v.x)^2 + (p.z - v.z)^2 end
    local t = ((p.x - v.x) * (w.x - v.x) + (p.z - v.z) * (w.z - v.z)) / l2
    t = math.max(0, math.min(1, t))
    local projX = v.x + t * (w.x - v.x)
    local projZ = v.z + t * (w.z - v.z)
    return (p.x - projX)^2 + (p.z - projZ)^2
end

-- Helper: Read uint16 from packet data
local function read_uint16(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256)
end

-- Helper: Read uint32 from packet data
local function read_uint32(ptr, offset)
    local p = ffi.cast('uint8_t*', ptr)
    return p[offset] + (p[offset+1] * 256) + (p[offset+2] * 65536) + (p[offset+3] * 16777216)
end

-- Chat modes to ignore (player-generated text)
local ignored_chat_modes = {
    [0] = true,  -- Say
    [1] = true,  -- Shout
    [3] = true,  -- Tell
    [4] = true,  -- Party
    [5] = true,  -- Linkshell
    [6] = true,  -- Emotes
    [8] = true,  -- Linkshell 2
    [26] = true, -- Yell
    [27] = true, -- Yell
}

-- Checks zone entry triggers
function triggers.checkZoneTrigger(step_data, playerZoneId, zone_data, quest_state, topCat, subfile, mission, step_idx)
    if step_data.zone_trigger and zone_data[step_data.zone_trigger] then
        local required_zone_id = zone_data[step_data.zone_trigger]

        -- Debug Print
        --print(string.format("\30\105[QH Debug]\30\01 Zone Trigger: '%s' (ID: %d) | Current Zone ID: %d | Match: %s",
        --    step_data.zone_trigger, required_zone_id, playerZoneId, tostring(playerZoneId == required_zone_id)))

        if playerZoneId == required_zone_id then
            quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
            return true
        end
    elseif step_data.zone_trigger then
        -- Debug: Zone name not found in zones.lua
        --print(string.format("\30\106[QH Warning]\30\01 Zone trigger '%s' not found in zones.lua", step_data.zone_trigger))
    end
    return false
end

-- Throttle debug output (print once every 10 seconds)
local last_trigger_debug_time = 0
local TRIGGER_DEBUG_INTERVAL = 10

-- Checks trigger zones (square/line regions player walks through)
function triggers.checkTriggerZones(step_data, playerPosX, playerPosZ_depth, quest_state, topCat, subfile, mission, step_idx, enable_debug, player_zone_id, zone_data)
    if type(step_data) == 'table' and step_data.trigger_zones then
        -- Check if we're in the correct zone before checking trigger collision
        local requiredZone = step_data.zone_name or step_data.zone
        if requiredZone and zone_data and zone_data[requiredZone] then
            local required_zone_id = zone_data[requiredZone]
            if player_zone_id ~= required_zone_id then
                -- Player is in wrong zone, don't check triggers
                return false
            end
        end

        local current_time = os.time()
        local should_debug = enable_debug and (current_time - last_trigger_debug_time) >= TRIGGER_DEBUG_INTERVAL

        for i, zone in ipairs(step_data.trigger_zones) do
            -- Square trigger zone
            if zone.type == 'square' and playerPosX and playerPosZ_depth and zone.center and zone.size then
                local half_size = zone.size / 2
                local dx = math.abs(playerPosX - zone.center.x)
                local dz = math.abs(playerPosZ_depth - zone.center.z)

                -- Debug: Show when checking zones (throttled)
                if should_debug then
                    print(string.format("\30\106[QH Debug]\30\01 Checking step %d, zone %d: Player(%.1f, %.1f) vs Center(%.1f, %.1f) | dx=%.1f<%.1f? dz=%.1f<%.1f?",
                        step_idx, i, playerPosX, playerPosZ_depth, zone.center.x, zone.center.z, dx, half_size, dz, half_size))
                    last_trigger_debug_time = current_time
                end

                if dx < half_size and dz < half_size then
                    -- Check if this zone switches maps
                    if zone.switch_to_map and player_zone_id then
                        quest_state.setCurrentMap(player_zone_id, zone.switch_to_map)
                    end

                    -- Check if we should complete the step (default: true)
                    local should_complete = zone.complete_step
                    if should_complete == nil then
                        should_complete = true
                    end

                    if should_complete then
                        --print(string.format("\30\105[QH]\30\01 Trigger Zone HIT! Completing step %d", step_idx))
                        quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                        return true
                    else
                        -- Just switched maps, don't complete step
                        return false
                    end
                end
            -- Line trigger zone
            elseif zone.type == 'line' and playerPosX and playerPosZ_depth and zone.start and zone.stop then
                local player_pos = { x = playerPosX, z = playerPosZ_depth }
                local distSq = distToSegmentSquared(player_pos, zone.start, zone.stop)
                local width = zone.width or 2
                if distSq < (width * width) then
                    -- Check if this zone switches maps
                    if zone.switch_to_map and player_zone_id then
                        quest_state.setCurrentMap(player_zone_id, zone.switch_to_map)
                    end

                    -- Check if we should complete the step (default: true)
                    local should_complete = zone.complete_step
                    if should_complete == nil then
                        should_complete = true
                    end

                    if should_complete then
                        print(string.format("\30\105[QH]\30\01 Line Trigger HIT! Completing step %d", step_idx))
                        quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                        return true
                    else
                        -- Just switched maps, don't complete step
                        return false
                    end
                end
            end
        end
    end
    return false
end

-- Handles packet_in events (0x034 or 0x032 - Event/Interaction packets)
function triggers.handlePacketIn(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, step_trigger_flags)
    if e.id ~= 0x034 and e.id ~= 0x032 then return end

    local event_id = read_uint16(e.data, 0x2C)
    local actor_id = read_uint32(e.data, 0x04)
    local param0   = read_uint32(e.data, 0x0C) -- The "Hidden" Message ID

    -- Debug Print
    if event_id > 0 or param0 > 0 then
        print(string.format("\30\105[QH Debug]\30\01 Event: %d | NPC: %d | Param0: %d", event_id, actor_id, param0))
    end

    if not currentTopCategory or not currentSubfile or not current_mission then return end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end

    local step_data = missionData.steps[step_idx]

    if type(step_data) == 'table' and step_data.trigger_on_event_id then
        local trigger = step_data.trigger_on_event_id
        local event_match = false

        -- Helper to check a specific ID against the packet data
        local function check_id(target_id)
            -- Case A: It's a standard Cutscene (EventID matches)
            if event_id == target_id then return true end
            -- Case B: It's a Text Interaction (Event=0, Param0 matches)
            if event_id == 0 and param0 == target_id then return true end
            return false
        end

        -- Handle Single Number vs List of Numbers
        if type(trigger) == 'table' then
            for _, id in ipairs(trigger) do
                if check_id(id) then event_match = true; break end
            end
        else
            event_match = check_id(trigger)
        end

        -- Check NPC ID (Optional)
        local npc_match = true
        if step_data.trigger_on_npc_id then
            npc_match = (actor_id == step_data.trigger_on_npc_id)
        end

        -- If ID matched (either Event or Param0), proceed
        if event_match and npc_match then
            local has_talk_trigger = (step_data.trigger_on_talk ~= nil)

            if not has_talk_trigger then
                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
            else
                local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                flags.event_complete = true
                if flags.talk_complete then
                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                end
            end
        end
    end
end

-- Handles text_in events (chat messages/dialogue)
function triggers.handleTextIn(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, step_trigger_flags, playerName)
    -- 1. Filter out Player Chat
    if ignored_chat_modes[e.mode] then return end

    -- 2. Validation
    if not currentTopCategory or not currentSubfile or not current_mission then return end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    local step_data = missionData.steps[step_idx]
    if not step_data or not e.message_modified then return end

    -- 3. Get Player Name if not set
    if playerName == "" then
        local p = GetPlayerEntity()
        if p then playerName = p.Name end
    end

    -- 4. Clean the message
    local incoming_text = clean_text(e.message_modified)

    if type(step_data) ~= 'table' then return end

    -- HANDLE: trigger_on_talk (Chat Dialogue)
    local raw_triggers = step_data.trigger_on_talk
    if raw_triggers then
        local triggers_list = {}
        if type(raw_triggers) == 'string' then
            table.insert(triggers_list, raw_triggers)
        elseif type(raw_triggers) == 'table' then
            triggers_list = raw_triggers
        end

        for _, raw_text in ipairs(triggers_list) do
            if type(raw_text) == 'string' and raw_text ~= "" then
                local processed_trigger = raw_text
                if playerName and playerName ~= "" then
                    processed_trigger = raw_text:gsub("{player_name}", playerName)
                end

                if incoming_text:find(processed_trigger, 1, true) then
                    local has_event_requirement = (step_data.trigger_on_event_id ~= nil)

                    if not has_event_requirement then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                    else
                        local flags = ensure_key_path(step_trigger_flags, currentTopCategory, currentSubfile, current_mission, step_idx)
                        flags.talk_complete = true
                        if flags.event_complete then
                            quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                        end
                    end
                    return playerName
                end
            end
        end
    end

    -- HANDLE: trigger_on_item_obtain (Drops OR Purchases - Supports List)
    local trigger_item_data = step_data.trigger_on_item_obtain

    if trigger_item_data then
        -- 1. Normalize into a list (table) so we can loop
        local items_to_check = {}
        if type(trigger_item_data) == 'string' then
            table.insert(items_to_check, trigger_item_data)
        elseif type(trigger_item_data) == 'table' then
            items_to_check = trigger_item_data
        end

        -- 2. Loop through every item in the list
        for _, current_item in ipairs(items_to_check) do
            -- Case A: Dropped / Synthesized Items
            local matched_drop = false
            if playerName ~= "" and
               incoming_text:find(playerName, 1, true) and
               incoming_text:find(current_item, 1, true) and
               incoming_text:find("obtains", 1, true) then
                matched_drop = true
            end

            -- Case B: Purchased Items
            local matched_buy = false
            if incoming_text:find("You buy", 1, true) and
               incoming_text:find(current_item, 1, true) then
                matched_buy = true
            end

            -- If matched, handle completion logic
            if matched_drop or matched_buy then
                -- Checklist logic
                if step_data.require_all_items then
                    quest_state.setPartialState(currentTopCategory, currentSubfile, current_mission, step_idx, current_item, true)

                    if quest_state.checkAllItemsComplete(currentTopCategory, currentSubfile, current_mission, step_idx, items_to_check) then
                        quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                    end
                else
                    quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, step_trigger_flags)
                end
                break
            end
        end
    end

    return playerName
end

-- Handles kill tracking via text messages ("{player} defeats the {enemy}")
function triggers.handleKillText(e, incoming_text, playerName, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, playerZoneId)
    if not currentTopCategory or not currentSubfile or not current_mission then return end
    if not playerName or playerName == "" then return end

    -- CRITICAL: Filter out player-generated chat to prevent fake messages from counting
    -- Only count system messages (combat log)
    if ignored_chat_modes[e.mode] then
        return -- Ignore player chat (say/shout/tell/party/linkshell)
    end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end

    local step_data = missionData.steps[step_idx]

    -- Check if this step has kill requirements
    if not step_data.kill_requirement then return end

    local kill_req = step_data.kill_requirement

    -- Check zone requirement
    if kill_req.zone and playerZoneId then
        local zone_data = require('data.zones')
        local required_zone_id = zone_data[kill_req.zone]
        if required_zone_id and playerZoneId ~= required_zone_id then
            return -- Not in the required zone
        end
    end

    -- Build list of valid names to check (player + party members if enabled)
    local valid_names = {playerName}

    -- If count_party_kills is enabled, add party member names
    if kill_req.count_party_kills then
        if AshitaCore then
            local memManager = AshitaCore:GetMemoryManager()
            if memManager then
                local party = memManager:GetParty()
                if party then
                    -- Party positions 0-5 (0 = player, 1-5 = party members)
                    for i = 1, 5 do
                        local member_id = party:GetMemberServerId(i)
                        if member_id and member_id ~= 0 then
                            local member_name = party:GetMemberName(i)
                            if member_name and member_name ~= "" then
                                table.insert(valid_names, member_name)
                            end
                        end
                    end
                end
            end
        end
    end

    -- Look for "{name} defeats the" or "{name} defeats" for any valid name
    local enemy_name = nil
    local killer_name = nil

    for _, name in ipairs(valid_names) do
        local defeat_pattern_1 = name .. " defeats the "
        local defeat_pattern_2 = name .. " defeats "

        -- Try pattern 1: "Name defeats the Enemy"
        local start_pos = incoming_text:find(defeat_pattern_1, 1, true)
        if start_pos then
            enemy_name = incoming_text:sub(start_pos + #defeat_pattern_1)
            enemy_name = enemy_name:gsub("%.$", "")
            killer_name = name
            break
        else
            -- Try pattern 2: "Name defeats Enemy"
            start_pos = incoming_text:find(defeat_pattern_2, 1, true)
            if start_pos then
                enemy_name = incoming_text:sub(start_pos + #defeat_pattern_2)
                enemy_name = enemy_name:gsub("%.$", "")
                killer_name = name
                break
            end
        end
    end

    if enemy_name then
        local who = killer_name or "Unknown"
        print(string.format("\30\106[QH Debug]\30\01 Kill detected: %s defeated '%s'", who, enemy_name))

        -- Check if enemy name matches requirements
        local name_match = false
        if kill_req.enemies and #kill_req.enemies > 0 then
            for _, required_enemy in ipairs(kill_req.enemies) do
                if enemy_name:lower():find(required_enemy:lower(), 1, true) then
                    name_match = true
                    break
                end
            end
            if not name_match then
                print(string.format("\30\106[QH Debug]\30\01 Enemy '%s' doesn't match required: %s",
                    enemy_name, table.concat(kill_req.enemies, ", ")))
            end
        else
            -- No specific enemies required, count any kill
            name_match = true
        end

        if name_match then
            -- Increment kill counter
            local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, step_idx) or 0
            current_count = current_count + 1
            quest_state.setKillCount(currentTopCategory, currentSubfile, current_mission, step_idx, current_count)

            -- Success message - show who got the kill if not the player
            local kill_credit = killer_name ~= playerName and (" by " .. killer_name) or ""
            print(string.format("\30\106[QH]\30\01 Kill Tracked: %s%s (%d/%d)",
                enemy_name, kill_credit, current_count, kill_req.count))

            -- Check if requirement met
            if current_count >= kill_req.count then
                quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, nil)
                print(string.format("\30\106[QH]\30\01 Kill requirement complete! (%d/%d)",
                    current_count, kill_req.count))
            end
        end
    end
end

-- Handles action packets for kill tracking (0x028 - Action Packet)
function triggers.handleActionPacket(e, currentTopCategory, currentSubfile, current_mission, quest_data, quest_state, playerZoneId)
    if e.id ~= 0x028 then return end

    if not currentTopCategory or not currentSubfile or not current_mission then return end

    local missionData = quest_data[currentTopCategory][currentSubfile][current_mission]
    if not missionData or not missionData.steps then return end

    local step_idx = quest_state.getCurrentStep(currentTopCategory, currentSubfile, current_mission, quest_data)
    if not missionData.steps[step_idx] then return end

    local step_data = missionData.steps[step_idx]

    -- Check if this step has kill requirements
    if not step_data.kill_requirement then return end

    local kill_req = step_data.kill_requirement

    -- Debug: Show we're tracking kills
    local zone_data = require('data.zones')
    local required_zone_id = kill_req.zone and zone_data[kill_req.zone]
    print(string.format("\30\105[QH Debug]\30\01 Kill tracking active | Zone: %s (Req: %s, ID: %s) | Current Zone: %s",
        kill_req.zone or "ANY",
        required_zone_id or "N/A",
        tostring(required_zone_id),
        tostring(playerZoneId)))

    -- Check zone requirement
    if kill_req.zone and playerZoneId then
        if required_zone_id and playerZoneId ~= required_zone_id then
            print(string.format("\30\106[QH Debug]\30\01 Wrong zone! Need %s (ID: %d), in zone ID: %d",
                kill_req.zone, required_zone_id, playerZoneId))
            return -- Not in the required zone
        end
    end

    -- Parse action packet
    local actor_id = read_uint32(e.data, 0x04)
    local target_count = e.data:byte(0x09)

    -- Debug: Show raw packet header bytes
    local byte_04 = e.data:byte(0x04)
    local byte_08 = e.data:byte(0x08)
    local byte_09 = e.data:byte(0x09)
    local byte_0A = e.data:byte(0x0A)

    print(string.format("\30\105[QH Debug]\30\01 Packet Bytes: [0x04]=%d [0x08]=%d [0x09]=%d [0x0A]=%d",
        byte_04 or 0, byte_08 or 0, byte_09 or 0, byte_0A or 0))

    -- Get player server ID to check if this is the player's action
    local player_entity = GetPlayerEntity()
    local player_id = player_entity and player_entity.ServerId or 0

    print(string.format("\30\105[QH Debug]\30\01 Action Packet: Actor=%d (Player ID=%d) | Targets=%d",
        actor_id, player_id, target_count))

    -- If no targets, skip
    if target_count == 0 then
        print(string.format("\30\106[QH Debug]\30\01 No targets in packet, skipping"))
        return
    end

    -- Check if we should count party/trust kills
    local count_all_party = kill_req.count_party_kills or false

    -- For now, let's not filter by player to see if we can detect ANY kills
    -- TODO: Re-enable player filtering once we confirm kills are detected
    -- if not count_all_party and actor_id ~= player_id then
    --     print(string.format("\30\106[QH Debug]\30\01 Not player's kill (Actor: %d, Player: %d), skipping", actor_id, player_id))
    --     return
    -- end

    print(string.format("\30\105[QH Debug]\30\01 Checking %d targets...", target_count))

    -- Check each target in the action packet
    for i = 0, target_count - 1 do
        local target_offset = 0x10 + (i * 0x24)
        local target_id = read_uint32(e.data, target_offset)
        local action_count = e.data:byte(target_offset + 0x04)

        -- Safety check: action_count can be nil if offset is invalid
        if not action_count then
            break
        end

        -- Check each action on the target
        for j = 0, action_count - 1 do
            local action_offset = target_offset + 0x08 + (j * 0x08)
            local msg_byte1 = e.data:byte(action_offset + 0x05)
            local msg_byte2 = e.data:byte(action_offset + 0x06)

            -- Safety check: bytes can be nil if offset is invalid
            if not msg_byte1 or not msg_byte2 then
                break
            end

            local message_id = msg_byte1 + (msg_byte2 * 256)

            --print(string.format("\30\105[QH Debug]\30\01 Message ID: %d | Target ID: %d", message_id, target_id))

            -- Message IDs for defeating enemies:
            -- 6 = defeats target
            -- 20 = falls to the ground (also defeat)
            if message_id == 6 or message_id == 20 then
                -- Get target entity
                local target = GetEntity(target_id)
                if target then
                    local target_name = target.Name
                    print(string.format("\30\106[QH Debug]\30\01 Defeat detected! Enemy: %s", target_name))

                    -- Check if we need to match specific enemy names
                    local name_match = false
                    if kill_req.enemies and #kill_req.enemies > 0 then
                        for _, enemy_name in ipairs(kill_req.enemies) do
                            if target_name:lower():find(enemy_name:lower(), 1, true) then
                                name_match = true
                                break
                            end
                        end
                        if not name_match then
                            print(string.format("\30\106[QH Debug]\30\01 Enemy '%s' doesn't match required: %s",
                                target_name, table.concat(kill_req.enemies, ", ")))
                        end
                    else
                        -- No specific enemies required, count any kill
                        name_match = true
                    end

                    if name_match then
                        -- Increment kill counter
                        local current_count = quest_state.getKillCount(currentTopCategory, currentSubfile, current_mission, step_idx) or 0
                        current_count = current_count + 1
                        quest_state.setKillCount(currentTopCategory, currentSubfile, current_mission, step_idx, current_count)

                        -- Debug print
                        print(string.format("\30\106[QH]\30\01 Kill Tracked: %s (%d/%d)",
                            target_name, current_count, kill_req.count))

                        -- Check if requirement met
                        if current_count >= kill_req.count then
                            quest_state.setStepState(currentTopCategory, currentSubfile, current_mission, step_idx, true, nil)
                            print(string.format("\30\106[QH]\30\01 Kill requirement complete! (%d/%d)",
                                current_count, kill_req.count))
                        end
                    else
                        print(string.format("\30\106[QH Debug]\30\01 Enemy name mismatch, not counting"))
                    end
                else
                    print(string.format("\30\106[QH Debug]\30\01 Could not get entity for target ID: %d", target_id))
                end
            end
        end
    end
end

return triggers
