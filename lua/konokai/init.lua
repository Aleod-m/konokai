local K = {}
local lush = require'lush'
local hsl = lush.hsl 

K.palette = {
  black      = hsl("#191919"),
  green      = hsl("#97e023"),
  orange     = hsl("#fa8419"),
  yellow     = hsl("#dfd561"),
  purple     = hsl("#9c64fe"),
  pink       = hsl("#fe71fa"),
  red        = hsl("#f3005f"),
  cyan       = hsl("#57d1ea"),
  blue       = hsl("#577cea"),
  grey       = hsl("#929276"),
  grey_light = hsl("#c4c4b5"),
  white      = hsl("#f6f6ee"),
}

return K
