---@type TerraHighlightMapExtension
local highlight_map_extension = {
    setup = function(highlights, colors, config)
        ---@type TerraHighlightGroup
        highlights.plugins.cmp = {
            CmpItemAbbr = { fg = colors.semantics.fg.primary.main },
            CmpItemAbbrDeprecated = {
                fg = colors.palette.light_gray,
                strikethrough = true,
            },
            CmpItemAbbrMatch = { fg = colors.palette.cyan },
            CmpItemAbbrMatchFuzzy = { fg = colors.palette.cyan, underline = true },
            CmpItemMenu = { fg = colors.palette.light_gray },
            CmpItemKind = {
                fg = colors.palette.magenta,
                config.cmp_itemkind_reverse and { reverse = true },
            },
        }

        local lsp_kind_icons_color = {
            Default = colors.palette.magenta,
            Class = colors.palette.yellow,
            Color = colors.palette.green,
            Constant = colors.palette.dark_yellow,
            Constructor = colors.palette.blue,
            Enum = colors.palette.magenta,
            EnumMember = colors.palette.yellow,
            Event = colors.palette.yellow,
            Field = colors.palette.magenta,
            File = colors.palette.blue,
            Folder = colors.palette.dark_yellow,
            Function = colors.palette.blue,
            Interface = colors.palette.green,
            Keyword = colors.palette.cyan,
            Method = colors.palette.blue,
            Module = colors.palette.dark_yellow,
            Operator = colors.palette.red,
            Property = colors.palette.cyan,
            Reference = colors.palette.dark_yellow,
            Snippet = colors.palette.red,
            Struct = colors.palette.magenta,
            Text = colors.palette.light_gray,
            TypeParameter = colors.palette.red,
            Unit = colors.palette.green,
            Value = colors.palette.dark_yellow,
            Variable = colors.palette.magenta,
        }

        for kind, color in pairs(lsp_kind_icons_color) do
            highlights.plugins.cmp["CmpItemKind" .. kind] = {
                fg = color,
                config.cmp_itemkind_reverse and { reverse = true },
            }
        end
    end,
}

return highlight_map_extension