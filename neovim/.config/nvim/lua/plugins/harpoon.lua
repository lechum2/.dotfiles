return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
        {
            "<leader>ha",
            function ()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon add to list"
        },
        {
            "<leader>hn",
            function ()
                require("harpoon"):list():next()
            end,
            desc = "Harpoon go to next"
        },
        {
            "<leader>hp",
            function ()
                require("harpoon"):list():prev()
            end,
            desc = "Harpoon go to previous"
        },
        {
            "<leader>hc",
            function ()
                require("harpoon"):list():clear()
            end,
            desc = "Harpoon clear list"
        },
    }
}
