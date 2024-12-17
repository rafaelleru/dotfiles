return {
		{
				'jackMort/ChatGPT.nvim',
				dependencies = {
						"MunifTanjim/nui.nvim",
						"nvim-lua/plenary.nvim",
						"folke/trouble.nvim",
						"nvim-telescope/telescope.nvim"
				},
				config = function ()
						require("chatgpt").setup({
								api_key_cmd = "pass chatopenai"
						})
				end
		}
}
