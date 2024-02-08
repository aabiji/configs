
-- Plugins
require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("AlexvZyl/nordic.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    })
    use({
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons"
    })
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            {"neovim/nvim-lspconfig"},
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"L3MON4D3/LuaSnip"},
        }
    })
end)

require("gitsigns").setup()
require("bufferline").setup()
require("nvim-tree").setup()

require("lualine").setup({
    options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = ""
    }
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    ensure_installed = {"lua", "go", "python", "rust", "javascript", "typescript", "html", "css", "c", "cpp"},
})

-- General options
vim.opt.wrap = false
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fixendofline = false
vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.tabpagemax = 100
vim.cmd.colorscheme("nordic")

-- Keybindings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader><leader>", ":nohl<CR>") -- clear search selection
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>") -- toggle nvim-tree
vim.keymap.set("n", "<S-l>", "<S-a>")        -- move to end of line
vim.keymap.set("n", "<M-h>", ":split<CR>")   -- split horizantally
vim.keymap.set("n", "<M-v>", ":vsplit<CR>")  -- split vertically
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")  -- create tab
vim.keymap.set("n", "<C-l>", ":tabnext<CR>") -- move to next tab
vim.keymap.set("n", "<C-h>", ":tabprev<CR>") -- move to previous tab

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- find files
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})  -- grep files

-- LSP
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {"clangd", "gopls", "pylsp", "rust_analyzer", "lua_ls"},
  handlers = {
    lsp_zero.default_setup,
  },
})
