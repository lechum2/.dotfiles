return {
    'tpope/vim-fugitive',
    keys = {
        { "<leader>gs", vim.cmd.Git },
    },
    init = function()
        --For getting changes from left or right after 'dv' on conflict
        vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>")
    end
}
