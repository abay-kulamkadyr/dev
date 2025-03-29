return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters = {
                ["google-java-format"] = {
                    command = "java",
                    args = { "-jar", "/home/abe/Downloads/google-java-format-1.25.2-all-deps.jar", "-i", "$FILENAME" },
                    stdin = false,  -- google-java-format does not support stdin
                },
            },

            formatters_by_ft = {
                java = { "google-java-format" },
                xml = {"xmllint"},
            },
        })
        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", --lua
                "rust_analyzer", --rust
                "clangd", -- C++
                "basedpyright", -- python
                "eslint", -- javascript
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup{}
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup{
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = {"vim"}
                                }
                            }
                        }
                    }
                end
            }
        })

        local cmp = require("cmp")
        local cmp_select = {behavior = cmp.SelectBehavior.Insert}

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({select = true}),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                    { name = "buffer" },
                })
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounder",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        vim.keymap.set("n", "<leader>f", require("conform").format)
    end
}
