vim.opt.rtp:append('~/.fzf')

-- TODO: Check this line here
vim.env.FZF_DEFAULT_COMMAND = 'rg -i --ignore-file ./.gitignore --files'

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "^lambda/" }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("live_grep_args")
