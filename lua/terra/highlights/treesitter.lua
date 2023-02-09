local actions = require("terra.actions")

local with_code_style = actions.highlights.extend_with_code_style

local M = {}

---Sets up Treesitter Highlights
---@param highlights Highlights
---@param colors TerraColors
---@param config TerraConfig
M.setup = function(highlights, colors, config)
    highlights.treesitter = {
        ["@annotation"] = { fg = colors.semantic.fg.main },
        ["@attribute"] = { fg = colors.palette.cyan },
        ["@boolean"] = { fg = colors.palette.dark_yellow },
        ["@character"] = { fg = colors.palette.dark_yellow },
        ["@character.special"] = { fg = colors.palette.dark_yellow },
        ["@comment"] = with_code_style({ fg = colors.semantic.fg.dark }, config.code_style.comments),
        ["@conditional"] = with_code_style({ fg = colors.palette.magenta }, config.code_style.keywords),
        ["@constant"] = { fg = colors.palette.dark_yellow },
        ["@constant.builtin"] = { fg = colors.palette.dark_yellow },
        ["@constant.macro"] = { fg = colors.palette.dark_yellow },
        ["@constructor"] = { fg = colors.palette.yellow, bold = true },
        ["@error"] = { fg = colors.semantic.fg.main },
        ["@exception"] = { fg = colors.palette.magenta },
        ["@field"] = { fg = colors.palette.cyan },
        ["@float"] = { fg = colors.palette.dark_yellow },
        ["@function"] = with_code_style({ fg = colors.palette.yellow }, config.code_style.functions),
        ["@function.builtin"] = with_code_style({ fg = colors.palette.cyan }, config.code_style.functions),
        ["@function.macro"] = with_code_style({ fg = colors.palette.cyan }, config.code_style.functions),
        ["@include"] = { fg = colors.palette.magenta },
        ["@keyword"] = with_code_style({ fg = colors.palette.red, bold = true }, config.code_style.keywords),
        ["@keyword.function"] = with_code_style({ fg = colors.palette.magenta }, config.code_style.functions),
        ["@keyword.operator"] = with_code_style({ fg = colors.palette.red }, config.code_style.keywords),
        ["@label"] = { fg = colors.palette.dark_yellow },
        ["@metod"] = { fg = colors.palette.blue },
        ["@namespace"] = { fg = colors.palette.yellow },
        ["@none"] = { fg = colors.semantic.fg.main },
        ["@number"] = { fg = colors.palette.dark_yellow },
        ["@operator"] = { fg = colors.palette.white },
        ["@parameter"] = { fg = colors.palette.blue },
        ["@parameter.reference"] = { fg = colors.semantic.fg.main },
        ["@property"] = { fg = colors.palette.dark_blue },
        ["@punctuation.delimiter"] = { fg = colors.palette.white },
        ["@punctuation.bracket"] = { fg = colors.palette.white },
        ["@punctuation.special"] = { fg = colors.palette.white },
        ["@repeat"] = with_code_style({ fg = colors.palette.magenta }, config.code_style.keywords),
        ["@string"] = with_code_style({ fg = colors.palette.green }, config.code_style.strings),
        ["@string.special"] = with_code_style({ fg = colors.palette.green }, config.code_style.strings),
        ["@string.regex"] = with_code_style({ fg = colors.palette.dark_yellow }, config.code_style.strings),
        ["@string.escape"] = with_code_style({ fg = colors.palette.red }, config.code_style.strings),
        ["@symbol"] = { fg = colors.palette.cyan },
        ["@tag"] = { fg = colors.palette.yellow },
        ["@tag.delimiter"] = { fg = colors.palette.dark_yellow },
        ["@tag.attribute"] = { fg = colors.palette.dark_yellow },
        ["@text"] = { fg = colors.semantic.fg.main },
        ["@text.strong"] = { fg = colors.semantic.fg.main, bold = true },
        ["@text.emphasis"] = { fg = colors.semantic.fg.main, italic = true },
        ["@text.underline"] = { fg = colors.semantic.fg.main, underline = true },
        ["@text.strike"] = { fg = colors.semantic.fg.main, strikethrough = true },
        ["@text.title"] = { fg = colors.palette.dark_yellow, bold = true },
        ["@text.literal"] = { fg = colors.palette.green },
        ["@text.uri"] = { fg = colors.palette.cyan, underline = true },
        ["@text.math"] = { fg = colors.semantic.fg.main },
        ["@text.reference"] = { fg = colors.palette.blue },
        ["@text.environment"] = { fg = colors.semantic.fg.main },
        ["@text.environment.name"] = { fg = colors.semantic.fg.main },
        ["@text.note"] = { fg = colors.semantic.fg.main },
        ["@text.warning"] = { fg = colors.semantic.fg.main },
        ["@text.danger"] = { fg = colors.semantic.fg.main },
        ["@text.todo.unchecked"] = { fg = colors.semantic.fg.neutral },
        ["@text.todo.checked"] = { fg = colors.semantic.fg.active },
        ["@type"] = { fg = colors.palette.cyan },
        ["@type.builtin"] = { fg = colors.palette.dark_cyan },
        ["@variable"] = with_code_style({ fg = colors.palette.blue }, config.code_style.variables),
        ["@variable.builtin"] = with_code_style({ fg = colors.palette.red }, config.code_style.variables),
    }
end

return M
