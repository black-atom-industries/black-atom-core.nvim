local cond_hl = require("black-atom.lib.highlights").conditional_hl
local colors = require("black-atom.api").get_colors()
local config = require("black-atom.config").get()

local M = {}

local fg = colors.semantics.fg
local bg = colors.semantics.bg
local palette = colors.palette

M.normal = {
    a = {
        fg = fg.active,
        bg = bg.active,
    },
    b = {
        fg = fg.primary.dark,
        bg = cond_hl(bg.primary.main, {
            [config.transparency == "partial"] = bg.primary.main,
            [config.transparency == "full"] = colors.none,
        }),
    },
    c = {
        fg = fg.primary.dark,
        bg = cond_hl(bg.primary.main, {
            [config.transparency == "partial"] = bg.primary.main,
            [config.transparency == "full"] = colors.none,
        }),
    },
}

M.inactive = {
    a = {
        fg = fg.active,
        bg = bg.active,
    },
    b = {
        fg = fg.neutral,
        bg = cond_hl(bg.primary.main, {
            [config.transparency == "partial"] = bg.primary.main,
            [config.transparency == "full"] = colors.none,
        }),
    },
    c = {
        fg = fg.neutral,
        bg = cond_hl(bg.primary.light, {
            [config.transparency == "partial"] = bg.primary.main,
            [config.transparency == "full"] = colors.none,
        }),
    },
}

M.visual = {
    a = { fg = fg.invert, bg = palette.magenta },
}

M.replace = {
    a = { fg = fg.invert, bg = palette.red },
}

M.insert = {
    a = { fg = fg.invert, bg = palette.blue },
}

M.command = {
    a = { fg = fg.invert, bg = palette.green },
}

M.terminal = {
    a = { fg = fg.invert, bg = palette.cyan },
}

for _, mode in pairs(M) do
    mode.a.gui = "bold,italic"
end

return M
