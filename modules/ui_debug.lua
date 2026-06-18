-- Debug ImGui window — visible only when Developer Mode is enabled.
-- Tab 1 "Log"      : redirected QH debug messages (no chat spam)
-- Tab 2 "Position" : live coords + visual_zone entry builder
-- Tab 3 "Target"   : live target NPC coords + locations.lua entry builder
--
-- Coordinate note: posY_height = horizontal Z (depth), posZ_depth = elevation Y.
-- Data format:  x = posX,  y = posZ_depth (elev),  z = posY_height (horiz).
local ui_debug = {}

local imgui = require('imgui')

local ImGuiCond_FirstUseEver = 2

-- ── Log state ─────────────────────────────────────────────────────────────────
local MAX_LINES   = 200
local log_lines   = {}
local auto_scroll = true

-- ── Position/floor cache ──────────────────────────────────────────────────────
local POS_INTERVAL   = 2.0
local FLOOR_INTERVAL = 5.0
local lastPosTime    = 0
local lastFloorTime  = 0

local cache = {
    pos   = { x = 0.0, y = 0.0, z = 0.0, zone = 0, zone_name = "..." },
    floor = { raw = nil, mapped = nil, saved = 0 },
    target = { name = "none", x = 0.0, y = 0.0, z = 0.0, valid = false },
}

-- ── Visual-zone builder (Position tab) ───────────────────────────────────────
local viz = {
    entry_type  = 'arrow',
    direction   = 'up',
    colour      = 'cyan',
    size        = 4,
    floor_id    = 0,
    use_target  = false,   -- true = NPC target pos, false = player pos
    vertical    = false,   -- square only: upright panel using NPC elevation
    vertical_z  = false,   -- square+vertical only: rotate 90° to face E/W instead of N/S
    entries     = {},
}
local DIRECTIONS = { 'up', 'down', 'left', 'right', 'ne', 'nw', 'se', 'sw' }
local COLOURS    = { 'cyan', 'yellow', 'white', 'orange', 'red', 'green', 'blue', 'magenta', 'purple', 'pink' }

-- ── Validate tab state ───────────────────────────────────────────────────────
local val = {
    quest_data    = nil,
    zone_data_ref = nil,
    ran           = false,
    checked       = 0,
    errors        = {},
    passing       = {},
    show_errors   = true,
    show_ok       = true,
}

function ui_debug.setValidateData(quest_data, connections, _floor_maps, zd)
    val.quest_data    = quest_data
    val.connections   = connections
    val.zone_data_ref = zd
end

local function run_validate()
    val.errors  = {}
    val.passing = {}
    val.checked = 0
    val.ran     = true

    if not val.quest_data then
        table.insert(val.errors, "Validate data not initialised — reload the addon.")
        return
    end

    local function chk_zone(zn, ctx, errs)
        if not zn then return end
        local in_zones = val.zone_data_ref and val.zone_data_ref[zn]
        local in_conns = val.connections and val.connections[zn]
        if not in_zones and not in_conns then
            table.insert(errs, 'unknown zone "' .. zn .. '" (' .. ctx .. ')')
        end
    end

    for category, subfiles in pairs(val.quest_data) do
        for subfile, missions in pairs(subfiles) do
            for mission_name, mission in pairs(missions) do
                local mission_errors = {}
                local label = category .. '/' .. subfile .. ' > "' .. mission_name .. '"'

                for si, step in ipairs(mission.steps or {}) do
                    val.checked = val.checked + 1
                    local ctx = 'step ' .. si

                    if step.route_to then
                        chk_zone(step.route_to, ctx .. ' route_to', mission_errors)
                    end
                    if step.zone_trigger then
                        chk_zone(step.zone_trigger, ctx .. ' zone_trigger', mission_errors)
                    end
                    for _, img in ipairs(step.images or {}) do
                        chk_zone(img.zone_name or img.zone, ctx .. ' image zone_name', mission_errors)
                    end
                    if step.kill_requirement and step.kill_requirement.zone then
                        chk_zone(step.kill_requirement.zone, ctx .. ' kill_requirement', mission_errors)
                    end
                end

                if #mission_errors > 0 then
                    table.insert(val.errors, { label = label, issues = mission_errors })
                else
                    table.insert(val.passing, label)
                end
            end
        end
    end
end

-- ── Line builder (Position tab) ───────────────────────────────────────────────
local lin = {
    start_pos = nil,   -- { x, y, z } once set
    stop_pos  = nil,   -- { x, y, z } once set
}

-- ── locations.lua builder (Target tab) ───────────────────────────────────────
local loc = {
    visual_mode  = 'arc',
    floor_id     = 0,
    max_distance = 35,
    use_target   = true,   -- true = NPC pos, false = player pos
    entries      = {},
    key_buf      = { "" },
    last_target_name = "",
}
local VISUAL_MODES = { 'arc', 'beacon' }

-- ── Helpers ───────────────────────────────────────────────────────────────────
local function strip_colors(s)
    return (tostring(s):gsub('\30.', ''))
end

local function zone_name_lookup(zone_data, zone_id)
    if zone_data then
        for name, id in pairs(zone_data) do
            if id == zone_id then return name end
        end
    end
    return "Zone " .. tostring(zone_id)
end

local function slugify(s)
    return tostring(s):lower():gsub("[%s']+", "-"):gsub("[^%w%-]", "")
end

-- Gets current target entity; returns nil if no target.
local function get_target_entity()
    -- Try the Ashita 4 global first (same pattern as GetPlayerEntity)
    if GetTargetEntity then
        local t = GetTargetEntity()
        if t and t.Name and t.Name ~= "" then return t end
    end
    -- Fallback: memory manager path
    local ok, result = pcall(function()
        local mem = AshitaCore:GetMemoryManager()
        if not mem then return nil end
        local tmgr = mem:GetTarget()
        if not tmgr then return nil end
        local tidx = tmgr:GetTargetIndex(0)
        if not tidx or tidx == 0 or tidx == 0xFFFF then return nil end
        return GetEntity(tidx)
    end)
    return ok and result or nil
end

-- Push a highlighted (active) button style.
local function push_active_style()
    imgui.PushStyleColor(ImGuiCol_Button,        { 0.15, 0.50, 0.85, 1.0 })
    imgui.PushStyleColor(ImGuiCol_ButtonHovered, { 0.20, 0.60, 0.95, 1.0 })
end

local function toggle_btn(label, active)
    if active then push_active_style() end
    local clicked = imgui.Button(label)
    if active then imgui.PopStyleColor(2) end
    return clicked
end

-- ── Public API ────────────────────────────────────────────────────────────────
function ui_debug.addLine(msg)
    local clean = strip_colors(msg)
    table.insert(log_lines, os.date("[%H:%M:%S] ") .. clean)
    if #log_lines > MAX_LINES then table.remove(log_lines, 1) end
    auto_scroll = true
end

-- ── Tab 1: Log ────────────────────────────────────────────────────────────────
local function render_log_tab()
    if imgui.Button("Clear Log") then log_lines = {} end
    imgui.SameLine()
    local s = { auto_scroll }
    if imgui.Checkbox("Auto-scroll", s) then auto_scroll = s[1] end
    imgui.Separator()
    imgui.BeginChild("QHLog", { 0, 0 }, false, 0)
    for _, line in ipairs(log_lines) do
        imgui.Text(line)
    end
    if auto_scroll then imgui.SetScrollHereY(1.0) end
    imgui.EndChild()
end

-- ── Tab 2: Position + visual_zone builder ────────────────────────────────────
local function render_position_tab()
    local p = cache.pos
    local f = cache.floor

    imgui.Text(string.format("Zone:  %s  (ID: %d)", p.zone_name, p.zone))
    imgui.Text(string.format("X: %8.2f    Y (elev): %8.2f    Z (horiz): %8.2f",
        p.x, p.y, p.z))
    local rs = f.raw    ~= nil and tostring(f.raw)    or "N/A"
    local ms = f.mapped ~= nil and tostring(f.mapped) or "N/A"
    imgui.Text(string.format("Floor  raw: %s    mapped: %s    saved map: %d",
        rs, ms, f.saved))

    imgui.Separator()
    imgui.Text("Visual Zone Entry Builder")
    imgui.Separator()

    -- Pos source
    local t = cache.target
    imgui.Text("Pos source:"); imgui.SameLine()
    if toggle_btn("My Position##vsrc", not viz.use_target) then viz.use_target = false end
    imgui.SameLine()
    if toggle_btn("NPC Target##vsrc",      viz.use_target) then viz.use_target = true  end
    local src_x, src_y, src_z
    if viz.use_target and t.valid then
        local use_npc_y = viz.vertical and viz.entry_type == 'square'
        src_x = t.x
        src_y = use_npc_y and t.y or p.y
        src_z = t.z
        local y_label = use_npc_y and "NPC elev" or "player elev"
        imgui.Text(string.format("  Using:  %s  X=%.2f  Y=%.2f (%s)  Z=%.2f", t.name, src_x, src_y, y_label, src_z))
    else
        src_x, src_y, src_z = p.x, p.y, p.z
        imgui.Text(string.format("  Using:  Player  X=%.2f  Y=%.2f  Z=%.2f", src_x, src_y, src_z))
    end

    -- Type
    imgui.Text("Type:"); imgui.SameLine()
    if toggle_btn("Arrow##vt",  viz.entry_type == 'arrow')  then viz.entry_type = 'arrow'  end
    imgui.SameLine()
    if toggle_btn("Square##vt", viz.entry_type == 'square') then viz.entry_type = 'square' end
    imgui.SameLine()
    if toggle_btn("Line##vt",   viz.entry_type == 'line')   then viz.entry_type = 'line'   end
    if viz.entry_type == 'square' then
        imgui.SameLine()
        if toggle_btn("Vertical##vt", viz.vertical) then
            viz.vertical = not viz.vertical
            if not viz.vertical then viz.vertical_z = false end
        end
        if viz.vertical then
            imgui.SameLine()
            if toggle_btn("Rotated##vt", viz.vertical_z) then viz.vertical_z = not viz.vertical_z end
        end
    end

    if viz.entry_type ~= 'line' then
        -- Colour (split into 2 lines for readability)
        imgui.Text("Colour:")
        imgui.SameLine()
        for i = 1, 4 do
            if i > 1 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end
        imgui.Text("       ")  -- indent to match label above
        imgui.SameLine()
        for i = 5, #COLOURS do
            if i > 5 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end

        -- Direction (arrow only) - two rows of 4
        if viz.entry_type == 'arrow' then
            imgui.Text("Direction:")
            imgui.SameLine()
            for i = 1, 4 do
                if i > 1 then imgui.SameLine() end
                if toggle_btn(DIRECTIONS[i], viz.direction == DIRECTIONS[i]) then viz.direction = DIRECTIONS[i] end
            end
            imgui.Text("          ")
            imgui.SameLine()
            for i = 5, 8 do
                if i > 5 then imgui.SameLine() end
                if toggle_btn(DIRECTIONS[i], viz.direction == DIRECTIONS[i]) then viz.direction = DIRECTIONS[i] end
            end
        end

        -- Size / Floor ID
        imgui.Text("Size:"); imgui.SameLine()
        if imgui.Button(" - ##vs") then viz.size = math.max(1, viz.size - 1) end
        imgui.SameLine(); imgui.Text(string.format("%d", viz.size)); imgui.SameLine()
        if imgui.Button(" + ##vs") then viz.size = viz.size + 1 end

        imgui.SameLine(); imgui.Text("   Floor ID:"); imgui.SameLine()
        if imgui.Button(" - ##vf") then viz.floor_id = math.max(0, viz.floor_id - 1) end
        imgui.SameLine(); imgui.Text(string.format("%d", viz.floor_id)); imgui.SameLine()
        if imgui.Button(" + ##vf") then viz.floor_id = viz.floor_id + 1 end
    else
        -- Colour (line shares same colour picker)
        imgui.Text("Colour:")
        imgui.SameLine()
        for i = 1, 4 do
            if i > 1 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end
        imgui.Text("       ")
        imgui.SameLine()
        for i = 5, #COLOURS do
            if i > 5 then imgui.SameLine() end
            if toggle_btn(COLOURS[i], viz.colour == COLOURS[i]) then viz.colour = COLOURS[i] end
        end

        -- Floor ID (line)
        imgui.Text("Floor ID:"); imgui.SameLine()
        if imgui.Button(" - ##lf") then viz.floor_id = math.max(0, viz.floor_id - 1) end
        imgui.SameLine(); imgui.Text(string.format("%d", viz.floor_id)); imgui.SameLine()
        if imgui.Button(" + ##lf") then viz.floor_id = viz.floor_id + 1 end

        -- Line: Set Start / Set End
        if imgui.Button("Set Start##lb") then lin.start_pos = { x = src_x, y = src_y, z = src_z } end
        imgui.SameLine()
        if imgui.Button("Set End##lb")   then lin.stop_pos  = { x = src_x, y = src_y, z = src_z } end

        if lin.start_pos then
            imgui.Text(string.format("  Start:  X=%.2f  Y=%.2f  Z=%.2f", lin.start_pos.x, lin.start_pos.y, lin.start_pos.z))
        else
            imgui.Text("  Start:  (not set)")
        end
        if lin.stop_pos then
            imgui.Text(string.format("  End:    X=%.2f  Y=%.2f  Z=%.2f", lin.stop_pos.x, lin.stop_pos.y, lin.stop_pos.z))
        else
            imgui.Text("  End:    (not set)")
        end
    end

    -- Actions
    imgui.Separator()
    local add_lbl = viz.entry_type == 'arrow' and "+ Add Arrow##v"
                 or viz.entry_type == 'line'  and "+ Add Line##v"
                 or "+ Add Square##v"
    if imgui.Button(add_lbl) then
        local entry
        if viz.entry_type == 'square' then
            local vert_str = viz.vertical and ", vertical = true" or ""
            local rot_str  = (viz.vertical and viz.vertical_z) and ", vertical_axis = 'z'" or ""
            entry = string.format(
                "    { zone_name = %q, type = 'square', center = { x = %.1f, y = %.1f, z = %.1f }, size = %d, floor_id = %d, colour = %q%s%s },",
                p.zone_name, src_x, src_y, src_z, viz.size, viz.floor_id, viz.colour, vert_str, rot_str)
        elseif viz.entry_type == 'line' then
            if lin.start_pos and lin.stop_pos then
                entry = string.format(
                    "    { zone_name = %q, type = 'line', start = { x = %.1f, y = %.1f, z = %.1f }, stop = { x = %.1f, y = %.1f, z = %.1f }, floor_id = %d, colour = %q },",
                    p.zone_name,
                    lin.start_pos.x, lin.start_pos.y, lin.start_pos.z,
                    lin.stop_pos.x,  lin.stop_pos.y,  lin.stop_pos.z, viz.floor_id, viz.colour)
                lin.start_pos = nil
                lin.stop_pos  = nil
            end
        else
            entry = string.format(
                "    { zone_name = %q, type = 'arrow', center = { x = %.1f, y = %.1f, z = %.1f }, size = %d, direction = %q, floor_id = %d, colour = %q },",
                p.zone_name, src_x, src_y, src_z, viz.size, viz.direction, viz.floor_id, viz.colour)
        end
        if entry then table.insert(viz.entries, entry) end
    end
    imgui.SameLine()
    if imgui.Button(string.format("Copy All (%d)##vc", #viz.entries)) then
        if #viz.entries > 0 then
            imgui.SetClipboardText(table.concat(viz.entries, "\n"))
        end
    end
    imgui.SameLine()
    if imgui.Button("Clear##vc") then viz.entries = {} end

    -- Preview
    if #viz.entries > 0 then
        imgui.Separator()
        imgui.Text(string.format("%d entries — hit 'Copy All' to grab:", #viz.entries))
        imgui.BeginChild("QHViz", { 0, 0 }, true, 0)
        for _, line in ipairs(viz.entries) do
            imgui.TextWrapped(line)
        end
        imgui.EndChild()
    end
end

-- ── Tab 4: Validate ──────────────────────────────────────────────────────────
local function render_validate_tab()
    if imgui.Button("Run Validation") then run_validate() end

    if val.ran then
        imgui.SameLine()
        imgui.Text(string.format("%d steps   %d mission(s) with errors   %d OK",
            val.checked, #val.errors, #val.passing))

        imgui.Separator()

        -- Filter toggles
        if toggle_btn(string.format("Errors (%d)##vfe",  #val.errors),  val.show_errors) then
            val.show_errors = not val.show_errors
        end
        imgui.SameLine()
        if toggle_btn(string.format("OK (%d)##vfo", #val.passing), val.show_ok) then
            val.show_ok = not val.show_ok
        end
    end

    imgui.Separator()
    imgui.BeginChild("QHValidate", { 0, 0 }, false, 0)

    if not val.ran then
        imgui.Text("Click 'Run Validation' to check data integrity.")
    elseif #val.errors == 0 then
        imgui.TextColored({ 0.2, 0.9, 0.2, 1.0 }, "All missions OK — no issues found.")
    else
        if val.show_errors then
            for _, entry in ipairs(val.errors) do
                imgui.TextColored({ 1.0, 0.4, 0.4, 1.0 }, entry.label)
                for _, issue in ipairs(entry.issues) do
                    imgui.Text("    " .. issue)
                end
                imgui.Separator()
            end
        end
        if val.show_ok then
            for _, label in ipairs(val.passing) do
                imgui.TextColored({ 0.3, 0.85, 0.3, 1.0 }, "OK  " .. label)
            end
        end
    end

    imgui.EndChild()
end

-- ── Tab 3: Target + locations.lua builder ────────────────────────────────────
local function render_target_tab()
    local t = cache.target
    local p = cache.pos

    -- Live target info
    if t.valid then
        imgui.Text(string.format("Target:  %s", t.name))
        imgui.Text(string.format("X: %8.2f    Y (elev): %8.2f    Z (horiz): %8.2f",
            t.x, t.y, t.z))
    else
        imgui.Text("Target:  (none — select an NPC)")
        imgui.Text("")
    end

    imgui.Separator()
    imgui.Text("locations.lua Entry Builder")
    imgui.Separator()

    -- Pos source
    imgui.Text("Pos source:"); imgui.SameLine()
    if toggle_btn("NPC Target##lsrc",    loc.use_target)  then loc.use_target = true  end
    imgui.SameLine()
    if toggle_btn("My Position##lsrc", not loc.use_target) then loc.use_target = false end

    local src_x, src_y, src_z
    if loc.use_target and t.valid then
        src_x, src_y, src_z = t.x, t.y, t.z
    else
        src_x, src_y, src_z = p.x, p.y, p.z
    end
    imgui.Text(string.format("  Using:  X=%.2f  Y=%.2f  Z=%.2f", src_x, src_y, src_z))

    -- Key name
    imgui.Text("Key name:")
    imgui.SameLine()
    imgui.SetNextItemWidth(420)
    imgui.InputText("##lockey", loc.key_buf, 256)

    -- Visual mode
    imgui.Text("Mode:"); imgui.SameLine()
    for i, mode in ipairs(VISUAL_MODES) do
        if i > 1 then imgui.SameLine() end
        if toggle_btn(mode .. "##lm", loc.visual_mode == mode) then loc.visual_mode = mode end
    end

    -- Zone (auto)
    imgui.Text(string.format("Zone:     %s  (auto from current zone)", p.zone_name))

    -- Floor ID
    imgui.Text("Floor ID:"); imgui.SameLine()
    if imgui.Button(" - ##lf") then loc.floor_id = math.max(0, loc.floor_id - 1) end
    imgui.SameLine(); imgui.Text(string.format("%d", loc.floor_id)); imgui.SameLine()
    if imgui.Button(" + ##lf") then loc.floor_id = loc.floor_id + 1 end

    -- Max distance
    imgui.Text("Max dist:"); imgui.SameLine()
    if imgui.Button(" - ##ld") then loc.max_distance = math.max(1, loc.max_distance - 1) end
    imgui.SameLine(); imgui.Text(string.format("%d", loc.max_distance)); imgui.SameLine()
    if imgui.Button(" + ##ld") then loc.max_distance = loc.max_distance + 1 end
    imgui.SameLine(); imgui.Text("  ")
    imgui.SameLine()
    if imgui.Button(" -10##ld") then loc.max_distance = math.max(1, loc.max_distance - 10) end
    imgui.SameLine()
    if imgui.Button(" +10##ld") then loc.max_distance = loc.max_distance + 10 end

    -- Actions
    imgui.Separator()
    if imgui.Button("+ Add Entry##la") then
        local key = loc.key_buf[1] ~= "" and loc.key_buf[1] or "my-location"
        local entry = string.format(
            "[%q] = {\n    target_pos = { x = %.1f, y = %.1f, z = %.1f },\n    visual_mode = %q,\n    zone = %q,\n    floor_id = %d,\n    max_distance = %d\n},",
            key, src_x, src_y, src_z,
            loc.visual_mode, p.zone_name, loc.floor_id, loc.max_distance)
        table.insert(loc.entries, entry)
    end
    imgui.SameLine()
    if imgui.Button(string.format("Copy All (%d)##lc", #loc.entries)) then
        if #loc.entries > 0 then
            imgui.SetClipboardText(table.concat(loc.entries, "\n"))
        end
    end
    imgui.SameLine()
    if imgui.Button("Clear##lc") then loc.entries = {} end

    -- Preview
    if #loc.entries > 0 then
        imgui.Separator()
        imgui.Text(string.format("%d entries — hit 'Copy All' to grab:", #loc.entries))
        imgui.BeginChild("QHLoc", { 0, 0 }, true, 0)
        for _, entry in ipairs(loc.entries) do
            imgui.TextWrapped(entry)
            imgui.Separator()
        end
        imgui.EndChild()
    end
end

-- ── Main render ───────────────────────────────────────────────────────────────
function ui_debug.render(player_mod, floor_mappings, quest_state_mod, zone_data)
    if not (quest_state_mod
        and quest_state_mod.settings
        and quest_state_mod.settings.ui_settings
        and quest_state_mod.settings.ui_settings.dev_mode) then
        return
    end

    local now = os.clock()

    -- Refresh player position (data format: y=elev, z=horiz)
    if player_mod and (now - lastPosTime) >= POS_INTERVAL then
        lastPosTime         = now
        cache.pos.x         = player_mod.posX or 0
        cache.pos.y         = player_mod.posZ_depth or 0   -- elevation  → data Y
        cache.pos.z         = player_mod.posY_height or 0  -- horizontal → data Z
        cache.pos.zone      = player_mod.zoneId or 0
        cache.pos.zone_name = zone_name_lookup(zone_data, cache.pos.zone)
    end

    -- Refresh floor
    if player_mod and (now - lastFloorTime) >= FLOOR_INTERVAL then
        lastFloorTime      = now
        cache.floor.raw    = player_mod.getFloorIdRaw and player_mod.getFloorIdRaw() or nil
        cache.floor.mapped = player_mod.getFloorId and player_mod.getFloorId(floor_mappings) or nil
        if quest_state_mod and player_mod.zoneId then
            cache.floor.saved = quest_state_mod.getCurrentMap
                and quest_state_mod.getCurrentMap(player_mod.zoneId) or 0
        end
    end

    -- Refresh target (every frame is fine — entity lookup is cheap)
    local tgt = get_target_entity()
    if tgt and tgt.Name and tgt.Name ~= "" and tgt.Movement and tgt.Movement.LocalPosition then
        local tp = tgt.Movement.LocalPosition
        cache.target.name  = tgt.Name
        cache.target.x     = tp.X or 0
        cache.target.y     = tp.Z or 0   -- same swap: LocalPosition.Z = elevation = data Y
        cache.target.z     = tp.Y or 0   -- LocalPosition.Y = horizontal = data Z
        cache.target.valid = true
        -- Auto-suggest key when target changes
        if tgt.Name ~= loc.last_target_name then
            loc.last_target_name = tgt.Name
            local suggested = slugify(cache.pos.zone_name) .. "-" .. slugify(tgt.Name)
            loc.key_buf[1] = suggested
        end
    else
        cache.target.valid = false
        cache.target.name  = "none"
    end

    imgui.SetNextWindowSize({ 740, 500 }, ImGuiCond_FirstUseEver)
    local win_open = imgui.Begin("QH Debug", nil, 0)
    if win_open then
        if imgui.BeginTabBar("QHTabs") then
            if imgui.BeginTabItem("Log") then
                render_log_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Position") then
                render_position_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Target") then
                render_target_tab()
                imgui.EndTabItem()
            end
            if imgui.BeginTabItem("Validate") then
                render_validate_tab()
                imgui.EndTabItem()
            end
            imgui.EndTabBar()
        end
    end
    imgui.End()
end

return ui_debug
