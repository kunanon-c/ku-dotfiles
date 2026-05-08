vim.pack.add({
	'https://github.com/MunifTanjim/nui.nvim.git',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/romus204/tree-sitter-manager.nvim',
	'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/nvim-lualine/lualine.nvim',
	'https://github.com/rcarriga/nvim-notify',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/m4xshen/hardtime.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter-context',
	'https://github.com/saghen/blink.lib',
	'https://github.com/saghen/blink.cmp'
})

require("tree-sitter-manager").setup({
	highlight = true,
})

require('lualine').setup({
	options = {
		icons_enabled = false,
		component_separators = '',
		section_separators = '',
	},
	sections = {
		lualine_c = {
			{
				'filename',
				path = 1,
			},
		},
		lualine_x = { 'encoding', 'fileformat', 'filetype', 'lsp_status' },
	},
})

require('telescope').setup({
	-- You can put your default mappings / updates / etc. in here
	--  All the info you're looking for is in `:help telescope.setup()`
	--
	defaults = {
		preview = {
			treesitter = {
				enable = true, -- Keep Treesitter enabled for other previews
			},
		},
	},
})

local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', function()
	builtin.find_files { cwd = utils.buffer_dir() }
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sa', builtin.find_files, { desc = '[S]earch [A]ll Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sm', function()
	builtin.lsp_document_symbols { symbols = { 'method', 'function' }, symbol_width = 100 }
end, { desc = '[S]earch [M]ethod' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
	builtin.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })


require("hardtime").setup({
	restriction_mode = "hint",
	disabled_keys = {
		["<Up>"] = false, -- Allow <Up> key
		["<Down>"] = false, -- Allow <Down> key
	}
})

-- In your nvim-notify setup (e.g., notify.lua or init.lua)
local notify = require("notify")

notify.setup({
	background_colour = "#000000", -- required if using transparent bg
	stages = "fade_in_slide_out", -- animation style
	timeout = 2000,
	render = "default",
})

-- Override vim.notify globally
vim.notify = notify


local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = { preset = 'default' },

	-- (Default) Only show the documentation popup when manually triggered
	completion = { documentation = { auto_show = false } },

	-- (Default) list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"`
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "rust" }
})
