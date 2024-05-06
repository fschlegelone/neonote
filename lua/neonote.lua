local telescope = require("telescope")
local actions = require("telescope.actions")


local function main()
	print("Hello from our plugin")
end

local function setup()
  vim.cmd("command! Neonote lua require("neonote").neonote_command()")
end

local function neonote_command()
    -- Setup Telescope to select .md files
    telescope.find_files({
        prompt_title = "Neonote - Select .md files",
        cwd = vim.fn.expand("<sfile>:p:h"), -- Open Telescope in the directory of the current Lua file
        file_ignore_patterns = {'*.git/*'}, -- Ignore git directories
        find_command = {'fd', '--type', 'f', '--extension', 'md'} -- Use fd as the finder command
    }):find()
end

return { setup = setup, neonote_command = neonote_command }
