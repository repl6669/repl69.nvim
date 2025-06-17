-- https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
-- https://github.com/craftzdog/solarized-osaka.nvim/blob/e96ec4bb1a622d969d77bb0b4ffd525ccc44b73a/lua/solarized-osaka/hsl.lua#L65

local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

M.brightness = 0.3

local uv = vim.uv or vim.loop

---@param c  string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  return require(modname)
end

--- Converts an HSL color value to RGB. Conversion formula
--- adapted from http://en.wikipedia.org/wiki/HSL_color_space.
--- Assumes h, s, and l are contained in the set [0, 1] and
--- returns r, g, and b in the set [0, 255].
---
--- @param h number      The hue
--- @param s number      The saturation
--- @param l number      The lightness
--- @return number, number, number     # The RGB representation
function M.hslToRgb(h, s, l)
  --- @type number, number, number
  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    --- @param p number
    --- @param q number
    --- @param t number
    local function hue2rgb(p, q, t)
      if t < 0 then
        t = t + 1
      end
      if t > 1 then
        t = t - 1
      end
      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      end
      if t < 1 / 2 then
        return q
      end
      if t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      end
      return p
    end

    --- @type number
    local q
    if l < 0.5 then
      q = l * (1 + s)
    else
      q = l + s - l * s
    end
    local p = 2 * l - q

    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return r * 255, g * 255, b * 255
end

--- Converts an HSL color value to RGB in Hex representation.
--- @param  h number   The hue
--- @param  s number   The saturation
--- @param  l number   The lightness
--- @return   string   # The hex representation
function M.hslToHex(h, s, l)
  local r, g, b = M.hslToRgb(h / 360, s / 100, l / 100)

  return string.format("#%02x%02x%02x", r, g, b)
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end
M.darken = M.blend_bg

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end
M.lighten = M.blend_fg

---@param color string|Palette
function M.invert(color)
  if type(color) == "table" then
    for key, value in pairs(color) do
      color[key] = M.invert(value)
    end
  elseif type(color) == "string" then
    local hsluv = require("repl69.hsluv")
    if color ~= "NONE" then
      local hsl = hsluv.hex_to_hsluv(color)
      hsl[3] = 100 - hsl[3]
      if hsl[3] < 40 then
        hsl[3] = hsl[3] + (100 - hsl[3]) * M.brightness
      end
      return hsluv.hsluv_to_hex(hsl)
    end
  end
  return color
end

---@param color string  -- The hex color string to be adjusted
---@param lightness_amount number? -- The amount to increase lightness by (optional, default: 0.1)
---@param saturation_amount number? -- The amount to increase saturation by (optional, default: 0.15)
function M.brighten(color, lightness_amount, saturation_amount)
  lightness_amount = lightness_amount or 0.05
  saturation_amount = saturation_amount or 0.2
  local hsluv = require("repl69.hsluv")

  -- Convert the hex color to HSLuv
  local hsl = hsluv.hex_to_hsluv(color)

  -- Increase lightness slightly
  hsl[3] = math.min(hsl[3] + (lightness_amount * 100), 100)

  -- Increase saturation a bit more to make the color more vivid
  hsl[2] = math.min(hsl[2] + (saturation_amount * 100), 100)

  -- Convert the HSLuv back to hex and return
  return hsluv.hsluv_to_hex(hsl)
end

---@param groups repl69.Highlights
---@return table<string, vim.api.keyset.highlight>
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
  return (
    str:gsub("($%b{})", function(w)
      return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
    end)
  )
end

---@param file string
function M.read(file)
  local fd = assert(io.open(file, "r"))
  ---@type string
  local data = fd:read("*a")
  fd:close()
  return data
end

---@param file string
---@param contents string
function M.write(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

M.cache = {}

function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/repl69-" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
  ---@type boolean, repl69.Cache
  local ok, ret = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key string
---@param data repl69.Cache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
  for _, style in ipairs({ "void", "hell" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

return M
