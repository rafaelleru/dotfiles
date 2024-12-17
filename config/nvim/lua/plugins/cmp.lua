return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/nvim-cmp',
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets'
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				completion = {
					keyword_length = 2,
					preselect = cmp.PreselectMode.Item
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				mapping = cmp.mapping.preset.insert({
					-- ['<C-j>'] = cmp.mapping.sroll_docs(-4),
					-- ['<C-k>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping(
					function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()

							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(
					function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)

						else
							fallback()
						end

					end,
					{ "i", "s" }),
					["<S-Tab>"] = cmp.mapping(
					function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
					{ "i", "s" }),
				}),
				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = 'path' }
					}, {
						{ name = 'cmdline' }
					})
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'path' },
					{ name = 'calc' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
				})
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end
	}
}
