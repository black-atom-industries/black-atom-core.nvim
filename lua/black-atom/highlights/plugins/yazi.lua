---@type BlackAtom.HighlightsSpec
local highlight_map_spec = {
    enabled = true,

    map = function(colors, config)
        local lib = require("black-atom.lib")

        local fg = colors.semantics.fg
        local bg_float = lib.bg.float(config, colors)

        ---@type BlackAtom.Highlights
        local highlights_map = {
            YaziFloat = { bg = bg_float },
        }

        return highlights_map
    end,
}

return highlight_map_spec
