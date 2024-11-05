return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/Documents/personal-notes/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Documents/personal-notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/personal-notes",
      },
    },
    notes_subdir = "notes",
    daily_notes = {
      folder = "Daily Notes",
      date_format = "%Y-%m-%d"
    },
  },
  keys = function()
    local obsidian = require("obsidian")

    return {
      {
        "gf",
        function()
          obsidian.util.gf_passthrough()
        end,
        desc = "Follow links within vault",
      },
      {
        "<leader>ot",
        "<CMD>ObsidianToday<CR>",
        desc = "Open today's note"
      },
      {
        "<leader>or",
        "<CMD>ObsidianRename<CR>",
        desc = "Rename file in current buffer"
      },
      {
        "<leader>ob",
        "<CMD>ObsidianBacklinks<CR>",
        desc = "Rename file in current buffer"
      }
    }
  end
}

