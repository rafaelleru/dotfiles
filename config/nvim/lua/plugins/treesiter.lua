return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			'andymass/vim-matchup'
		},
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "python", "lua", "terraform", "php", "yaml" },
				auto_install = true,
				highlight = {
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end
				},
				matchup = {
					enable = true
				}
			})
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = " vv",
						node_incremental = "nu",
						--scope_incremental = "U",
						node_decremental = "nd",
					},
				}
			})
		end
	}
}
