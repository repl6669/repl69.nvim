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
  gray100 = hsl(0, 0, 76), -- #c1c1c1
  gray150 = hsl(0, 0, 72), -- #b7b7b7
  gray200 = hsl(0, 0, 68), -- #adadad
  gray250 = hsl(0, 0, 64), -- #a3a3a3
  gray300 = hsl(0, 0, 60), -- #999999
  gray350 = hsl(0, 0, 56), -- #8e8e8e
  gray400 = hsl(0, 0, 52), -- #848484
  gray450 = hsl(0, 0, 48), -- #7a7a7a
  gray500 = hsl(0, 0, 44), -- #707070
  gray550 = hsl(0, 0, 40), -- #666666
  gray600 = hsl(0, 0, 36), -- #5b5b5b
  gray650 = hsl(0, 0, 32), -- #515151
  gray700 = hsl(0, 0, 28), -- #474747
  gray750 = hsl(0, 0, 24), -- #3d3d3d
  gray800 = hsl(0, 0, 20), -- #333333
  gray850 = hsl(0, 0, 16), -- #282828
  gray900 = hsl(0, 0, 12), -- #1e1e1e
  gray925 = hsl(0, 0, 8), -- #141414
  gray950 = hsl(0, 0, 4), -- #0a0a0a

  cyan = hsl(180, 30, 42), -- #4b8b8b
  cyan100 = hsl(180, 20, 70), -- #a3c2c2
  cyan300 = hsl(180, 30, 60), -- #7ab8b8
  cyan500 = hsl(180, 30, 50), -- #59a6a6
  cyan700 = hsl(180, 30, 40), -- #478585
  cyan900 = hsl(180, 30, 30), -- #366363

  green = hsl(158, 50, 42), -- #35a079
  green100 = hsl(145, 40, 70), -- #93d1ad
  green300 = hsl(148, 50, 60), -- #65cc95
  green500 = hsl(148, 50, 50), -- #3fbf7b
  green700 = hsl(148, 50, 40), -- #329962
  green900 = hsl(148, 50, 30), -- #267249

  blue = hsl(224, 65, 42), -- #254ab0
  blue100 = hsl(224, 55, 70), -- #889edc
  blue300 = hsl(224, 65, 60), -- #567adb
  blue500 = hsl(224, 65, 50), -- #2c58d2
  blue700 = hsl(224, 65, 40), -- #2347a8
  blue900 = hsl(224, 65, 30), -- #1a357e

  pink = hsl(332, 40, 42), -- #954068
  pink100 = hsl(332, 30, 60), -- #b77a96
  pink300 = hsl(332, 40, 50), -- #b24c7c
  pink500 = hsl(332, 40, 40), -- #8e3d63
  pink700 = hsl(332, 40, 30), -- #6b2d4a
  pink900 = hsl(332, 40, 20), -- #471e31

  purple = hsl(265, 80, 52), -- #7422e6
  purple100 = hsl(265, 85, 85), -- #d3b8f9
  purple300 = hsl(265, 95, 75), -- #b582fb
  purple500 = hsl(265, 95, 65), -- #9750fa
  purple700 = hsl(265, 95, 55), -- #7a1ff9
  purple900 = hsl(265, 95, 40), -- #5505c6

  orange = hsl(20, 100, 42), -- #d64700
  orange100 = hsl(25, 90, 65), -- #f69855
  orange300 = hsl(25, 100, 55), -- #ff7919
  orange500 = hsl(20, 100, 45), -- #e54c00
  orange700 = hsl(20, 100, 35), -- #b23b00
  orange900 = hsl(20, 100, 25), -- #7f2a00

  red = hsl(353, 100, 52), -- #ff0a26
  red100 = hsl(358, 70, 70), -- #e87c80
  red300 = hsl(358, 80, 60), -- #ea474c
  red500 = hsl(358, 80, 50), -- #e51920
  red700 = hsl(358, 80, 40), -- #b71419
  red900 = hsl(358, 80, 30), -- #890f13

  yellow = hsl(52, 68, 62), -- #dfce5c
  yellow100 = hsl(52, 60, 70), -- #e0d484
  yellow300 = hsl(52, 68, 60), -- #decb53
  yellow500 = hsl(52, 68, 50), -- #d6bf28
  yellow700 = hsl(52, 68, 40), -- #ab9820
  yellow900 = hsl(52, 68, 30), -- #807218
}

c.git = {
  add = c.green500,
  change = c.orange500,
  delete = c.red500,
  untracked = c.purple500,
  stage = c.cyan500,
  merge = c.pink500,
  ignore = c.comment,
  text = c.gray200,
  dirty = c.gray400,
  rename = c.yellow500,
}

return c
