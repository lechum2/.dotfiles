vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.mouse = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.tabstop = 4

vim.opt.spelllang = "en_us,en_gb,pl"
vim.opt.spell = true

vim.diagnostic.config({
    virtual_text = true,
})

vim.filetype = on

vim.filetype.add({
    extension = {
        cls = "apex",
        apex = "apex",
        trigger = "apex",
        soql = "soql",
        sosl = "sosl",
    },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

--folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
