return {
	{
		"kylechui/nvim-surround",
		version = "*",
		opts = {
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "ys",
				normal_cur = "yss",
				normal_line = "yS",
				normal_cur_line = "ySS",
				visual = "<leader>S",
				visual_line = "<leader>SS",
				delete = "ds",
				change = "cs",
				change_line = "cS",
			},
		},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
}
