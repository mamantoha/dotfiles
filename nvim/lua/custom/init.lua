-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

g.mapleader = ","
opt.whichwrap = ""

-- Reselect visual block after indent/outdent
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})

-- When editing a file, always jump to the last known cursor position.
-- Don't do it when the position is invalid, when inside an event handler,
-- for a commit or rebase message
-- (likely a different one than last time), and when using xxd(1) to filter
-- and edit binary files (it transforms input files back and forth, causing
-- them to have dual nature, so to speak)
function RestoreCursorPosition()
  local line = vim.fn.line("'\"")
  if line > 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= 'commit' and vim.fn.index({'xxd', 'gitrebase'}, vim.bo.filetype) == -1 then
    vim.cmd('normal! g`"')
  end
end

if vim.fn.has("autocmd") then
  vim.cmd([[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]])
end


opt.formatoptions:append('r')
