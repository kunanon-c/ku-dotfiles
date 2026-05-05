-- lua/config/lsp.lua

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
		map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
		map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
		map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

		map('<leader>f', function()
			vim.lsp.buf.format({ async = true })
		end, '[F]ormat Document')
	end,
})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				-- This stops lua_ls from complaining about the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make lua_ls aware of Neovim's runtime files
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config('gopls', {})

vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            format = {
                enable = true,
            },
            validate = true,
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
        },
    },
})

vim.lsp.config('biome', {})

vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('yamlls')
vim.lsp.enable('biome')
