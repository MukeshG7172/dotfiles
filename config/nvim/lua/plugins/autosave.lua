return {
  "Pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      enabled = false,
    },
    debounce_delay = 1000,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
    },
    condition = function(buf)
      local ft = vim.bo[buf].filetype
      if ft == "neo-tree" or ft == "lazy" then
        return false
      end
      return vim.bo[buf].modifiable and vim.bo[buf].buftype == ""
    end,
  },
}
