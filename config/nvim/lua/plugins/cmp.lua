return {
		{
				'hrsh7th/nvim-cmp',
				dependencies = {
						'hrsh7th/cmp-nvim-lsp',
						'hrsh7th/cmp-buffer',
						'hrsh7th/cmp-path',
						'hrsh7th/cmp-cmdline',
						'hrsh7th/nvim-cmp',
						'L3MON4D3/LuaSnip'
				},
				config = function()
						local cmp = require("cmp")
						local luasnip = require("luasnip")
						cmp.setup({
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
								sources = cmp.config.sources({
										{ name = 'nvim_lsp' },
								})
						})
				end
		}
}
