return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- For status updates notification
    'j-hui/fidget.nvim',

    -- For autocompletion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    require('fidget').setup({})
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities
          })
        end,
      },
    })
  end,
}
