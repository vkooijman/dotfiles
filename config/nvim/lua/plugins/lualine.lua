return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true,
        theme = 'catppuccin'
      },
      tabline = {
        lualine_a = { {'buffers' }},
      },
    }
  end
}
