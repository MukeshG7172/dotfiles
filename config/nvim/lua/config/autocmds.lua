local function set_neotree_colors()
  local hl = vim.api.nvim_set_hl

  hl(0, "NeoTreeNormal", { bg = "NONE" })
  hl(0, "NeoTreeNormalNC", { bg = "NONE" })
  hl(0, "NeoTreeEndOfBuffer", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_neotree_colors,
})

set_neotree_colors()

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
