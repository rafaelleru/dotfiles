return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup {}
			lspconfig.pylsp.setup {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								indentSize = 4,
								maxLineLength = 120,
								ignore = {'W191'}
							},
							flake8 = {
								indentSize = 4
							}
						}
					}
				}
			}
			require('lspconfig').terraformls.setup{}
		end
	}
}
