return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" }
    },
    opts = {
      extensions = {
        bibtex = {
          depth = 2
        }
      }
    },
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { '<leader>ff', builtin.find_files },
        { '<leader>fp', builtin.git_files },
        { '<leader>fg', builtin.live_grep },
        { '<leader>fb', builtin.buffers },
        { '<leader>fh', builtin.help_tags },
        { '<leader>fd', builtin.diagnostics },

        { '<leader>fc', require("telescope").extensions.bibtex.bibtex }
      }
    end
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require("telescope").load_extension("bibtex")
    end,
  },
}
