local utils = require("terra-core.utils")

local extend_hl = utils.highlights.extend_hl_with_code_style

-- NOTE: `:h treesitter-highlight-groups`
-- TODO: Link Treesitter Highlights with Native Highlights
-- TODO: Create Types from used highlight groups
-- TODO: Define colors for each variant

---@type TerraHighlightsSpec
local highlight_map_extension = {
    map = function(colors, config)
        local fg = colors.semantics.fg
        local palette = colors.palette

        ---@type TerraHighlights
        local highlights_map = {
            -- Native Regex Highlights (See: `:h syntax`)
            Boolean = { fg = palette.dark_yellow },
            Character = { fg = palette.yellow },
            Comment = extend_hl({ fg = fg.neutral }, config.code_style.comments),
            Conditional = extend_hl(
                { fg = palette.magenta },
                config.code_style.keywords
            ),
            Constant = { fg = palette.dark_yellow },
            Define = { fg = palette.magenta },
            Delimiter = { fg = palette.light_gray },
            Error = { fg = palette.magenta },
            Exception = { fg = palette.magenta },
            Float = { fg = palette.dark_yellow },
            Function = extend_hl(
                { fg = palette.yellow },
                config.code_style.functions
            ),
            Identifier = extend_hl({ fg = fg.active }, config.code_style.variables),
            Include = { fg = palette.magenta },
            Keyword = extend_hl({ fg = palette.red }, config.code_style.keywords),
            Label = { fg = palette.magenta },
            Macro = { fg = palette.red },
            Number = { fg = palette.dark_yellow },
            Operator = { fg = palette.magenta },
            PreCondit = { fg = palette.magenta },
            PreProc = { fg = palette.magenta },
            Repeat = extend_hl({ fg = palette.magenta }, config.code_style.keywords),
            Special = { fg = palette.red },
            SpecialChar = { fg = palette.red },
            SpecialComment = extend_hl(
                { fg = fg.secondary.dark },
                config.code_style.comments
            ),
            Statement = { fg = palette.magenta },
            StorageClass = { fg = palette.blue },
            String = extend_hl({ fg = palette.cyan }, config.code_style.strings),
            Structure = { fg = palette.yellow },
            Tag = { fg = palette.green },
            Title = { fg = palette.cyan },
            Todo = { fg = fg.neutral },
            Type = { fg = palette.yellow },
            Typedef = { fg = palette.magenta },

            -- Treesitter Highlights
            -- If you want to add TreeSitter highlights, you can do so here.
            ["@attribute"] = { fg = palette.cyan },

            ["@boolean"] = { fg = palette.dark_yellow },

            ["@character"] = { fg = palette.dark_yellow },
            ["@character.special"] = { fg = palette.dark_yellow },

            ["@comment"] = { link = "Comment" },

            ["@conditional"] = extend_hl(
                { fg = palette.magenta },
                config.code_style.keywords
            ),

            ["@constant"] = { fg = palette.dark_yellow },
            ["@constant.builtin"] = { fg = palette.dark_yellow },
            ["@constant.macro"] = { fg = palette.dark_yellow },

            ["@constructor"] = { fg = palette.yellow, bold = true },

            ["@error"] = { fg = fg.primary.main },

            ["@exception"] = { fg = palette.magenta },

            ["@field"] = { fg = palette.blue },

            ["@float"] = { fg = palette.dark_yellow },

            ["@function"] = extend_hl(
                { fg = palette.yellow, bold = true },
                config.code_style.functions
            ),
            ["@function.builtin"] = extend_hl(
                { fg = palette.yellow },
                config.code_style.functions
            ),
            ["@function.macro"] = extend_hl(
                { fg = palette.yellow },
                config.code_style.functions
            ),

            ["@include"] = { fg = palette.magenta },

            ["@interface"] = { fg = palette.cyan },

            ["@keyword"] = { link = "Keyword" },

            ["@label"] = { fg = palette.dark_yellow },

            ["@method"] = { fg = palette.yellow, bold = true },

            ["@namespace"] = { fg = palette.dark_blue },

            ["@none"] = { fg = fg.primary.main },

            ["@number"] = { fg = palette.dark_yellow },

            ["@operator"] = { link = "Operator" },

            ["@parameter"] = { fg = palette.dark_yellow, italic = true },
            ["@parameter.reference"] = { fg = fg.primary.main },
            ["@property"] = { fg = palette.dark_blue },
            ["@punctuation.bracket"] = { fg = fg.primary.main },
            ["@punctuation.delimiter"] = { fg = fg.primary.main },
            ["@punctuation.special"] = { fg = fg.primary.main },

            ["@repeat"] = extend_hl(
                { fg = palette.magenta },
                config.code_style.keywords
            ),

            ["@string"] = extend_hl(
                { fg = palette.green },
                config.code_style.strings
            ),
            ["@string.escape"] = extend_hl(
                { fg = palette.red },
                config.code_style.strings
            ),
            ["@string.regex"] = extend_hl(
                { fg = palette.dark_yellow },
                config.code_style.strings
            ),
            ["@string.special"] = extend_hl(
                { fg = palette.green },
                config.code_style.strings
            ),

            ["@symbol"] = { fg = palette.cyan },

            ["@tag"] = { fg = palette.yellow },
            ["@tag.attribute"] = { fg = palette.dark_yellow },
            ["@tag.delimiter"] = { fg = palette.dark_yellow },

            ["@text"] = { fg = fg.primary.main },
            ["@text.danger"] = { fg = fg.primary.main },
            ["@text.emphasis"] = { fg = fg.primary.main, italic = true },
            ["@text.environment"] = { fg = fg.primary.main },
            ["@text.environment.name"] = { fg = fg.primary.main },
            ["@text.literal"] = { fg = palette.green },
            ["@text.math"] = { fg = fg.primary.main },
            ["@text.note"] = { fg = fg.primary.main },
            ["@text.reference"] = { fg = palette.blue },
            ["@text.strike"] = { fg = fg.primary.main, strikethrough = true },
            ["@text.strong"] = { fg = fg.primary.main, bold = true },
            ["@text.title"] = { fg = palette.dark_yellow, bold = true },
            ["@text.todo.checked"] = { fg = fg.active },
            ["@text.todo.unchecked"] = { fg = fg.neutral },
            ["@text.underline"] = { fg = fg.primary.main, underline = true },
            ["@text.uri"] = { fg = palette.blue, underline = true },
            ["@text.warning"] = { fg = fg.primary.main },

            ["@type"] = { fg = palette.cyan },
            ["@type.builtin"] = { fg = palette.dark_cyan },

            ["@variable"] = extend_hl(
                { fg = palette.blue },
                config.code_style.variables
            ),
            ["@variable.builtin"] = extend_hl(
                { fg = palette.blue },
                config.code_style.variables
            ),

            -- Treesitter Semantic Tokens
            ["@lsp.type.namespace"] = { link = "@namespace" },
            ["@lsp.type.type"] = { link = "@type" },
            ["@lsp.type.class"] = { link = "@type" },
            ["@lsp.type.enum"] = { link = "@type" },
            ["@lsp.type.interface"] = { link = "@type" },
            ["@lsp.type.struct"] = { link = "@structure" },
            ["@lsp.type.parameter"] = { link = "@parameter" },
            ["@lsp.type.variable"] = { link = "@variable" },
            ["@lsp.type.property"] = { link = "@property" },
            ["@lsp.type.enumMember"] = { link = "@constant" },
            ["@lsp.type.function"] = { link = "@function" },
            ["@lsp.type.method"] = { link = "@method" },
            ["@lsp.type.macro"] = { link = "@macro" },
            ["@lsp.type.decorator"] = { link = "@function" },
        }

        return highlights_map
    end,
}

return highlight_map_extension
