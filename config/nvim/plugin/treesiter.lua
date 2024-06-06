require'nvim-treesitter.configs'.setup {
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
}
