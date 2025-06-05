vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>b", "<Nop>", opts)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader><leader>", ":nohlsearch<CR>", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)
vim.keymap.set("n", "<C-q>", ":q<CR>")

vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)      -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)      -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts)

vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

vim.keymap.set("i", "<C-z>", "<Esc><Cmd>undo<CR>i", opts)
vim.keymap.set("v", "<C-z>", "<Esc><Cmd>undo<CR>gv", opts)
vim.keymap.set("n", "<C-z>", "u", opts)

vim.keymap.set("i", "<C-y>", function()
    vim.cmd("redo")
end, opts)

vim.keymap.set("v", "<leader>i", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>i", true, false, true), "n", true)
end, { noremap = true, silent = true })

vim.keymap.set(
    "n",
    "<leader>fi",
    "<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@function.inner')<cr>",
    opts
)
vim.keymap.set(
    "n",
    "<leader>fa",
    "<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@function.outer')<cr>",
    opts
)

-- Ir al inicio del renglón
vim.keymap.set("n", "<leader>1", "^", { noremap = true, silent = true })

-- Ir al final del renglón
vim.keymap.set("n", "<leader>2", "$", { noremap = true, silent = true })

-- En modo visual, ir al inicio del renglón extendiendo selección
vim.keymap.set("v", "<leader>1", "^", { noremap = true, silent = true })

-- En modo visual, ir al final del renglón extendiendo selección
vim.keymap.set("v", "<leader>2", "$", { noremap = true, silent = true })

vim.keymap.set("n", "sw", "viw", opts)

-- Copiar selección y luego borrarla
vim.keymap.set("v", "Y", "ygvd", opts)

-- Mapea <leader>gr para buscar+reemplazar usando quickfix
vim.keymap.set("n", "<leader>gr", function()
    -- 1) Inputs
    local pat = vim.fn.input("Search: ")
    if pat == "" then
        return
    end
    local rep = vim.fn.input("Replace with: ")
    if rep == "" then
        return
    end

    -- 2) Lista de archivos
    local raw = vim.fn.system("find . -type f")
    local files = vim.split(raw, "\n", { trimempty = true })
    if #files == 0 then
        print("Files not found")
        return
    end

    -- 3) vimgrep sobre todos ellos
    -- fnameescape por si hay espacios, paréntesis, etc.
    for i, f in ipairs(files) do
        files[i] = vim.fn.fnameescape(f)
    end
    vim.cmd("vimgrep /" .. pat .. "/j " .. table.concat(files, " "))

    -- 4) abrir quickfix y cdo
    vim.cmd("copen")
    vim.cmd("cdo %s/" .. pat .. "/" .. rep .. "/gc | update")
end, { desc = "Grep & replace via quickfix" })
