local M = {}

-- default notes_dir
M.note_dir = "~/notes"

-- setup function
M.setup = function(config)
	M.note_dir = config.note_dir or M.note_dir
end

-- telescope integration
M.open_telescope = function()
	local telescope = require("telescope.builtin")

	-- List all .md files in the note directory
	local files = vim.fn.glob(M.note_dir .. "/*.md", true, true)

	-- Use Telescope to display the list of files
	telescope.file_browser({
		prompt_title = "Notes",
		cwd = M.note_dir,
		hidden = true,
		attach_mappings = function(_, map)
			-- Custom mapping to open selected file in a new buffer
			map("i", "<CR>", function(bufnr)
				local entry = require("telescope.actions.state").get_selected_entry()
				require("telescope.actions").close(bufnr)
				vim.cmd("edit " .. entry.path)
			end)
			return true
		end,
	})
end

return M
