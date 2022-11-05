local K = {}
local lush = require'lush'
local hsl = lush.hsl 

K.palette = {
  background = hsl("#191919"),
  foreground = hsl("#c4c4b5"),
  green      = hsl("#97e023"),
  orange     = hsl("#fa8419"),
  yellow     = hsl("#dfd561"),
  purple     = hsl("#9c64fe"),
  red        = hsl("#f3005f"),
  cyan       = hsl("#57d1ea"),
  blue       = hsl("#57d1ea").da(30),
  grey       = hsl("#c4c4b5").da(30),
  white      = hsl("#f6f6ee"),
}

return K
