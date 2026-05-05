local sev = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_lines = true, -- full line below (0.12+)
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = 'rounded',
		source = true,
	},
	signs = {
		text = {
			[sev.ERROR] = 'E',
			[sev.WARN]  = 'W',
			[sev.INFO]  = 'I',
			[sev.HINT]  = 'H',
		},
	},
})
