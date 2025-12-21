return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'
      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { 'ipython' },
              env = { PYTHON_BASIC_REPL = '1' },
            },
            julia = {
              command = { 'julia' },
            },
          },
          repl_filetype = function(bufnr, ft)
            return ft
          end,
          repl_open_cmd = require('iron.view').split.vertical.botright '40%',
        },
        keymaps = {
          send_motion = '<space>sc',
          visual_send = '<space>sc',
          send_file = '<space>sf',
          send_line = '<space>sl',
          send_paragraph = '<space>sp',
          send_until_cursor = '<space>su',
          send_mark = '<space>sm',
          send_code_block = '<space>sb',
          send_code_block_and_move = '<space>sn',
          mark_motion = '<space>mc',
          mark_visual = '<space>mc',
          remove_mark = '<space>md',
          cr = '<space>s<cr>',
          interrupt = '<space>s<space>',
          exit = '<space>sq',
          clear = '<space>cl',
        },
        ignore_blank_lines = true,
      }

      vim.keymap.set('n', '<localleader>rr', '<cmd>IronRestart<cr>', { desc = 'I[r]on Resta[r]t' })
      vim.keymap.set('n', '<localleader>rs', '<cmd>IronRepl<cr>', { desc = 'I[r]on Sta[r]t' })
      vim.keymap.set('n', '<localleader>rf', '<cmd>IronFocus<cr>', { desc = 'I[r]on [f]ocus' })
      vim.keymap.set('n', '<localleader>rh', '<cmd>IronHide<cr>', { desc = 'I[r]on [h]ide' })
    end,
  },
}
