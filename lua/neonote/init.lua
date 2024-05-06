local M = {}
local telescope = require("telescope.builtin")
local notes_dir = "~/notes/neonote"

function M.open()
	telescope.find_files({
		prompt_title = "Neonote",
		cwd = notes_dir,
	})
end

return M
