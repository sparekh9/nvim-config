return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"oonamo/ef-themes.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			-- Load the colorscheme here.
			require("ef-themes").setup({
				light = "ef-spring", -- Ef-theme to select for light backgrounds
				dark = "ef-duo-dark", -- Ef-theme to select for dark backgrounds
				transparent = true,
				styles = {
					-- Set specific styles for specific highlight groups
					-- Can be any valid attr-list value. See `:h nvim_set_hl`
					comments = { italic = true },
					keywords = { bold = true },
					functions = {},
					variables = {},
					classes = { bold = true },
					types = { bold = true },

					diagnostic = "default", -- Can be "full"
					pickers = "default", -- Can be "borderless"
				},

				modules = {
					-- Enable/Disable highlights for a module
					-- See `h: ef-themes-modules` for the list of available modules
					blink = true,
					fzf = false,
					mini = true,
					semantic_tokens = false,
					snacks = false,
					treesitter = true,
				},

				--- Override any color from the ef-theme
				---@param colors Ef-Theme
				---@param name string
				on_colors = function(colors, name)
					colors.comment = "#46a3ca"
				end,

				--- Override specific highlights
				---@param highlights table
				---@param colors Ef-Theme
				---@param name string
				---@return table
				on_highlights = function(highlights, colors, name)
					-- Returns a table of highlights
					-- return {
					--   Normal = { fg = colors.fg_alt, bg = colors.bg_inactive }
					--   ObscurePlugin = { fg = colors.yellow_faint }
					-- }
				end,

				options = {
					compile = true, -- Whether to compile a theme
					compile_path = vim.fn.stdpath("cache") .. "/ef-themes", -- Directory in which to place compiled themes
				},
			})
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("ef-duo-dark")
		end,
	},
}

-- vim: ts=2
