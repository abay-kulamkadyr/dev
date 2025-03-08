return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",  -- Ensure parsers are built/updated on install
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "javascript", "typescript", "c", "cpp", "lua", "vim", "vimdoc", "query",
                    "markdown", "markdown_inline"
                },
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },


            })

            vim.opt.foldmethod = "expr"
            vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
            vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            --
            vim.opt.foldlevelstart = 99  -- This opens all folds when a file is opened
        end,
    },
}

