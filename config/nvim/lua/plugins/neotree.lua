return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem" },
      close_if_last_window = true,

      window = {
        width = 28,
      },

      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },

      buffers = {
        enabled = false,
      },

      git_status = {
        enabled = false,
      },
    },
  },
}
