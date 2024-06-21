local M = {}

---Extends a highlight definition with a code style definition
---@param highlight BlackAtom.HighlightDefinition
---@param code_style BlackAtom.HighlightDefinition
---@return BlackAtom.HighlightDefinition
function M.extend_hl(highlight, code_style)
    return vim.tbl_extend("force", highlight, code_style)
end

function M.building_error_notification(message)
    local notification_opts = {
        title = "Black Atom - Highlights Error",
        timeout = 10000, -- Timeout in milliseconds; set to 0 for no timeout
        hl_group = "ErrorMsg", -- Highlight group for the notification text
        close_on_click = true, -- Close the notification when clicked
    }

    require("black-atom.lib.ui").notify(message, vim.log.levels.ERROR, notification_opts)
end

---@param colors BlackAtom.ThemeColors
---@param config BlackAtom.Config
---@return BlackAtom.Highlights
function M.build_highlights_map(colors, config)
    local default_ignore_pattern = ".*_template.lua$"
    local highlight_modules =
        require("black-atom.lib.files").get_highlight_modules("lua/black-atom/highlights", default_ignore_pattern)

    local highlights_map = M.aggregate_highlight_maps(highlight_modules, colors, config)

    if config.debug then
        require("black-atom.lib.debug").write_debug_highlights_file(colors, highlight_modules, highlights_map)
    end

    return highlights_map
end

---Aggregate the highlight maps from the highlight files
---@param files string[]
---@param colors BlackAtom.ThemeColors
---@param config BlackAtom.Config
---@return BlackAtom.Highlights
function M.aggregate_highlight_maps(files, colors, config)
    local highlights_map = {}

    for _, file in ipairs(files) do
        ---@type BlackAtom.HighlightsSpec
        local highlight_map_extension = require(file)

        -- Check if the highlight map is enabled - Default to true if it's not set
        local highlight_map_is_enabled = highlight_map_extension.enabled == nil or highlight_map_extension.enabled

        -- If the highlight map is enabled, get the map from the extension and add it to the highlights map
        if highlight_map_is_enabled then
            -- If a file does not have a map function, print a warning and skip its highlights
            if not highlight_map_extension.map then
                M.building_error_notification("Error: Highlight map extension does not have a map method: " .. file)
            else
                ---@type BlackAtom.Highlights
                local highlights = highlight_map_extension.map(colors, config)

                -- Check for duplicate highlight keys and print a warning if one is found
                for key, value in pairs(highlights) do
                    if highlights_map[key] then
                        M.building_error_notification("Error: Duplicate highlight key found: " .. key)
                    else
                        highlights_map[key] = value
                    end
                end
            end
        end
    end

    return vim.tbl_deep_extend("force", {}, highlights_map)
end

---Apply the highlights to the editor
---@param highlight_groups BlackAtom.Highlights
function M.set(highlight_groups)
    for group_name, group_definition in pairs(highlight_groups) do
        vim.api.nvim_set_hl(0, group_name, {
            fg = group_definition.fg or "none",
            bg = group_definition.bg or "none",
            sp = group_definition.sp or "none",
            bold = group_definition.bold or false,
            italic = group_definition.italic or false,
            reverse = group_definition.reverse or false,
            underline = group_definition.underline or false,
            underdouble = group_definition.underdouble or false,
            underdashed = group_definition.underdashed or false,
            underdotted = group_definition.underdotted or false,
            strikethrough = group_definition.strikethrough or false,
            undercurl = group_definition.undercurl or false,
            standout = group_definition.standout or false,
            link = group_definition.link or nil,
        })
    end
end

---@param colors BlackAtom.ThemeColors
function M.set_term(colors)
    vim.g.terminal_color_0 = colors.palette.gray
    vim.g.terminal_color_1 = colors.palette.red
    vim.g.terminal_color_2 = colors.palette.green
    vim.g.terminal_color_3 = colors.palette.yellow
    vim.g.terminal_color_4 = colors.palette.blue
    vim.g.terminal_color_5 = colors.palette.magenta
    vim.g.terminal_color_6 = colors.palette.cyan
    vim.g.terminal_color_7 = colors.palette.light_gray
    vim.g.terminal_color_8 = colors.palette.black
    vim.g.terminal_color_9 = colors.palette.red
    vim.g.terminal_color_10 = colors.palette.green
    vim.g.terminal_color_11 = colors.palette.yellow
    vim.g.terminal_color_12 = colors.palette.blue
    vim.g.terminal_color_13 = colors.palette.magenta
    vim.g.terminal_color_14 = colors.palette.cyan
    vim.g.terminal_color_15 = colors.palette.white
end

---Returns the appropriate highlight value based on the provided conditions.
---If no conditions evaluate to true, the default highlight value is returned.
---@param default_highlight string The default highlight value to return if no conditions are true.
---@param conditional_highlight_map table<boolean, string>
---@return string
function M.conditional_hl(default_highlight, conditional_highlight_map)
    local final_highlight = default_highlight

    for condition, highlight in pairs(conditional_highlight_map) do
        if condition then
            final_highlight = highlight
        end
    end

    return final_highlight
end

return M
