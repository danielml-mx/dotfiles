return {
    {
        "folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
	    -- do not paint over the background
	    transparent = true,
    	    styles = {
	        sidebars = "transparent",
		floats = "transparent"
            },

	    -- minor personal color alterations
	    on_highlights = function(hl, c)
	        hl.SpellBad   = { undercurl = true, bg = "NONE", fg = "#c53b53" }
	        hl.SpellCap   = { undercurl = true, bg = "NONE", fg = "#ffc777" }
	        hl.SpellLocal = { undercurl = true, bg = "NONE", fg = "#0db9d7" }
	        hl.SpellRare  = { undercurl = true, bg = "NONE", fg = "#4fd6be" }
	    end,
	},
    }
}

