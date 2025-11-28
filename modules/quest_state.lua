-- Quest state management module
-- Handles step completion, progress tracking, and partial item states
local quest_state = {}

local settings = require('settings')

local QUESTHELPER_ALIAS = 'QuestHelper_settings'
local default_settings = T{
    step_states = T{},
    partial_progress = T{},
    kill_counts = T{}
}

-- Load settings
quest_state.settings = settings.load(default_settings, QUESTHELPER_ALIAS)

-- Ensure a nested key path exists in a table
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

-- Gets the completion state of a specific step
function quest_state.getStepState(topCat, subfile, mission, step)
    local path = ensure_key_path(quest_state.settings.step_states, topCat, subfile, mission)
    return path[step] or false
end

-- Sets the completion state of a specific step
function quest_state.setStepState(topCat, subfile, mission, step, state, step_trigger_flags)
    -- Clear any existing trigger flags for this specific step to ensure a clean state
    if step_trigger_flags and step_trigger_flags[topCat] and
       step_trigger_flags[topCat][subfile] and
       step_trigger_flags[topCat][subfile][mission] then
        step_trigger_flags[topCat][subfile][mission][step] = nil
    end

    local path = ensure_key_path(quest_state.settings.step_states, topCat, subfile, mission)
    path[step] = state
    print(string.format("Saving step: %s -> %s -> %s -> Step %d = %s",
        topCat, subfile, mission, step, tostring(state)))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Gets the partial completion state for a checklist item
function quest_state.getPartialState(cat, sub, mis, step, item_name)
    local path = ensure_key_path(quest_state.settings.partial_progress, cat, sub, mis, step)
    return path[item_name:lower()] or false
end

-- Sets the partial completion state for a checklist item
function quest_state.setPartialState(cat, sub, mis, step, item_name, state)
    local path = ensure_key_path(quest_state.settings.partial_progress, cat, sub, mis, step)
    path[item_name:lower()] = state
    print(string.format("\30\105[QuestHelper] Checked item: %s", item_name))
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Checks if all items in a checklist are complete
function quest_state.checkAllItemsComplete(cat, sub, mis, step, required_list)
    for _, item in ipairs(required_list) do
        if not quest_state.getPartialState(cat, sub, mis, step, item) then
            return false
        end
    end
    return true
end

-- Gets the kill count for a step
function quest_state.getKillCount(cat, sub, mis, step)
    local path = ensure_key_path(quest_state.settings.kill_counts, cat, sub, mis)
    return path[step] or 0
end

-- Sets the kill count for a step
function quest_state.setKillCount(cat, sub, mis, step, count)
    local path = ensure_key_path(quest_state.settings.kill_counts, cat, sub, mis)
    path[step] = count
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

-- Gets the current (first incomplete) step for a mission
function quest_state.getCurrentStep(topCat, subfile, mission, quest_data)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then
        return 1
    end
    for i = 1, #mdata.steps do
        if not quest_state.getStepState(topCat, subfile, mission, i) then
            return i
        end
    end
    return #mdata.steps + 1
end

-- Checks if an entire subfile is complete
function quest_state.isSubfileComplete(topCat, subfile, quest_data)
    local fileData = quest_data[topCat] and quest_data[topCat][subfile]
    if not fileData then return false end
    for mission_name, mission_data in pairs(fileData) do
        local steps = mission_data.steps or {}
        for i = 1, #steps do
            if not quest_state.getStepState(topCat, subfile, mission_name, i) then
                return false
            end
        end
    end
    return true
end

-- Checks if a specific mission is complete
function quest_state.isMissionComplete(topCat, subfile, mission, quest_data)
    local mission_data = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mission_data then return false end
    local steps = mission_data.steps or {}
    for i = 1, #steps do
        if not quest_state.getStepState(topCat, subfile, mission, i) then
            return false
        end
    end
    return true
end

-- Calculates progress percentage for a mission
function quest_state.calculateProgress(topCat, subfile, mission, quest_data)
    local mdata = quest_data[topCat][subfile][mission]
    local steps = mdata.steps or {}
    local completed = 0
    for i = 1, #steps do
        if quest_state.getStepState(topCat, subfile, mission, i) then
            completed = completed + 1
        end
    end
    local total = #steps
    local pct = 0
    if total > 0 then
        pct = (completed / total) * 100
    end
    return pct, completed, total
end

-- Saves settings to disk
function quest_state.save()
    settings.save(QUESTHELPER_ALIAS, quest_state.settings)
end

return quest_state
