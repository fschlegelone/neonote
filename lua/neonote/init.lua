local M = {}
local telescope = require("telescope.builtin")

local default_config = {
	notes_dir = "~/notes",
	tasks_dir = "~/notes/tasks",
	include_files = { ".md", ".txt" },
}

local config = {}

function M.open()
	telescope.find_files({
		prompt_title = "Neonote",
		cwd = config.notes_dir,
	})
end

function M.setup(user_config)
	if user_config then
		for key, value in pairs(user_config) do
			config[key] = value
		end
	else
		config = default_config
	end
	vim.api.nvim_set_keymap(
		"n",
		"<leader>nn",
		"<cmd>lua require('neonote').open()<CR>",
		{ noremap = true, silent = true }
	)
end

return M
