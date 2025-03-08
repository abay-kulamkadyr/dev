return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { silent = true, desc = "Fugitive git status" })
    end
}
