return {
    -- … tus otros plugins …

    {
        "rickhowe/wrapwidth",
        event = "BufWinEnter", -- lazy-load al mostrar cualquier buffer
        config = function()
            -- Opciones visuales (puedes ajustarlas o quitarlas)
            vim.g.wrapwidth_hl = "NonText"
            vim.g.wrapwidth_sign = "" -- sin signo en la gutter
            vim.g.wrapwidth_number = 0 -- sin contador por línea

            -- Auto-activar a 85 cols en **todos** los buffers
            vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter" }, {
                pattern = "*",
                callback = function()
                    -- esto aplica la “soft-wrap” virtual a columna 85
                    vim.cmd("Wrapwidth 85")
                end,
            })
        end,
    },

    -- … el resto …
}
