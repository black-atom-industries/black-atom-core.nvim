local lib_files = require("black-atom.lib.files")
local lib_ui = require("black-atom.lib.ui")

local M = {}

M.pathes = {
    debug_dir = lib_files.build_path(lib_files.get_plugin_path(), "debug"),
    highlights_map_debug_filename = "highlights_debug_map.txt",
    errors_debug_filename = "errors_debug.txt",
}

M.create_debug_dir = function()
    vim.fn.mkdir(M.pathes.debug_dir, "p")
end

M.count_keys = function(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

---Write debug file for highlights
---@param colors BlackAtom.ThemeColors
---@param modules string[]
---@param highlights_map table<string, BlackAtom.HighlightDefinition>
---@return nil
M.write_debug_highlights_file = function(colors, modules, highlights_map)
    local filepath = lib_files.build_path(M.pathes.debug_dir, M.pathes.highlights_map_debug_filename)

    M.create_debug_dir()

    local file = io.open(filepath, "w")

    local modules_keys = M.count_keys(modules)
    local highlight_keys = M.count_keys(highlights_map)

    local separator = "_________________________________________________________"

    if file then
        -- prepend date and time to the file
        file:write("Last written at: '" .. os.date("%c") .. "'" .. "\n")
        file:write("\n")
        file:write(separator .. "\n")

        -- Highlight modules
        file:write("\n")
        file:write("All highlight modules:" .. "\n")
        file:write("\n")
        file:write("Total: " .. modules_keys .. "\n")
        file:write("\n")
        -- write each highlight module from `modules` to a line in the file
        for _, module in ipairs(modules) do
            file:write(module .. "\n")
        end
        file:write("\n")
        file:write(separator .. "\n")

        -- Theme colors definition
        file:write("\n")
        file:write("Theme colors definition:" .. "\n")
        file:write("\n")
        file:write("Primary colors:" .. "\n")
        file:write("\n")
        file:write(vim.inspect(colors.palette) .. "\n")
        file:write("\n")
        file:write("Semantic colors:" .. "\n")
        file:write("\n")
        file:write(vim.inspect(colors.semantics) .. "\n")
        file:write("\n")
        file:write(separator .. "\n")

        -- Highlight map
        file:write("\n")
        file:write("Complete Black Atom Highlight Map" .. "\n")
        file:write("\n")
        file:write("Total unique highlight keys: " .. highlight_keys .. "\n")
        file:write("\n")
        file:write(vim.inspect(highlights_map))

        file:close()

        lib_ui.notify("Wrote highlight map to '" .. filepath .. "'", vim.log.levels.INFO, {
            title = "Black Atom - Debug",
            icon = "",
        })
    end
end

return M
