vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { silent = true })

-- Terminal toggle mappings
vim.keymap.set("n", "<C-/>", function() Snacks.terminal.toggle(nil, { cwd = vim.fn.expand("%:p:h"), root = false }) end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<C-_>", function() Snacks.terminal.toggle(nil, { cwd = vim.fn.expand("%:p:h"), root = false }) end, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set("t", "<C-_>", "<cmd>close<cr>", { desc = "Hide Terminal" })