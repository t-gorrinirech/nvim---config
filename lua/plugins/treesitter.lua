return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "javascript",
                    "typescript",
                    "regex",
                    "terraform",
                    "sql",
                    "dockerfile",
                    "toml",
                    "json",
                    "java",
                    "groovy",
                    "go",
                    "gitignore",
                    "graphql",
                    "yaml",
                    "make",
                    "cmake",
                    "bash",
                    "tsx",
                    "css",
                    "html",
                    "rust",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {},
                    },
                    move = { -- <- ahora está al mismo nivel que select
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["fn"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["fp"] = "@function.outer",
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        after = "nvim-treesitter",
    },
}
