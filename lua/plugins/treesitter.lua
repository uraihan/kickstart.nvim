return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    main = 'nvim-treesitter', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- opts = {
    -- ensure_installed = {
    --   'bash',
    --   'c',
    --   'css',
    --   'diff',
    --   'html',
    --   'javascript',
    --   'lua',
    --   'luadoc',
    --   'markdown',
    --   'markdown_inline',
    --   'query',
    --   'svelte',
    --   'typescript',
    --   'vim',
    --   'vimdoc',
    -- },
    -- Autoinstall languages that are not installed
    -- auto_install = true,
    -- highlight = {
    --   enable = true,
    --   -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --   --  If you are experiencing weird indenting issues, add the language to
    --   --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    --   additional_vim_regex_highlighting = { 'ruby' },
    -- },
    -- indent = { enable = false, disable = { 'ruby' } },
    -- },
    init = function()
      -- install treesitter parsers
      local ensure_installed = {
        'bash',
        'c',
        'css',
        'diff',
        'html',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'svelte',
        'typescript',
        'vim',
        'vimdoc',
      }
      local alreadyInstalled = require('nvim-treesitter.config').get_installed()
      local parsersToInstall = vim
        .iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
      require('nvim-treesitter').install(parsersToInstall)

      -- enable highlighting and indenting
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          -- Enable treesitter highlighting and disable regex system
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
    --
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
