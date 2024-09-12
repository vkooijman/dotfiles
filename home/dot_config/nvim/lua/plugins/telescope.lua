return { 
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.8", 
  dependencies = { 
    { "nvim-lua/plenary.nvim" }, 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local telescopeConfig = require("telescope.config")
    local builtins = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtins.find_files, {}) -- (f)ind (f)uzzy : opens fzf fuzzy file finder
    vim.keymap.set("n", "<leader>fg", builtins.live_grep, {}) -- (f)ind (g)rep : search trough files with ripgrep
    vim.keymap.set("n", "<leader>fb", builtins.buffers, {}) -- (f)ind (b)uffer : search in open buffers

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    telescope.setup({
	    defaults = {
		    -- `hidden = true` is not supported in text grep commands.
		    vimgrep_arguments = vimgrep_arguments,
	    },
	    pickers = {
		    find_files = {
			    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		    },
	    },
    })
  end
}
