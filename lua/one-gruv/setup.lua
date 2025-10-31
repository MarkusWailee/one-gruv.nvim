
local c =
{
    text0 = "#bdb8ad",
    text1 = "#6c6963",
    bg0 = "#282828", --main
    bg1 = "#323232", -- slightly brighter
    fg0 = "#b3a690", --main
    fg1 = "#bfb5a1", -- slightly brighter
    gray = "#6f6f7b",
    black = "#000000",
    white = "#dfdfdf",
    red = "#ba5f5f",
    yellow = "#E5C07B",
    orange = "#D19A66",
    purple = "#b785e0",
    purple_pale = "#988dc2",
    blue = "#589dca",
    turqoise = "#46ba88",
    blue_pale = "#83A598",
    green = "#83b95d",
    green_pale = "#8EC07C",
    pink_pale = "#F5CBCB",
    pink = "#D6A99D",
}

local config = {}

config.core =
{
    ["Normal"] =    {fg = c.fg0, bg = c.bg0},
    ["NormalFloat"] = {fg = c.fg0, bg = c.bg0},
    ["FloatBorder"] = {fg = c.fg0, bg = c.bg0},
    ["Pmenu"]       = {fg = c.gray, bg = c.bg0 },
    ["PmenuSel"]    = {fg = c.bg0, bg = c.fg0 },
    ["Identifier"]    = {fg = c.red}
}


config.syntax =
{
    ["variable.defaultLib"]     = {fg = c.red },
    ["variable.default"]        = {fg = c.text0},
    ["variable.parameter"]      = {fg = c.text0, italic = true },
    ["variable.property"]       = {fg = c.text0, italic = true },
    ["variable.builtin"]        = {fg = c.red },   -- this->
    ["constant"]                = {fg = c.orange, bold = true},    -- have not come across yet
    ["constant.builtin"]        = {fg = c.orange },         -- have not come across yet
    ["keyword"]                 = {fg = c.purple },    -- while, return, struct, class
    ["keyword.modifier"]        = {fg = c.purple },       -- const, constexpr, inline, static, public
    ["keyword.import"]          = {fg = c.purple },         -- include
    ["type"]                    = {fg = c.yellow },         -- class Mouse, class Cat,
    ["type.builtin"]            = {fg = c.purple },
    ["numbers"]                 = {fg = c.orange },
    ["namespace"]               = {fg = c.yellow },
    ["enum"]                    = {fg = c.yellow },
    ["enum.member"]             = {fg = c.orange },
    ["function"]                = {fg = c.blue },
    ["function.defaultLib"]     = {fg = c.blue },
    ["function.builtin"]        = {fg = c.blue_pale },
    ["macro"]                   = {fg = "#ba7a5f" },
    ["methods"]                 = {fg = c.blue },
    ["operator"]                = {fg = c.purple },
    ["string"]                  = {fg = c.green },
    ["string.escape"]           = {fg = c.red },
    ["string.special"]          = {fg = c.pink },
    ["comment"]                 = {fg = c.text1, italic = true },
    ["brackets"]                = {fg = c.gray },
}

config.markup =
{
    ["@markup.heading.1"]           = {fg = c.red},
    ["@markup.heading.2"]           = {fg = c.red},
    ["@markup.heading.3"]           = {fg = c.red},
    ["@markup.heading.4"]           = {fg = c.red},
    ["@markup.heading.5"]           = {fg = c.red},
    ["@markup.heading.6"]           = {fg = c.red},
    ["@markup.quote"]               = {fg = c.green},
    ["@markup.emphasis"]            = {fg = c.gray },
    ["@markup.environment"]         = {fg = c.gray},
    ["@markup.environment.name"]    = {fg = c.gray},
    ["@markup.heading"]             = {fg = c.orange },
    ["@markup.link"]                = {fg = c.blue },
    ["@markup.link.url"]            = {fg = c.pink },
    ["@markup.list"]                = {fg = c.pink_pale },
    ["@markup.math"]                = {fg = c.gray },
    ["@markup.raw"]                 = {fg = c.green },
    ["@markup.strike"]              = {fg = c.gray, strikethrough = true, italic = true},
    ["@markup.strong"]              = {fg = c.gray, bold = true},
    ["@markup.underline"]           = {fg = c.gray, underline = true},
}

config.telescope =
{
    ["TelescopeSelection"] = { fg = c.fg1, bg = c.bg1 },
    ["TelescopeMatching"] = { fg = c.green },
    ["TelescopeNormal"] = { fg = c.fg1, bg = c.bg0 },
    ["TelescopeBorder"] = { fg = c.fg1, bg = c.bg0 },
    ["TelescopeTitle"]  = { fg = c.fg1, bg = c.bg0 },
    ["TelescopeResultsClass"] = config.syntax["type"],
    ["TelescopeResultsStruct"] = config.syntax["type"],
    ["TelescopeResultsFunction"] = config.syntax["function"],
    ["TelescopeResultsMethod"] = config.syntax["method"],
    ["TelescopeResultsField"] = config.syntax["variable.default"],
}

config.blink =
{
    ['Text'] =              config.syntax[""],
    ['Method'] =            config.syntax["method"],
    ['Function'] =          config.syntax["function"],
    ['Constructor'] =       config.syntax["function"],
    ['Field'] =             config.syntax["variable.property"],
    ['Variable'] =          config.syntax["variable.default"],
    ['Class'] =             config.syntax["type"],
    ['Interface'] =         config.syntax["type"],
    ['Module'] =            config.syntax["keyword.import"],
    ['Property'] =          config.syntax["variable.property"],
    ['Unit'] =              config.syntax["number"],
    ['Value'] =             config.syntax["number"],
    ['Enum'] =              config.syntax["enum"],
    ['Keyword'] =           config.syntax["keyword"],
    ['Snippet'] =           config.syntax[""],
    ['Color'] =             config.syntax[""],
    ['File'] =              config.syntax[""],
    ['Reference'] =         config.syntax[""],
    ['Folder'] =            config.syntax[""],
    ['EnumMember'] =        config.syntax["enum.member"],
    ['Constant'] =          config.syntax["constant"],
    ['Struct'] =            config.syntax["type"],
    ['Event'] =             config.syntax[""],
    ['Operator'] =          config.syntax["operator"],
    ['TypeParameter'] =     config.syntax[""],
}

local syntax_translation = -- translating semantics to lsp/treesitter
{
    ["variable.default"]        = { "@lsp.type.variable", "@variable" },
    ["variable.parameter"]      = { "@lsp.type.parameter", "@variable.parameter" },
    ["variable.property"]       = { "@lsp.type.property", "@property" },
    ["constant"]                = { "@lsp.typemod.variable.static", "@constant" },
    ["constant.builtin"]        = { "@lsp.type.builtinConstant","@constant.builtin" },
    ["variable.builtin"]        = { "@variable.builtin" },
    ["variable.defaultLib"]     = { "@lsp.typemod.variable.defaultLibrary" },
    ["keyword"]                 = { "@lsp.type.keyword", "@keyword", "@tag.html"}, -- while, if, else, return, continue
    ["keyword.modifier"]        = { "@keyword.modifier" },  -- inline, const, public,
    ["keyword.import"]          = { "@keyword.import" },    -- #include
    ["type"]                    = { "@lsp.type.class", "@lsp.type.struct", "@lsp.type.type", "@type", "Struct", "Class" , "Type", "@tag.attribute.html", "@property.class.css"}, -- classes, structs
    ["type.builtin"]            = { "@lsp.type.builtin", "@type.builtin" }, -- int float char
    ["numbers"]                 = { "@lsp.type.number", "@number", "Constant", "@string.css"}, -- Numbers like 1.0 or 0x11223344 or css codes like cm, mm
    ["namespace"]               = { "@lsp.type.namespace", "@module"},      -- std::, UI::
    ["enum"]                    = { "@lsp.type.enum" },                     -- enum
    ["enum.member"]             = { "@lsp.type.enumMember" },               -- enum members
    ["function"]                = { "@lsp.type.function", "@function","@function.call" , "@constructor", "Function" }, -- all basic functions
    ["function.defaultLib"]     = { "@lsp.typemod.function.defaultLibrary" },                              -- printf, len, tolower,
    ["function.builtin"]        = { "@function.builtin" },                                                 -- static_assert
    ["methods"]                 = { "@lsp.type.method", "@method", "@method.call", "@function.method", "@function.method.call"}, -- vector.Length()
    ["macro"]                   = { "@lsp.type.macro", "@function.macro", "@constant.macro" },                              -- all macro types
    ["operator"]                = { "@lsp.type.operator" , "@operator"},
    ["string"]                  = { "@string", "@character" , "String"},
    ["string.escape"]           = { "@string.escape" },
    ["string.special"]          = { "@string.special","@character.special"},
    ["comment"]                 = { "@lsp.type.comment", "@comment"},
    ["brackets"]                = { "Delimiter", "@tag.delimiter.html"} --
    -- markdown
}

local set = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end
local M = {}

function M.Load()
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")
    vim.o.background = "dark"
    vim.g.colors_name = "one-gruv"
    -- programming syntax
    for key, value in pairs(syntax_translation) do
        for _,v in pairs(value) do
            set(v, config.syntax[key])
        end
    end

    -- markdown syntax
    for k, v in pairs(config.markup) do set(k, v) end

    for k, v in pairs(config.telescope) do set(k, v) end

    for k, v in pairs(config.core) do set(k, v) end

    set("Normal", {fg = c.fg0, bg = c.bg0})

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "#FF0000", fg = c.red }) -- Sets background to red
    for kind, color in pairs(config.blink) do
        set('BlinkCmpKind' .. kind, color)
    end

end




return M
