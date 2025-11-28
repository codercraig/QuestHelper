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
        if playerZoneId == zone_data[step_data.zone_trigger] then
            quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
            return true
        end
    end
    return false
end

-- Checks trigger zones (square/line regions player walks through)
function triggers.checkTriggerZones(step_data, playerPosX, playerPosZ_depth, quest_state, topCat, subfile, mission, step_idx)
    if type(step_data) == 'table' and step_data.trigger_zones then
        for _, zone in ipairs(step_data.trigger_zones) do
            -- Square trigger zone
            if zone.type == 'square' and playerPosX and playerPosZ_depth and zone.center and zone.size then
                local half_size = zone.size / 2
                if math.abs(playerPosX - zone.center.x) < half_size and
                   math.abs(playerPosZ_depth - zone.center.z) < half_size then
                    quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                    return true
                end
            -- Line trigger zone
            elseif zone.type == 'line' and playerPosX and playerPosZ_depth and zone.start and zone.stop then
                local player_pos = { x = playerPosX, z = playerPosZ_depth }
                local distSq = distToSegmentSquared(player_pos, zone.start, zone.stop)
                local width = zone.width or 2
                if distSq < (width * width) then
                    quest_state.setStepState(topCat, subfile, mission, step_idx, true, nil)
                    return true
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

return triggers
