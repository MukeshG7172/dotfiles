local function set_neotree_colors()
  local hl = vim.api.nvim_set_hl
  local groups = {
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator",
    "NeoTreeFloatNormal",
    "NeoTreeFloatBorder",
  }
  for _, g in ipairs(groups) do
    hl(0, g, { bg = "NONE" })
  end
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    set_neotree_colors()
  end,
})

-- Ensure terminal windows are transparent by using the Normal group
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.winhl = "Normal:Normal,NormalNC:Normal,SignColumn:Normal"
  end,
})

set_neotree_colors()
