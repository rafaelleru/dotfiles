vim.api.nvim_create_autocmd('TextYankPost', {
		desc = 'Highlight text when yanking',
		group = vim.api.nvim_create_augroup('yank_highlight', { clear = true}),
		callback = function ()
			vim.highlight.on_yank({higroup="IncSearch", timeout=300})
		end,
})
