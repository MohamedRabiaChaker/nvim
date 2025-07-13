return {
	"AckslD/swenv.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "python" },
	opts = {},
	keys = {
		{
			"<leader>pe",
			function()
				require("swenv.api").pick_venv()
			end,
			desc = "Pick virtual environment",
		},
		{
			"<leader>pc",
			function()
				require("swenv.api").get_current_venv()
			end,
			desc = "Show current virtual environment",
		},
	},
}
