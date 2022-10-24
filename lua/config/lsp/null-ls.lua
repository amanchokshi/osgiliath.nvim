-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- configure null_ls
null_ls.setup({
	debug = false,
	-- setup formatters & linters
	sources = {
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.black, -- python formatter
		formatting.yamlfmt, -- yaml formatter
		diagnostics.flake8, -- python linter
		diagnostics.shellcheck, -- bash formatter
		diagnostics.vint, -- vim formatter
		diagnostics.yamllint, -- yaml linter
		diagnostics.proselint, -- markdown, tex linter
	},
})
