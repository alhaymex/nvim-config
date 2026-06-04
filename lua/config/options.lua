vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8      -- Keep at least 8 lines visible above/below cursor
opt.sidescrolloff = 8

opt.clipboard:append("unnamedplus")

opt.mouse = "a"

opt.splitright = true
opt.splitbelow = true


local function make_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "Folded",
    "FoldColumn",
    "EndOfBuffer",
    "VertSplit",
    "WinSeparator",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = make_transparent,
})

make_transparent()
