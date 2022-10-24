local status_ok, scroll = pcall(require, "scrollbar")
if not status_ok then
	return
end

scroll.setup({
	excluded_filetypes = {
		"prompt",
		"TelescopePrompt",
		"tex",
	},
})
require("hlslens").setup({
	require("scrollbar.handlers.search").setup(),
})

vim.cmd([[
    augroup scrollbar_search_hide
    autocmd!
    autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    augroup END
    ]])
