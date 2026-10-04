return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<C-n>", "<cmd>NvimTreeFindFile<CR>" },
    },
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
            icons = {
                padding = {
                    icon = "  ",
                    folder_arrow = "  ",
                },
            },
       },
       filters = {
        dotfiles = true,
       },
    },
}

