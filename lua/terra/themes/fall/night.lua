local M = {}

---@type TerraColors.Primaries
M.primaries = {
    "#1e1e1e",
    "#232323",
    "#2c2928",
    "#322e2b",

    -- Mids
    "#665c54",
    "#7c6f64",
    "#928374",
    "#a89984",

    -- Highs
    "#c5b7a0",
    "#d8c8a8",
    "#efe3c2",
    "#fcf3d1",
}

---@type TerraColors.Palette
M.palette = {
    black = M.primaries[4],
    gray = M.primaries[5],

    dark_red = "#D5552A",
    red = "#D96E4A",

    dark_green = "#5B8F56",
    green = "#83C57D",

    dark_yellow = "#ffa564",
    yellow = "#ffcc69",

    dark_blue = "#8fb7ef",
    blue = "#78cfec",

    dark_magenta = "#AF79AB",
    magenta = "#BFA9D6",

    dark_cyan = "#50b48a",
    cyan = "#6bc791",

    light_gray = M.primaries[9],
    white = M.primaries[11],
}

---@type TerraColors.Semantics
M.semantics = {
    bg = {
        dark = M.primaries[1],
        main = M.primaries[2],
        light = M.primaries[3],
        active = M.primaries[5],
        diff = {
            add = M.palette.green,
            delete = M.palette.red,
            change = M.palette.blue,
            text = M.palette.dark_blue,
        },
    },
    fg = {
        dark = M.primaries[7],
        main = M.primaries[10],
        light = M.primaries[12],
        active = M.palette.dark_yellow,
        neutral = M.primaries[5],
        diff = {
            add = M.palette.green,
            delete = M.palette.red,
            change = M.palette.blue,
            text = M.palette.dark_blue,
        },
    },
}

---@return TerraColors
M.colors = function()
    return {
        none = "none",
        primary = M.primaries,
        palette = M.palette,
        semantics = M.semantics,
    }
end

return M