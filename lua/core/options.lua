--[[ vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver26,r-cr-o:hor20" ]]
vim.opt.guicursor = ""
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- si querés que el número actual resalte

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = true

vim.opt.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.breakindentopt = "min:20,shift:2,sbr"

vim.opt.clipboard = "unnamedplus"
vim.o.linebreak = true

vim.o.mouse = "a"

vim.o.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.opt.smartindent = true

vim.opt.incsearch = true

vim.opt.scrolloff = 10

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.cursorline = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.showmode = false

vim.opt.termguicolors = true

vim.o.swapfile = false

vim.o.showtabline = 1

vim.o.backspace = "indent,eol,start"

vim.o.pumheight = 10

vim.wo.signcolumn = "yes"

vim.o.cmdheight = 1

vim.o.breakindent = true

vim.o.writebackup = false

vim.o.undofile = true

vim.o.completeopt = "menuone,noselect"
vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.opt.formatoptions:remove({ "c", "r", "o" })
