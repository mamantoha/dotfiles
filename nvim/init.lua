vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = ","

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

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
  local filepath = vim.fn.expand('%:p') -- Get the full path of the current file

  -- Exclude filetypes 'commit', 'xxd', 'gitrebase', or specific file paths
  if line > 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= 'commit'
     and vim.fn.index({'xxd', 'gitrebase'}, vim.bo.filetype) == -1
     and not string.match(filepath, "COMMIT_EDITMSG") then -- Example path check
    vim.cmd('normal! g`"')
  end
end

if vim.fn.has("autocmd") then
  vim.cmd([[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]])
end
