local M = {}

-- Escaped plugin name. Used to find its own installation path.
M.plugin_name = "black%-atom%-core%.nvim"

---@type BlackAtomCore.Config
M.default_config = {
    debug = false,
    theme = "terra_spring_night",
    term_colors = true,
    styles = {
        ending_tildes = false,
        cmp_kind_color_mode = "bg",
        dark_sidebars = true,
        transparency = "none",
        diagnostics = {
            undercurl = false,
            background = false,
        },
        syntax = {
            comments = {
                italic = true,
            },
            keywords = {
                bold = true,
                italic = true,
            },
            functions = {
                bold = true,
            },
            strings = {
                italic = true,
            },
            variables = {},
            messages = {
                bold = true,
            },
        },
    },
}

return M
