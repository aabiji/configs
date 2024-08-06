-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "ms-jpq/coq_nvim",
    "ms-jpq/coq.artifacts",
    "Yazeed1s/oh-lucy.nvim",
})

-- LSP
local config = require("lspconfig")
local coq = require("coq")
require("mason").setup()
require("mason-lspconfig").setup({ensure_installed = { "clangd", "rust_analyzer", "pyright" }})
config.rust_analyzer.setup(coq.lsp_ensure_capabilities())
config.clangd.setup(coq.lsp_ensure_capabilities())
config.pyright.setup(coq.lsp_ensure_capabilities())
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {})
vim.cmd("COQnow -s") -- Start autocompletion

-- Autoformat on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format {async = false, id = args.data.client_id }
      end,
    })
  end
})

-- Syntax highlighting
vim.cmd.colorscheme("oh-lucy")
vim.cmd[[highlight Structure guifg=#8BB8D0]]
vim.cmd[[highlight Normal guibg=#1e1e1e]]
vim.cmd[[highlight NormalNC guibg=#202020]]
vim.cmd[[highlight Statement gui=NONE guifg=#fb7da7]]
vim.cmd[[highlight StorageClass guifg=#fb7da7]]

-- Settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.cmd('syntax on')
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.signcolumn = 'no'
vim.opt.fillchars = {eob = " "} -- Remove tilda
vim.opt.virtualedit:append('onemore') -- Move past last characte
vim.opt.cmdheight = 0 -- Hide the command line when it's not being used
vim.opt.autoread = true
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
    command = "silent! checktime" -- Update file when it's changed from the outside
})
vim.api.nvim_set_keymap('n', '<M-j>', '<C-W>j', {})
vim.api.nvim_set_keymap('n', '<M-k>', '<C-W>k', {})
vim.api.nvim_set_keymap('n', '<M-h>', '<C-W>h', {})
vim.api.nvim_set_keymap('n', '<M-l>', '<C-W>l', {})
vim.api.nvim_set_keymap('n', '<M-m>', ':vsplit<CR>', {})
vim.api.nvim_set_keymap('n', '<M-n>', ':split<CR>', {})
vim.api.nvim_set_keymap('n', '<Space>', ':noh<CR>', {}) -- Clear search highlights
