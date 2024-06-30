local lib = require("black-atom.lib")

local M = {}

---@type BlackAtom.Colors.Primaries
M.primaries = {
    -- Lows
    "#040505",
    "#0e1110",
    "#181b19",
    "#1d201e",

    -- Mids
    "#3e4441",
    "#565f59",
    "#606a65",
    "#79857f",

    -- Highs
    "#9fafa7",
    "#abbbb3",
    "#c4d4cc",
    "#d0e0d8",
}

---@type BlackAtom.Colors.Palette
M.palette = {
    black = M.primaries[2],
    gray = M.primaries[5],

    dark_red = "#9891d6",
    red = "#a6a1df",

    dark_green = "#4a9a64",
    green = "#64b47e",

    dark_yellow = M.primaries[9],
    yellow = "#90d58f",

    dark_blue = M.primaries[8],
    blue = M.primaries[10],

    dark_magenta = "#a498e9",
    magenta = "#b7aded",

    dark_cyan = "#6fc27c",
    cyan = "#8fd59b",

    light_gray = M.primaries[8],
    white = M.primaries[11],
}

---@type BlackAtom.Colors.Semantics
M.semantics = {
    bg = {
        primary = {
            dark = M.primaries[1],
            main = M.primaries[2],
            light = M.primaries[3],
        },
        secondary = {
            dark = M.primaries[4],
            main = M.primaries[5],
            light = M.primaries[6],
        },
        active = M.primaries[4],
        match = {
            active = lib.color.darken(M.palette.magenta, 0.25, M.primaries[1]),
            passive = lib.color.darken(M.palette.magenta, 0.15, M.primaries[1]),
        },
        diff = {
            add = M.palette.green,
            delete = M.palette.red,
            change = M.palette.blue,
            text = M.palette.dark_blue,
        },
    },
    fg = {
        primary = {
            dark = M.primaries[10],
            main = M.primaries[11],
            light = M.primaries[12],
        },
        secondary = {
            dark = M.primaries[7],
            main = M.primaries[8],
            light = M.primaries[9],
        },
        active = M.palette.cyan,
        invert = M.primaries[2],
        -- this is a comment
        neutral = M.primaries[6],
        diff = {
            add = M.palette.green,
            delete = M.palette.red,
            change = M.palette.blue,
            text = M.palette.dark_blue,
        },
    },
}

---@type BlackAtom.ThemeColors
M.colors = {
    none = "NONE",
    primaries = M.primaries,
    palette = M.palette,
    semantics = M.semantics,
}

---@type BlackAtom.ThemeMeta
M.meta = {
    key = "black-atom-engineering",
    label = "Black Atom - Engineering",
    collection_key = "black_atom",
    collection_label = "Black Atom",
    appearance = "dark",
    icon = " 󰖔 ",
    status = "release",
    module_path = "black-atom.themes.black-atom-engineering",
}

return M
