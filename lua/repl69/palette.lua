local M = {}

-- Backward compatibility wrapper
function M.setup(opts)
	return require("repl69.colors").setup(opts)
end

-- For direct access (backwards compatibility)
setmetatable(M, {
	__index = function(_, key)
		local colors = require("repl69.colors").setup(require("repl69.config").extend())
		return colors[key]
	end,
})

return M

