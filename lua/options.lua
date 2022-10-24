-- Basic Setting {{{
-- Essentials {{{
vim.opt.clipboard:append("unnamedplus") -- Copy paste between vim and everything else
vim.o.errorbells = false -- No error bells of any kind
vim.o.softtabstop = 4 -- Insert 4 spaces for a tab
vim.o.tabstop = 4 -- Insert 4 spaces for a tab
vim.o.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.o.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab = true -- Converts tabs to spaces
vim.o.smartindent = false -- Turning this off as messes with python comment indents.
vim.o.autoindent = true -- Good auto indent
vim.o.backspace = "indent,eol,start" -- Sane backspace
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 700 -- By default timeoutlen is 1000 ms
vim.o.shortmess = vim.o.shortmess .. "c" -- Ignore all "Enter to continue at bottom of screen"
vim.o.compatible = false -- No backward compatibility with Vi
vim.o.spelllang = "en_us" -- English language for spell check
vim.o.encoding = "utf-8" -- Encoding type
vim.o.autoread = true -- Automatically re-read changed files
vim.o.syntax = "on" -- Enable syntax highlighting
vim.o.hidden = true -- Don't unload a buffer when abandoning it
vim.o.scrolloff = 3 -- Scroll automatically when 3 lines from bottom
vim.o.sidescrolloff = 3 -- Scroll automatically when 3 lines from right edge of screen
vim.wo.signcolumn = "yes" -- Extra column on left of numbers
vim.o.mouse = "a" -- Enable your mouse
-- }}}
-- Aesthetics {{{
vim.o.termguicolors = true -- Support 256 colors
vim.o.background = "dark" -- Dark background
vim.o.colorcolumn = "160" -- Highlight line 160 - flake8 setting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.pumblend = 14 -- opacity for popupmenu
vim.o.showmode = false -- Don't show the current mode
vim.o.wrap = false -- No wrap long lines
vim.o.laststatus = 2 -- Always display a status line
vim.o.cmdheight = 1 -- Command line height
vim.o.relativenumber = true -- Line numbers
vim.o.wildmenu = true -- Visual autocomplete for command menu
vim.o.lazyredraw = true -- Faster rendering
vim.o.ttyfast = true -- Faster rendering
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.wildmenu = true -- show list instead of just completing
-- }}}
-- Search {{{
vim.opt.iskeyword:append("-") -- Hypenated words treated as word text objects
vim.o.inccommand = "nosplit" -- Live substitution
vim.o.incsearch = true -- Highlight matches as you type
vim.o.hlsearch = true -- Highlight matches
vim.o.showmatch = true -- Show matching paterns
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- case sensitive when uc present
vim.o.gdefault = true -- g flag on sed subs automatically
vim.o.showmatch = true -- Highlight matching brackets
-- }}}
-- Backups {{{
vim.o.writebackup = false -- This is recommended by coc
vim.o.history = 1000 -- Store a ton of history (default is 20)
vim.o.undodir = os.getenv("HOME") .. "/.nvim_backup/undo" -- where to save undo histories
vim.o.undofile = true -- Got to manually create the dir initially
vim.o.backup = false -- This is recommended by coc
-- }}}
-- Ignores {{{
vim.o.wildignore = vim.o.wildignore
    ..
    "*.o,*.obj,*.pyc,*.aux,*.blg,*.fls,*.blg,*.fdb_latexmk,*.latexmain,.DS_Store,Session.vim,Project.vim,tags,.tags,.sconsign.dblite,.ccls-cache"
vim.o.suffixes = ".bak,.o,.info,.swp,.obj"

-- }}}
-- }}}

-- Custom Commands {{{

-- Remove trailing whitespace
vim.cmd([[command! TrimWhitespace execute ':%s/\s\+$// | :noh']])

-- }}}

-- Enable folding
-- vim: set foldmethod=marker:
