return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          vim.opt_local.tabstop = 8
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
        end,
      })
    end,
  },
}
