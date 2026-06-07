local map = vim.keymap.set

map("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

map("n", "J", "mzJ`z")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]], { desc = "Paste without losing yank" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

map({ "n", "v" }, "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer or selection" })

