return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          neotree = true,
          treesitter = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          which_key = true,
          native_lsp = { enabled = true },
        },
        custom_highlights = function(colors)
          return {
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            NormalSB = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            Terminal = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            SignColumnSB = { bg = "NONE" },
            MsgArea = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            LineNr = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            WinSeparator = { fg = colors.surface2, bg = "NONE" },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
