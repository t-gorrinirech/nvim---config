-- core settings
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("core.options")
require("core.keymaps")
pcall(require, "impatient")
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt_local.textwidth = 90
-- 		vim.opt_local.formatoptions:append("t")
-- 	end,
-- })

-- lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("plugins.colors")
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
