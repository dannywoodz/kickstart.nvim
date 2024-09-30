return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dapui').setup()
    require('dap-go').setup {
      dap_configurations = {
        {
          type = 'go',
          name = 'Attach remote',
          mode = 'remote',
          request = 'attach',
        },
      },
      delve = {
        path = '/home/danny/go/bin/dlv',
        initialize_timeout_spec = 20,
        port = '${port}',
        args = {},
        build_flags = '',
        detached = true,
        cwd = nil,
      },
    }

    dap.listeners.before.attach.depui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = 'Continue' })
  end,
}
