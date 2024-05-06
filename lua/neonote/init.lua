local M = {}

local note_dir = ""

-- setup function
function M.setup(opts)
	note_dir = opts.note_dir or ""
end

function M.select_notes()
	local notes = vim.fn.glob(note_dir .. "*.md", true, true)
	local selected_note = vim.fn.inputlist(notes)
	if selected_note ~= 0 then
		vim.cmd("e " .. notes[selected_note])
	end
end

vim.cmd("command! Neonote lua require('neonote').select_notes()")

return M
