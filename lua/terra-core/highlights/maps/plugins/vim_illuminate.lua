---Repository: https://github.com/RRethy/vim-illuminate
---@type TerraHighlightsSpec
local highlight_map_spec = {
    enabled = true,

    map = function(colors)
        local match_style = { bg = colors.semantics.bg.match.passive }

        ---@type TerraHighlights
        local highlights_map = {
            IlluminatedWordRead = match_style,
            IlluminatedWordText = match_style,
            IlluminatedWordWrite = match_style,
        }

        return highlights_map
    end,
}

return highlight_map_spec