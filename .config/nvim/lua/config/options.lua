-- General
vim.opt.title 		= true  	-- Show title in terminal
vim.opt.cursorline 	= true  	-- Highlight entire selected line
vim.opt.showcmd 	= true  	-- Show commands (bottom-right corner)
vim.opt.linebreak 	= true  	-- Linebreak (wrap lines around spaces, not the middle of words)
vim.opt.incsearch 	= true  	-- Real-time searching/matching
vim.opt.hlsearch 	= true  	-- Highlight all matches
vim.opt.ic 		    = true  	-- Case-insensitive matching
vim.opt.smartcase 	= true  	-- Partial matching
--vim.opt.inccommand="split"   		-- Disable live substitution
vim.opt.number		= true 		-- Line-counter and relative line-counter
vim.opt.relativenumber  = true 	-- Line-counter and relative line-counter
vim.opt.display		= "truncate"-- When part of a line is off-screen, truncate that part instead of the whole line
--vim.opt.mouse		= ""        -- Disable mouse
--vim.opt.laststatus	= 1     -- Remove redundant status bar
vim.opt.clipboard	= "unnamedplus" -- Use system clipboard
--vim.opt.tw		= 60        -- match gqq char size w/ font I use
 -- filetype detect             -- Detect filetype syntax
 -- filetype indent on          -- Smart indentation
vim.opt.tabstop		= 4         -- Default tab is 4 spaces, may be changed per filetype
vim.opt.shiftwidth	= 4         -- Default tab is 4 spaces, may be changed per filetype
vim.opt.expandtab	= true      -- Default tab is 4 spaces, may be changed per filetype
vim.opt.undofile    = true      -- Keep undo history accross sessions
