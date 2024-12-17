return {
	{ 'junegunn/fzf', run = function() vim.fn['fzf#install']() end },
	{ 'junegunn/fzf.vim' },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-live-grep-args.nvim'
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy"
					},
					git_files = {
						theme = "ivy"
					}
				}
			})
			require('telescope').load_extension('fzf')
			require("telescope").load_extension("live_grep_args")
		end
	}
}
