return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        -- { "<Space><Space>",  function() require("telescope.builtin").oldfiles() end,   desc = "Recent files" },
        -- { "<Space>fg",       function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
        -- { "<Space>fh",       function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {"node%_modules/.*"},
        },
    },
}
