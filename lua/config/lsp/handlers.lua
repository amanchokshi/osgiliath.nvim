local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "⏣" },
		{ name = "DiagnosticSignWarn", text = "⏣" },
		{ name = "DiagnosticSignHint", text = "⏣" },
		{ name = "DiagnosticSignInfo", text = "⏣" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap(bufnr, "n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
	keymap(bufnr, "n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
