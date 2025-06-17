local hsl = require("repl69.util").hslToHex

---@class Palette
local ret = {
  -- Semantic colors
  fg = hsl(0, 0, 88), -- #e0e0e0 (white)
  bg = hsl(0, 0, 0), -- #000000 (black)
  comment = hsl(0, 0, 28), -- #474747 (gray700)
  bg_dark = hsl(0, 0, 8), -- #141414 (gray925)
  bg_darker = hsl(0, 0, 4), -- #0a0a0a (gray950)

  -- Core grays - your carefully crafted palette preserved exactly
  black = hsl(0, 0, 0), -- #000000
  white = hsl(0, 0, 88), -- #e0e0e0

  gray25 = hsl(0, 0, 84), -- #d6d6d6
  gray50 = hsl(0, 0, 80), -- #cccccc
  gray100 = hsl(0, 0, 76), -- #c2c2c2
  gray150 = hsl(0, 0, 72), -- #b8b8b8
  gray200 = hsl(0, 0, 68), -- #adadad
  gray250 = hsl(0, 0, 64), -- #a3a3a3
  gray300 = hsl(0, 0, 60), -- #999999
  gray350 = hsl(0, 0, 56), -- #8f8f8f
  gray400 = hsl(0, 0, 52), -- #858585
  gray450 = hsl(0, 0, 48), -- #7a7a7a
  gray500 = hsl(0, 0, 44), -- #707070
  gray550 = hsl(0, 0, 40), -- #666666
  gray600 = hsl(0, 0, 36), -- #5c5c5c
  gray650 = hsl(0, 0, 32), -- #525252
  gray700 = hsl(0, 0, 28), -- #474747
  gray750 = hsl(0, 0, 24), -- #3d3d3d
  gray800 = hsl(0, 0, 20), -- #333333
  gray850 = hsl(0, 0, 16), -- #292929
  gray900 = hsl(0, 0, 12), -- #1f1f1f
  gray925 = hsl(0, 0, 8), -- #141414
  gray950 = hsl(0, 0, 4), -- #0a0a0a

  -- Colors - your exact palette preserved
  cyan = hsl(180, 90, 24), -- #067474
  cyan100 = hsl(180, 90, 70), -- #00fbf9
  cyan300 = hsl(180, 90, 50), -- #0df2f2
  cyan500 = hsl(180, 90, 35), -- #09aaaa
  cyan700 = hsl(180, 90, 20), -- #056161
  cyan900 = hsl(180, 90, 10), -- #033030

  green = hsl(158, 90, 42), -- #0bcb85
  green100 = hsl(158, 90, 70), -- #00fbc0
  green300 = hsl(158, 90, 50), -- #0df29e
  green500 = hsl(158, 90, 35), -- #09aa6f
  green700 = hsl(158, 90, 20), -- #00623c
  green900 = hsl(158, 90, 10), -- #033020

  blue = hsl(240, 85, 65), -- #6366f1
  blue100 = hsl(240, 85, 75), -- #8b8bff
  blue300 = hsl(240, 85, 60), -- #4f46e5
  blue500 = hsl(240, 85, 55), -- #3f3cf4
  blue700 = hsl(240, 85, 45), -- #312ee6
  blue900 = hsl(240, 85, 35), -- #2422d8

  pink = hsl(320, 80, 40), -- #c80084
  pink100 = hsl(320, 80, 70), -- #ff6cca
  pink300 = hsl(320, 80, 55), -- #fd00ae
  pink500 = hsl(320, 80, 45), -- #e10095
  pink700 = hsl(320, 80, 35), -- #af0074
  pink900 = hsl(320, 80, 25), -- #7d0052

  purple = hsl(265, 85, 65), -- #a855f7
  purple100 = hsl(265, 85, 75), -- #c084fc
  purple300 = hsl(265, 85, 60), -- #9333ea
  purple500 = hsl(265, 85, 55), -- #8b5cf6
  purple700 = hsl(265, 85, 45), -- #7c3aed
  purple900 = hsl(265, 85, 35), -- #6d28d9

  orange = hsl(25, 100, 40), -- #dc4a00
  orange100 = hsl(25, 100, 70), -- #ffa056
  orange300 = hsl(25, 100, 50), -- #ff5c00
  orange500 = hsl(25, 100, 35), -- #c04100
  orange700 = hsl(25, 100, 25), -- #892f00
  orange900 = hsl(25, 100, 15), -- #531b00

  red = hsl(0, 100, 60), -- #ff001e
  red100 = hsl(0, 100, 70), -- #ff565e
  red300 = hsl(0, 100, 50), -- #f00000
  red500 = hsl(0, 100, 35), -- #c30000
  red700 = hsl(0, 100, 25), -- #8b0000
  red900 = hsl(0, 100, 15), -- #540000

  yellow = hsl(60, 100, 75), -- #feff67
  yellow100 = hsl(60, 100, 80), -- #feff89
  yellow300 = hsl(60, 100, 50), -- #feff00
  yellow500 = hsl(60, 100, 40), -- #cbcc00
  yellow700 = hsl(60, 100, 25), -- #7f7f00
  yellow900 = hsl(60, 100, 15), -- #4c4c00

  git = {
    add = hsl(158, 90, 35), -- #09aa6f (green500)
    change = hsl(25, 100, 50), -- #ff5c00 (orange500)
    delete = hsl(0, 100, 35), -- #c30000 (red500)
    untracked = hsl(60, 100, 40), -- #cbcc00 (yellow500)
    ignore = hsl(0, 0, 32), -- #515151 (gray600)
    dirty = hsl(0, 0, 60), -- #999999 (gray300)
    merge = hsl(0, 0, 68), -- #adadad (gray200)
    rename = hsl(0, 0, 52), -- #858585 (gray400)
    stage = hsl(0, 0, 60), -- #999999 (gray300)
    text = hsl(0, 0, 76), -- #c2c2c2 (gray100)
  },
}

return ret
