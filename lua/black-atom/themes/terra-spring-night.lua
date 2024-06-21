local lib = require("black-atom.lib")

local M = {}

---@type BlackAtom.Colors.Primaries
M.primaries = {
    -- Lows
    "#1d201f",
    "#212523",
    "#272c2a",
    "#313634",

    -- Mids
    "#394740",
    "#51635a",
    "#677e72",
    "#82978c",

    -- Highs
    "#b8aa94",
    "#c3b8a4",
    "#d6d0c2",
    "#e0ddd1",
}

---@type BlackAtom.Colors.Palette
M.palette = {
    black = M.primaries[2],
    gray = M.primaries[4],

    dark_red = "#b95847",
    red = "#ba6e5f",

    dark_green = "#6a9f60",
    green = "#8ac090",

    dark_yellow = "#e89a61",
    yellow = "#d1a762",

    dark_blue = "#899ddc",
    blue = "#99b9e6",

    dark_magenta = "#d5a9c3",
    magenta = "#c6b3da",

    dark_cyan = "#679980",
    cyan = "#85ad9f",

    light_gray = M.primaries[9],
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
            active = lib.color.darken(M.palette.magenta, 0.15, M.primaries[1]),
            passive = lib.color.darken(M.palette.magenta, 0.05, M.primaries[1]),
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
        active = M.palette.green,
        invert = M.primaries[2],
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
    key = "terra-spring-night",
    label = "Terra Spring Night",
    collection_key = "terra",
    collection_label = "Terra",
    appearance = "dark",
    icon = "󰧲 󰖔 ",
    status = "release",
    module_path = "black-atom.themes.terra-spring-night",
}

return M
