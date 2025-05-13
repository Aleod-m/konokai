local themes = {}
local function lualine_theme()
    local colors = require'konokai'.palette
    local bg = string.lower(colors.black.hex)
    local fg = string.lower(colors.white.hex)
    local green = string.lower(colors.green.hex)
    local blue = string.lower(colors.blue.hex)
    local orange = string.lower(colors.orange.hex)
    local yellow = string.lower(colors.yellow.hex)
    local puple = string.lower(colors.purple.hex)
    local grey = string.lower(colors.grey.hex)
    return {
        normal = {
            a = {fg = bg,  bg = green},
            b = {fg = bg, bg = blue},
            c = {fg = fg, bg = bg}
        },
        insert = {a = {fg = bg, bg = orange}},
        visual = {a = {fg = bg, bg = yellow}},
        replace = {a = {fg = bg, bg = red}},
        inactive = {
            a = {fg = purple, bg = bg},
            b = {fg = fg, bg = purple},
            c = {fg = grey, bg = bg}
        }
    }
end
themes.lualine = lualine_theme()

return themes
