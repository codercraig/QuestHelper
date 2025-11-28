-- Utility functions module
local utils = {}

-- Text wrapping for UI display
function utils.wrap_text(text, max_length)
    local wrapped_text = {}
    for line in text:gmatch("[^\r\n]+") do
        local start = 1
        while start <= #line do
            local next_break = start + max_length - 1
            if next_break >= #line then
                table.insert(wrapped_text, line:sub(start))
                break
            end
            local space_pos = line:sub(start, next_break):match("^.*() ") or max_length
            table.insert(wrapped_text, line:sub(start, start + space_pos - 1))
            start = start + space_pos
        end
    end
    return table.concat(wrapped_text, "\n")
end

-- Returns sorted keys from a table
function utils.get_sorted_keys(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    return keys
end

-- Gets images for a specific quest step
function utils.get_images_for_step(topCat, subfile, mission, stepIndex, quest_data)
    local mdata = quest_data[topCat] and quest_data[topCat][subfile] and quest_data[topCat][subfile][mission]
    if not mdata or not mdata.steps then return {} end
    local step_data = mdata.steps[stepIndex]
    if type(step_data) == 'table' and step_data.images then
        local matched = {}
        for _, image_info in ipairs(step_data.images) do
            if (image_info.state == stepIndex) or (image_info.state == nil) then
                table.insert(matched, image_info)
            end
        end
        return matched
    end
    return {}
end

return utils
