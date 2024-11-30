return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = { tex = false, markdown = false }
  end,
}
