
local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			"--filter=blob:none",
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end
	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()
vim.cmd([[let mapleader = "\<SPACE>"]])

-- Packer packages
require('pckr').add({
	'nyngwang/nvimgelion';
	'nvim-treesitter/nvim-treesitter';
	'neovim/nvim-lspconfig';
	'ms-jpq/coq_nvim';
	'ms-jpq/coq.artifacts';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'williamboman/mason.nvim';
	'williamboman/mason-lspconfig.nvim';
})


-- package setup

require("nvim-treesitter.install").prefer_git = true
require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "cpp", "lua" },
	highlight = { enable = true } }

-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {'clangd'},
})

-- coq setup
vim.g.coq_settings = {
	clients = {
		lsp = {
			enabled = true,
		},
		tree_sitter = {
			enabled = true,
			weight_adjust = 1.0
		},
	},
	display = {
		preview = {
			border = 'solid',
		},
		icons = {
			mode = "short",
			mappings = {
				["Class"] = "ᚋ",
				["Color"] = "᚜",
				["Constant"] = "ᛶ",
				["Constructor"] = "ᛳ",
				["Enum"] = "ᛜ",
				["EnumMember"] = "ᙾ",
				["Event"] = "ᚕ",
				["Field"]  = "ᚗ",
				["File"] = "፠",
				["Folder"] = "።",
				["Function"] = "ᚖ",
				["Interface"]  = "ᖭ",
				["Keyword"] = "ᚘ",
				["Method"] = "ᛥ",
				["Module"] = "᛭",
				["Operator"] = "૰",
				["Property"] = "ᛵ",
				["Reference"] = "ᛄ",
				["Snippet"] = "ᛍ",
				["Struct"] = "ᐝ",
				["Text"] = "᎙",
				["TypeParameter"] = "ᛓ",
				["Unit"] = "𐃋",
				["Value"] = "ၝ",
				["Variable"] = "૧",
			}
		},
	},
}

-- misc variables
local lsp = require "lspconfig"
local coq = require "coq"
local builtin = require('telescope.builtin')
local harpoon = require('harpoon')

-- LSP setup
lsp.clangd.setup(coq.lsp_ensure_capabilities())
lsp.clojure_lsp.setup(coq.lsp_ensure_capabilities())
lsp.tailwindcss.setup(coq.lsp_ensure_capabilities())
lsp.lua_ls.setup(coq.lsp_ensure_capabilities())
lsp.java_language_server.setup(coq.lsp_ensure_capabilities())
local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gx", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

vim.diagnostic.config({
  virtual_text = true
})

-- Vim setup
vim.cmd([[color nvimgelion]])
vim.cmd([[set termguicolors]])
vim.cmd([[set relativenumber]])
vim.cmd([[hi VertSplit cterm=NONE ctermbg=NONE guibg=NONE]])
vim.cmd([[hi Normal ctermbg=NONE guibg=NONE cterm=NONE]])
vim.cmd([[set fillchars+=vert:\ ]])
vim.cmd([[set tabstop=3]])
vim.cmd([[set shiftwidth=3]])
vim.cmd([[set expandtab]])
vim.cmd([[set smartindent]])

-- Custom keymaps

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.cmd([[imap jk <ESC>]])
vim.cmd([[nnoremap <leader>h <C-w>h]])
vim.cmd([[nnoremap <leader>j <C-w>j]])
vim.cmd([[nnoremap <leader>k <C-w>k]])
vim.cmd([[nnoremap <leader>l <C-w>l]])
vim.cmd([[nmap <leader>z :vsplit<CR>]])
vim.cmd([[nmap <leader>x :split<CR>]])
vim.cmd([[nmap <leader>v <C-w>o]])
vim.cmd([[nmap <C-UP> <cmd>resize +2<CR>]])
vim.cmd([[nmap <C-DOWN> <cmd>resize -2<CR>]])
vim.cmd([[nmap <C-LEFT> <cmd>vertical resize +2<CR>]])
vim.cmd([[nmap <C-RIGHT> <cmd>vertical resize -2<CR>]])


