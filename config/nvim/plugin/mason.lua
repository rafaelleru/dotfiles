require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pylsp", "rust_analyzer", "clangd", "vimls", "solargraph" },
    automatic_installation = true,
    log_level = vim.log.levels.DEBUG, 
})
