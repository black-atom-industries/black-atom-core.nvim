----------------------------------------Highlight

---@class TerraHighlightDefinition
---@field fg                                      string
---@field bg                                      string
---@field sp                                      string
---@field bold                                    boolean
---@field italic                                  boolean
---@field blend                                   integer
---@field standout                                boolean
---@field underline                               boolean
---@field undercurl                               boolean
---@field underdouble                             boolean
---@field underdotted                             boolean
---@field underdashed                             boolean
---@field strikethrough                           boolean
---@field reverse                                 boolean
---@field link                                    string

---@alias TerraHighlights                         table<string, TerraHighlightDefinition>>

-------------------------------------------TerraHighlightMapExtension

---Function to setup highlight groups for a plugin. It receives the colors and config as arguments.
---@alias TerraHighlightMapExtension.map          fun(colors: TerraColors, config: TerraConfig): TerraHighlights

---@class TerraHighlightsSpec
---@field enabled                                 boolean Whether or not the highlight map should be enabled
---@field map                                     TerraHighlightMapExtension.map

-------------------------------------------Colors
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

---@class TerraColors.Semantics.Background
---@field primary                                 TerraColors.Semantics.Shades
---@field secondary                               TerraColors.Semantics.Shades
---@field active                                  string
---@field match                                   string
---@field diff                                    TerraColors.Semantics.Git

---@class TerraColors.Semantics.Foreground
---@field primary                                 TerraColors.Semantics.Shades
---@field secondary                               TerraColors.Semantics.Shades
---@field active                                  string
---@field neutral                                 string
---@field invert                                  string
---@field diff                                    TerraColors.Semantics.Git

---These colors are used for semantic highlighting. 
---The colors to be used here should be from `TerraColors.Palette` or the `TerraColors.Primaries` table.
---@class TerraColors.Semantics
---@field bg                                      TerraColors.Semantics.Background
---@field fg                                      TerraColors.Semantics.Foreground

---@class TerraColors
---@field none                                    string
---@field debug                                   TerraColors.Debug
---@field primaries                               TerraColors.Primaries
---@field palette                                 TerraColors.Palette
---@field semantics                               TerraColors.Semantics
---@field syntax                                  TerraColors.Syntax

-------------------------------------------Config

---@alias TerraConfig.Season                      "spring" | "summer" | "fall" | "winter"
---@alias TerraConfig.Time                        "day" | "night"

---@class TerraConfig.CodeStyle
---@field comments                                TerraHighlightDefinition
---@field keywords                                TerraHighlightDefinition
---@field functions                               TerraHighlightDefinition
---@field strings                                 TerraHighlightDefinition
---@field variables                               TerraHighlightDefinition
---@field messages                                TerraHighlightDefinition Affects: `WarningMsg`, `ErrorMsg`, `MoreMsg`, `ModeMsg`

---@class TerraConfig.Diagnostics
---@field darker                                  boolean Wether to use darker colors for diagnostics
---@field undercurl                               boolean Wether to use undercurls for diagnostics
---@field background                              boolean Wether to use background color for virtual text

---@class TerraConfig
---@field loaded                                  boolean Wether the config has been loaded
---@field debug                                   boolean Enables the Debug Mode (Enables various debug messages)
---@field season                                  TerraConfig.Season Currently set season
---@field time                                    TerraConfig.Time Current set time of day
---@field icons                                   table Icons associated with each season
---@field select_time                             string Normal mode mapping string for triggering the `time` selection
---@field select_season                           string Normal mode mapping string for triggering the `season` selection
---@field transparent                             boolean Wether to render the background color
---@field dim_inactive_panes                      boolean Wether to dim inactive panes
---@field term_colors                             boolean Wether to enable terminal colors
---@field ending_tildes                           boolean Wether to show the end-of-buffer tildes
---@field code_style                              TerraConfig.CodeStyle Code styling options
---@field colors                                  table<string, string> Override default colors
---@field diagnostics                             TerraConfig.Diagnostics Diagnostics related settings
