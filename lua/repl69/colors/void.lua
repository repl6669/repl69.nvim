local hsl = require("repl69.util").hslToHex

---@class Palette
local c = {
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

  cyan = hsl(180, 30, 42), -- #4b8b8b
  cyan100 = hsl(180, 20, 70), -- #9ebfbf
  cyan300 = hsl(180, 30, 60), -- #66b3b3
  cyan500 = hsl(180, 30, 50), -- #59a6a6
  cyan700 = hsl(180, 30, 40), -- #468585
  cyan900 = hsl(180, 30, 30), -- #336464

  green = hsl(158, 50, 42), -- #35a670
  green100 = hsl(145, 40, 70), -- #84c49f
  green300 = hsl(148, 50, 60), -- #4dcc80
  green500 = hsl(148, 50, 50), -- #40bf73
  green700 = hsl(148, 50, 40), -- #33995c
  green900 = hsl(148, 50, 30), -- #267345

  blue = hsl(224, 65, 42), -- #253db1
  blue100 = hsl(224, 55, 70), -- #7b93d9
  blue300 = hsl(224, 65, 60), -- #4a69d6
  blue500 = hsl(224, 65, 50), -- #2c4fcc
  blue700 = hsl(224, 65, 40), -- #233fa3
  blue900 = hsl(224, 65, 30), -- #1a2f7a

  pink = hsl(332, 40, 42), -- #965681
  pink100 = hsl(332, 30, 60), -- #b38399
  pink300 = hsl(332, 40, 50), -- #b3668c
  pink500 = hsl(332, 40, 40), -- #8f5270
  pink700 = hsl(332, 40, 30), -- #6b3d54
  pink900 = hsl(332, 40, 20), -- #462938

  purple = hsl(265, 80, 42), -- #5816aa
  purple100 = hsl(265, 85, 75), -- #b495f3
  purple300 = hsl(265, 95, 65), -- #9350f9
  purple500 = hsl(265, 95, 55), -- #7f26f7
  purple700 = hsl(265, 95, 45), -- #6b0cd5
  purple900 = hsl(265, 95, 30), -- #47089b

  orange = hsl(20, 100, 42), -- #d64700
  orange100 = hsl(25, 90, 65), -- #f59943
  orange300 = hsl(25, 100, 55), -- #ff7b0d
  orange500 = hsl(20, 100, 45), -- #e64e00
  orange700 = hsl(20, 100, 35), -- #b33d00
  orange900 = hsl(20, 100, 25), -- #802c00

  red = hsl(353, 100, 52), -- #ff0a29
  red100 = hsl(358, 70, 70), -- #e96d72
  red300 = hsl(358, 80, 60), -- #eb3d44
  red500 = hsl(358, 80, 50), -- #e61922
  red700 = hsl(358, 80, 40), -- #b8141b
  red900 = hsl(358, 80, 30), -- #8a0f15

  yellow = hsl(52, 68, 52), -- #c3c441
  yellow100 = hsl(52, 58, 65), -- #d0cd76
  yellow300 = hsl(52, 68, 55), -- #caca4d
  yellow500 = hsl(52, 68, 45), -- #b1b227
  yellow700 = hsl(52, 68, 35), -- #96971f
  yellow900 = hsl(52, 68, 25), -- #6a6b16
}

c.git = {
  add = c.green500,
  change = c.orange500,
  delete = c.red500,
  untracked = c.yellow500,
  stage = c.cyan500,
  ignore = c.comment,
  text = c.gray200,
  merge = c.gray300,
  dirty = c.gray400,
  rename = c.gray500,
}

return c
