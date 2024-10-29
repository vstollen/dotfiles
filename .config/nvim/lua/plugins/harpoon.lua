return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = function()
    local harpoon = require("harpoon")

    return {
      { '<C-a>', function() harpoon:list():add() end },
      { '<leader>h', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },

      { '<C-j>', function() harpoon:list():select(1) end },
      { '<C-k>', function() harpoon:list():select(2) end },
      { '<C-l>', function() harpoon:list():select(3) end },
      { '<C-;>', function() harpoon:list():select(4) end },
    }
  end
}
