-- Set lualine as statusline
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}
		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree", "Avante" },
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { filename },
				lualine_x = {
					-- Show macro recording in statusline
					{ require("noice").api.statusline.mode.get, cond = require("noice").api.statusline.mode.has },
					diagnostics,
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				-- lualine_c = { { "filename", path = 1 } },
				-- lualine_x = { { "location", padding = 0 } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			-- tabline = {
			-- 	lualine_a = { "buffers" },
			-- 	lualine_b = {  },
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = { "tabs" },
			-- },
			-- winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			--
			-- inactive_winbar = {
			-- 	lualine_a = {},
			-- 	lualine_b = {},
			-- 	lualine_c = { "filename" },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			extensions = { "fugitive" },
		})
	end,
}
