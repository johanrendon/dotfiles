-- Lazy install bootstrap snippet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({
    { import = "plugins.completation_diagnostics" },
    { import = "plugins.file_management" },
    { import = "plugins.text_editing" },
    { import = "plugins.miscellaneous" },
    { import = "plugins.ui" },

}, {
    change_detection = {
        enabled = true,
        notify = false,
    },
})
