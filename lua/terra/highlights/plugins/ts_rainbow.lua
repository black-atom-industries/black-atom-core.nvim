---@type TerraHighlightMapExtension
local highlight_map_extension = {
    setup = function(highlights, colors)
        ---@type TerraHighlightGroup
        highlights.plugins.ts_rainbow = {
            rainbowcol1 = { fg = colors.palette.gray },
            rainbowcol2 = { fg = colors.palette.yellow },
            rainbowcol3 = { fg = colors.palette.blue },
            rainbowcol4 = { fg = colors.palette.dark_yellow },
            rainbowcol5 = { fg = colors.palette.magenta },
            rainbowcol6 = { fg = colors.palette.green },
            rainbowcol7 = { fg = colors.palette.red },
        }
    end,
}

return highlight_map_extension