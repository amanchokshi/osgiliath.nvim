-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local lsp_servers = {
	"bashls",
	"dockerls",
	"jsonls",
	"texlab",
	"marksman",
	"pyright",
	"sumneko_lua",
	"vimls",
	"yamlls",
}

local null_ls_servers = {
	"prettier", -- ts/js formatter
	"stylua", -- lua formatter
	"flake8", -- python linter
	"black", -- python formatter
	"shellcheck", -- bash
	"vint", -- vim
	"yamlfmt", -- yaml
	"yamllint", -- yaml
	"proselint", -- markdown, tex
}

-- enable mason
mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = null_ls_servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(lsp_servers) do
	opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "config.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
