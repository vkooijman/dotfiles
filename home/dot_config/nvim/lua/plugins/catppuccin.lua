return
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = {
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      cmp = true,
      dap = true,
      dap_ui = true,
      treesitter = true,
      telescope = {
        enabled = true
            },
    },
    custom_highlights = function(colors) return {
        LineNr = { fg = colors.overlay1 }
    }
end
    }}
