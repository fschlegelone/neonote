local M = {}
local telescope = require("telescope.builtin")
local notes_dir = "~/notes/neonote"

function M.open()
	telescope.find_files({
		prompt_title = "Neonote",
		cwd = notes_dir,
	})
end

function M.setup()
	vim.api.nvim_set_keymap(
		"n",
		"<leader>nn",
		"<cmd>lua require('neonote').open()<CR>",
		{ noremap = true, silent = true }
	)
end

return M
