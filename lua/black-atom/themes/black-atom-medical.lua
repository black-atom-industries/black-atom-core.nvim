local lib = require("black-atom.lib")

local M = {}

---@type BlackAtom.Colors.Primaries
M.primaries = {
    -- Lows
    "#222325",
    "#313533",
    "#3e4542",
    "#4a514f",

    -- Mids
    "#545d5a",
    "#616a65",
    "#6d7873",
    "#7a8782",

    -- Highs
    "#bcc3c0",
    "#c8cfcd",
    "#d4dbd8",
    "#e6e8e6",
}

---@type BlackAtom.Colors.Palette
M.palette = {
    black = M.primaries[2],
    gray = M.primaries[5],

    dark_red = "#5d54ad",
    red = "#7872c2",

    dark_green = "#4c8e62",
    green = "#449f63",

    dark_yellow = M.primaries[4],
    yellow = "#41a63f",

    dark_blue = M.primaries[6],
    blue = M.primaries[5],

    dark_magenta = "#887bd3",
    magenta = "#998ed9",

    dark_cyan = "#50955c",
    cyan = "#4db25e",

    light_gray = M.primaries[8],
    white = M.primaries[11],
}

---@type BlackAtom.Colors.Semantics
M.semantics = {
    bg = {
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
        active = M.primaries[5],
        match = {
            active = lib.color.darken(M.palette.magenta, 0.25, M.primaries[12]),
            passive = lib.color.darken(M.palette.magenta, 0.15, M.primaries[12]),
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
            dark = M.primaries[1],
            main = M.primaries[2],
            light = M.primaries[3],
        },
        secondary = {
            dark = M.primaries[4],
            main = M.primaries[5],
            light = M.primaries[6],
        },
        active = M.palette.cyan,
        invert = M.primaries[11],
        neutral = M.primaries[7],
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
    key = "black-atom-medical",
    label = "Black Atom - Medical",
    collection_key = "black_atom",
    collection_label = "Default",
    appearance = "light",
    icon = " 󰖔 ",
    status = "release",
    module_path = "black-atom.themes.black-atom-medical",
}

return M
