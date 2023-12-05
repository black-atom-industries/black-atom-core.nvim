---@diagnostic disable: duplicate-doc-field
---@class TerraHighlightDefinition
---@field fg?                                     string
---@field bg?                                     string
---@field sp?                                     string
---@field bold?                                   boolean
---@field italic?                                 boolean
---@field blend?                                  integer
---@field standout?                               boolean
---@field underline?                              boolean
---@field undercurl?                              boolean
---@field underdouble?                            boolean
---@field underdotted?                            boolean
---@field underdashed?                            boolean
---@field strikethrough?                          boolean
---@field reverse?                                boolean
---@field link?                                   string

---@alias TerraHighlights                         table<string, TerraHighlightDefinition>>

---Function to setup highlight groups for a plugin. It receives the colors and config as arguments.
---@alias TerraHighlightMapExtension.map          fun(colors: TerraColors, config: TerraConfig): TerraHighlights

---@class TerraHighlightsSpec
---@field enabled?                                boolean Default: true
---@field map                                     TerraHighlightMapExtension.map

---@class TerraColors.Debug
---@field neon_pink                               string
---@field electric_lime                           string
---@field vivid_cyan                              string

---@class TerraColors.Primaries                   string[]

---@class TerraColors.Palette
---@field black                                   string
---@field gray                                    string
---@field dark_red                                string
---@field red                                     string
---@field dark_green                              string
---@field green                                   string
---@field dark_yellow                             string
---@field yellow                                  string
---@field dark_blue                               string
---@field blue                                    string
---@field dark_magenta                            string
---@field magenta                                 string
---@field dark_cyan                               string
---@field cyan                                    string
---@field light_gray                              string
---@field white                                   string

---@class TerraColors.Semantics.Git
---@field add                                     string
---@field delete                                  string
---@field change                                  string
---@field text                                    string

---@class TerraColors.Semantics.Shades
---@field dark                                    string
---@field main                                    string
---@field light                                   string
--
---@class TerraColors.Semantics.Background.Match
---@field active                                  string Used for highlighting matches in the foreground for like visual selections
---@field passive                                 string Used for highlighting matches in the background like for illuminate

---@class TerraColors.Semantics.Background
---@field primary                                 TerraColors.Semantics.Shades
---@field secondary                               TerraColors.Semantics.Shades
---@field active                                  string
---@field match                                   TerraColors.Semantics.Background.Match
---@field diff                                    TerraColors.Semantics.Git

---@class TerraColors.Semantics.Foreground
---@field primary                                 TerraColors.Semantics.Shades
---@field secondary                               TerraColors.Semantics.Shades
---@field active                                  string
---@field neutral                                 string
---@field invert                                  string
---@field diff                                    TerraColors.Semantics.Git

---@class TerraColors.Semantics
---@field bg                                      TerraColors.Semantics.Background
---@field fg                                      TerraColors.Semantics.Foreground

---These colors are used for syntax highlighting. They are based on the treesitter highlight groups.
---The values to be used here should be from the `TerraColors.Palette` table.
---Based on the list here: [Treesitter - Neovim docs](https://neovim.io/doc/user/treesitter.html#treesitter-highlight)
---@class TerraColors.Syntax
---@field boolean                                 string In Lua: `true`, `false`
---@field character                               string In TypeScript: `'a'` in `const char = 'a';`
---@field character_special                       string In TypeScript: Special characters
---@field comment                                 string In Lua: `-- This is a comment`
---@field conditional                             string In Lua: `if`, `elseif`, `else`, `then`, `end`
---@field constant                                string In Lua: `math.pi`
---@field constant_builtin                        string In Lua: `nil`, `true`, `false`
---@field constant_macro                          string In TypeScript: `MY_CONST` in `const MY_CONST = 42;`
---@field constructor                             string In TypeScript: `Foo` in `new Foo()`
---@field debug                                   string In TypeScript: Debug
---@field define                                  string In Lua: `function` keyword in Lua
---@field exception                               string In TypeScript: `try`, `catch`, `throw`
---@field field                                   string In Lua: `x` in `t = { x = 42 }`
---@field float                                   string In Lua: `3.14`
---@field function                                string In Lua: `print`, `math.sin`
---@field function_builtin                        string In Lua: `print`, `tostring`
---@field function_macro                          string In TypeScript: Not applicable
---@field include                                 string In TypeScript: `import`
---@field keyword                                 string In Lua: `function`, `local`, `return`
---@field label                                   string In Lua: `::label::`
---@field macro                                   string In TypeScript: `MY_MACRO` in `#define MY_MACRO()`
---@field method                                  string In TypeScript: `toUpperCase` in `str.toUpperCase()`
---@field namespace                               string In TypeScript: `namespace`
---@field number                                  string In Lua: `42`, `3.14`
---@field operator                                string In Lua: `+`, `-`, `*`, `/`, `==`, `~=`
---@field parameter                               string In Lua: `x` in `function foo(x)`
---@field preproc                                 string In C: `#include`, `#define`
---@field property                                string In TypeScript: `length` in `str.length`
---@field punctuation                             string In Lua: `(`, `)`, `{`, `}`, `,`, `;`, etc.
---@field repeat                                  string In Lua: `for`, `while`, `repeat`, `until`
---@field storageclass                            string In TypeScript: `const`, `let`, `var`
---@field string                                  string In Lua: `"Hello, World!"`
---@field string_escape                           string In Lua: `\\n` in `Hello\\nWorld`
---@field string_special                          string In Lua: Special characters in strings
---@field structure                               string In TypeScript: `class`, `interface`
---@field text_literal                            string In Lua: `"Hello, World!"`
---@field text_reference                          string In Lua: `x` in `local x = 10`
---@field text_title                              string In Lua: Function or class names
---@field text_todo                               string In Lua: TODO comments
---@field text_underline                          string In Lua: Underlined text
---@field text_uri                                string In Lua: `https://example.com`
---@field type                                    string In TypeScript: `string`, `number`, `boolean`
---@field type_definition                         string In TypeScript: `interface`, `type`
---@field variable                                string In Lua: `x` in `local x = 10`


---@class TerraColors
---@field none                                    string
---@field debug                                   TerraColors.Debug
---@field primaries                               TerraColors.Primaries
---@field palette                                 TerraColors.Palette
---@field semantics                               TerraColors.Semantics

---@alias TerraConfig.ThemeVariantKey             "day" | "night"
---@alias TerraConfig.ThemeKey                    "spring" | "summer" | "fall" | "winter"
---@alias TerraConfig.ColorSchemeName             "terra_spring_night" | "terra_spring_day" | "terra_summer_night" | "terra_summer_day" | "terra_fall_night" | "terra_fall_day" | "terra_winter_night" | "terra_winter_day"

---@class TerraConfig.VariantDefinition
---@field label                                   string Display name
---@field key                                     TerraConfig.ThemeVariantKey Unique Variant Key
---@field icon                                    string Icon to display in the UI
---@field colorscheme_name                        TerraConfig.ColorSchemeName Name of the colorscheme which will appear in :colorscheme <name>
---@field path                                    string Path to the variant module
---@field status                                  "development" | "beta" | "release" Status of the variant

---@class TerraConfig.ThemeDefinition
---@field label                                   string Display name
---@field key                                     TerraConfig.ThemeKey Unique Theme Key
---@field icon                                    string Icon to display in the UI
---@field path                                    string Path to the theme module
---@field order                                   integer Order in which the theme will appear in custom picker
---@field group                                   "seasons" Theme group to which the theme belongs
---@field variants                                table<TerraConfig.ThemeVariantKey, TerraConfig.VariantDefinition>

---@alias TerraConfig.ThemeDefinitionMap          table<TerraConfig.ThemeKey, TerraConfig.ThemeDefinition>

---@class TerraConfig.CodeStyle
---@field comments?                               TerraHighlightDefinition
---@field keywords?                               TerraHighlightDefinition
---@field functions?                              TerraHighlightDefinition
---@field strings?                                TerraHighlightDefinition
---@field variables?                              TerraHighlightDefinition
---@field messages?                               TerraHighlightDefinition Affects: `WarningMsg`, `ErrorMsg`, `MoreMsg`, `ModeMsg`

---@class TerraConfig.Diagnostics
---@field undercurl                               boolean Wether to use undercurls for diagnostics (Default: false)
---@field background                              boolean Wether to use background color for virtual text (Default: false)

---@class TerraConfig
---@field debug?                                  boolean Enables the Debug Mode (Enables various debug messages) (Default: false)
---@field theme?                                  TerraConfig.ThemeKey Currently set theme (Default: "spring")
---@field variant?                                TerraConfig.ThemeVariantKey Currently set variant (Default: "night")
---@field transparent?                            boolean Wether to render the background color (Default: false)
---@field term_colors?                            boolean Wether to enable terminal colors (Default: true)
---@field ending_tildes?                          boolean Wether to show the end-of-buffer tildes (Default: false)
---@field code_style?                             TerraConfig.CodeStyle Code styling options (Default: See Documentation)
---@field diagnostics?                            TerraConfig.Diagnostics Diagnostics related settings (Default: See Documentation)
