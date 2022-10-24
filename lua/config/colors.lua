-- Color Schemes

-- [horizon, gruvbox]
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

vim.cmd("highlight SignColumn guibg=282828AF")
vim.cmd("highlight EndOfBuffer guifg=#303030")
vim.cmd("highligh WhichKeyFloat guibg=#303030")
vim.cmd("highligh NvimTreeFolderName guifg=#458588")
vim.cmd("highligh NvimTreeOpenedFolderName guifg=#d79921")
vim.cmd("highligh NvimTreeOpenedFileName guifg=#d79921")
vim.cmd("highligh NvimTreeRootFolder guifg=#DA3752")
