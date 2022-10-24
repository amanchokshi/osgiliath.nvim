local home = os.getenv("HOME")

local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    return
end

--[[ db.preview_command = "/bin/cat | lolcat -F 0.3" ]]
db.preview_command = "cat"
db.preview_file_path = home .. "/.config/nvim/lua/config/dashboard/sat.cat"
db.preview_file_height = 21
db.preview_file_width = 96
db.custom_center = {
    {
        icon = " ",
        desc = "               Recent Files",
        action = "Telescope oldfiles",
    },
    {
        icon = "  ",
        desc = "                 Find File",
        action = "Telescope find_files",
    },
    {
        icon = " ",
        desc = "                  Find Text",
        action = "Telescope live_grep",
    },
    {
        icon = "⏣ ",
        desc = "               Find Project",
        action = "Telescope projects",
    },
    {
        icon = " ",
        desc = "              Configuration",
        action = "e ~/.config/nvim/init.lua",
    },
    {
        icon = " ",
        desc = "                Quit Neovim",
        action = "qa",
    },
}

-- Programmer Quote `https://github.com/Th3Whit3Wolf/pquote`
local quote_ok, quote = pcall(vim.api.nvim_call_function("systemlist", { "pq" }))
if quote_ok then
    db.custom_footer = { quote }
end
if not quote_ok then
    db.custom_footer = {}
    return
end
