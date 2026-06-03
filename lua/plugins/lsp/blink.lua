return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'github/copilot.vim',
      event = 'VimEnter',
      config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap('i', '<C-S-K>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
      end,
    },
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        },
      },
      opts = {},
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'accept', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        path = {
          opts = {
            show_hidden_files_by_default = true,
            get_cwd = function(_) return vim.fn.getcwd() end,
          },
        },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_insert = true, -- show as soon as you open the parenthesis
        show_on_trigger_character = true,
      },
      window = {
        show_documentation = true,
        border = 'rounded', -- optional, makes it visually distinct
      },
    },
  },
  config = function(_, opts)
    local blink = require 'blink.cmp'
    blink.setup(opts)

    -- Advertise blink capabilities to all active LSP servers
    -- This ensures rich completions (inherited members, etc.) are returned
    local capabilities = blink.get_lsp_capabilities()
    for _, client in ipairs(vim.lsp.get_clients()) do
      client.config.capabilities = vim.tbl_deep_extend('force', client.config.capabilities or {}, capabilities)
    end

    -- Also hook into LspAttach so any servers that start later also get capabilities
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('blink-lsp-capabilities', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client then client.config.capabilities = vim.tbl_deep_extend('force', client.config.capabilities or {}, capabilities) end
      end,
    })
  end,
}
