local hsl = require("repl69.util").hslToHex

---@class Palette
local ret = {
  bg = hsl(0, 0, 98), -- #fafafa (very light gray)
  bg_dark = hsl(0, 0, 95), -- #f2f2f2 (light gray)
  bg_dark1 = hsl(0, 0, 92), -- #ebebeb (slightly darker)
  bg_highlight = hsl(0, 0, 90), -- #e6e6e6 (highlight background)

  -- Core grays - inverted for light theme
  black = hsl(0, 0, 12), -- #1f1f1f (dark text)
  white = hsl(0, 0, 100), -- #ffffff (pure white)

  gray25 = hsl(0, 0, 20), -- #333333
  gray50 = hsl(0, 0, 24), -- #3d3d3d
  gray100 = hsl(0, 0, 28), -- #474747
  gray150 = hsl(0, 0, 32), -- #525252
  gray200 = hsl(0, 0, 36), -- #5c5c5c
  gray250 = hsl(0, 0, 40), -- #666666
  gray300 = hsl(0, 0, 44), -- #707070
  gray350 = hsl(0, 0, 48), -- #7a7a7a
  gray400 = hsl(0, 0, 52), -- #858585
  gray450 = hsl(0, 0, 56), -- #8f8f8f
  gray500 = hsl(0, 0, 60), -- #999999
  gray550 = hsl(0, 0, 64), -- #a3a3a3
  gray600 = hsl(0, 0, 68), -- #adadad
  gray650 = hsl(0, 0, 72), -- #b8b8b8
  gray700 = hsl(0, 0, 76), -- #c2c2c2
  gray750 = hsl(0, 0, 80), -- #cccccc
  gray800 = hsl(0, 0, 84), -- #d6d6d6
  gray850 = hsl(0, 0, 88), -- #e0e0e0
  gray900 = hsl(0, 0, 92), -- #ebebeb
  gray925 = hsl(0, 0, 95), -- #f2f2f2
  gray950 = hsl(0, 0, 98), -- #fafafa

  -- Colors - same vibrant colors work well on light backgrounds
  cyan = hsl(180, 90, 35), -- #09aaaa
  cyan100 = hsl(180, 90, 25), -- #067474
  cyan300 = hsl(180, 90, 30), -- #08999c
  cyan500 = hsl(180, 90, 40), -- #0bcccc
  cyan700 = hsl(180, 90, 50), -- #0df2f2
  cyan900 = hsl(180, 90, 60), -- #33f5f5

  green = hsl(158, 90, 35), -- #09aa6f
  green100 = hsl(158, 90, 25), -- #066248
  green300 = hsl(158, 90, 30), -- #078857
  green500 = hsl(158, 90, 40), -- #0bcc85
  green700 = hsl(158, 90, 50), -- #0df29e
  green900 = hsl(158, 90, 60), -- #33f5b8

  blue = hsl(240, 90, 35), -- #0909aa
  blue100 = hsl(240, 90, 25), -- #050561
  blue300 = hsl(240, 90, 30), -- #070788
  blue500 = hsl(240, 90, 40), -- #0b0bcc
  blue700 = hsl(240, 90, 50), -- #0d0df2
  blue900 = hsl(240, 90, 60), -- #3333f5

  pink = hsl(320, 80, 35), -- #af0074
  pink100 = hsl(320, 80, 25), -- #7d0052
  pink300 = hsl(320, 80, 30), -- #960063
  pink500 = hsl(320, 80, 40), -- #c80084
  pink700 = hsl(320, 80, 50), -- #fd00ae
  pink900 = hsl(320, 80, 60), -- #ff33c4

  purple = hsl(265, 90, 35), -- #5300b0
  purple100 = hsl(265, 90, 25), -- #3c017e
  purple300 = hsl(265, 90, 30), -- #470197
  purple500 = hsl(265, 90, 40), -- #5f00c9
  purple700 = hsl(265, 90, 50), -- #861afd
  purple900 = hsl(265, 90, 60), -- #a133ff

  orange = hsl(25, 100, 35), -- #c04100
  orange100 = hsl(25, 100, 25), -- #892f00
  orange300 = hsl(25, 100, 30), -- #a53800
  orange500 = hsl(25, 100, 40), -- #dc4a00
  orange700 = hsl(25, 100, 50), -- #ff5c00
  orange900 = hsl(25, 100, 60), -- #ff7a33

  red = hsl(0, 100, 35), -- #c30000
  red100 = hsl(0, 100, 25), -- #8b0000
  red300 = hsl(0, 100, 30), -- #a70000
  red500 = hsl(0, 100, 40), -- #df0000
  red700 = hsl(0, 100, 50), -- #f00000
  red900 = hsl(0, 100, 60), -- #ff3333

  yellow = hsl(60, 100, 40), -- #cbcc00
  yellow100 = hsl(60, 100, 30), -- #999900
  yellow300 = hsl(60, 100, 35), -- #b2b300
  yellow500 = hsl(60, 100, 45), -- #e6e600
  yellow700 = hsl(60, 100, 55), -- #ffff1a
  yellow900 = hsl(60, 100, 65), -- #ffff4d

  -- Semantic colors
  fg = hsl(0, 0, 12), -- #1f1f1f (dark text)
  comment = hsl(0, 0, 60), -- #999999 (gray500)

  git = {
    add = hsl(158, 80, 30), -- #078857 (darker green for light bg)
    change = hsl(220, 85, 40), -- #1a4fff (blue that works on light)
    delete = hsl(0, 90, 35), -- #c30000 (darker red for light bg)
    dirty = hsl(0, 0, 44), -- #707070 (gray300)
    merge = hsl(0, 0, 36), -- #5c5c5c (gray200)
    rename = hsl(0, 0, 52), -- #858585 (gray400)
    stage = hsl(0, 0, 44), -- #707070 (gray300)
    text = hsl(0, 0, 28), -- #474747 (gray100)
    ignore = hsl(0, 0, 24), -- #3d3d3d (gray50)
    untracked = hsl(35, 95, 35), -- #c47000 (darker orange for light bg)
  },
}

return ret

