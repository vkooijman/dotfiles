return { 
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.8", 
  dependencies = { 
    { "nvim-lua/plenary.nvim" }, 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({})

    local builtins = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtins.find_files, {}) -- (f)ind (f)uzzy : opens fzf fuzzy file finder
    vim.keymap.set("n", "<leader>fg", builtins.live_grep, {}) -- (f)ind (g)rep : search trough files with ripgrep
    vim.keymap.set("n", "<leader>fb", builtins.buffers, {}) -- (f)ind (b)uffer : search in open buffers
  end
}
