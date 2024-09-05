return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,
      },
    })

    -- Opens nvim tree if the file is a real file on the disk or a [No Name] Buffer
    -- e.g., not for commit messages, etc.
    local function open_nvim_tree(data)
      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
  end
} 
