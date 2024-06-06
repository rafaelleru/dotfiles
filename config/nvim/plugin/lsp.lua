require'lspconfig'.pylsp.setup{
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

-- Go
require('lspconfig').gopls.setup{}

-- C/C++
require('lspconfig').clangd.setup{}

-- Rust
require('lspconfig').rust_analyzer.setup{}

-- Vim language server
require('lspconfig').vimls.setup{}

-- Metals (Scala)
require('lspconfig').metals.setup{}

-- Ruby
require('lspconfig').solargraph.setup{}

-- PHP
require('lspconfig').phpactor.setup{}

-- Docker Compose
require('lspconfig').docker_compose_language_service.setup{}
