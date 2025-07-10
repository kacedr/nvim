return {
	{
		"ramilito/winbar.nvim",
		event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("winbar").setup({
				-- your configuration comes here, for example:
				icons = true,
				diagnostics = true,
				buf_modified = true,
				-- buf_modified_symbol = "M",
				buf_modified_symbol = "●",
				dim_inactive = {
					enabled = true,
					highlight = "WinbarNC",
					icons = true, -- whether to dim the icons
					name = true, -- whether to dim the name
				},
				filetype_exclude = {
					"help",
					"startify",
					"dashboard",
					"packer",
					"neo-tree",
					"neogitstatus",
					"NvimTree",
					"Trouble",
					"alpha",
					"lir",
					"Outline",
					"spectre_panel",
					"toggleterm",
					"TelescopePrompt",
					"prompt",
				},
			})
		end,
	},
}
