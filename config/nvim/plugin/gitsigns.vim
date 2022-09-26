lua <<EOF
require('gitsigns').setup {
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 250
    }
}
EOF
