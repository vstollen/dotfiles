return {
  { 
    "catpuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      require("catppuccin").setup({
        flavour = "macchiato"
      })

      vim.cmd.colorscheme catpuccin
    end,
  }
}

