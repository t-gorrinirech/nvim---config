_G.ColorMyPencils = function(color)
    color = color or "moonfly"
    vim.cmd.colorscheme(color)

    local groups = { "Normal", "NormalNC", "NvimTreeNormal", "FloatbBorder", "SignColumn", "LineNr", "FoldColumn" }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    local sev = {
        Error = "#F44747",
        Warn = "#FFEB3B",
        Info = "#4FC1FF",
        Hint = "#B267E6",
    }
    for kind, col in pairs(sev) do
        vim.api.nvim_set_hl(0, "Diagnostic" .. kind, { fg = col })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. kind, { fg = col, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticFloating" .. kind, { fg = col, bg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticSign" .. kind, { fg = col, bg = "NONE" })
    end

    if package.loaded.lualine then
        require("lualine").setup() -- Vuelve a ejecutar el setup de lualine
        -- O si existe una función de refresh específica (revisar :h lualine)
        -- require('lualine').refresh() -- (No estoy seguro si existe, setup es más común)
    end
end

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    callback = function()
        ColorMyPencils()
    end,
})
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#3C3C3C", bg = "none" })

return {}
