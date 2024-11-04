return {
  {
    "mfussenegger/nvim-dap",
    keys = function()
      local dap = require("dap")

      return {
        {
          "<leader>db",
          function()
            dap.list_breakpoints()
          end,
          desc = "DAP Breakpoints",
        },
        {
          "<leader>ds",
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes, { border = "rounded" })
          end,
          desc = "DAP Scopes",
        },
        {
          "<leader>b",
          "<CMD>DapToggleBreakpoint<CR>",
          desc = "Toggle Breakpoint"
        },
        {
          "<F1>",
          function()
            require("dap.ui.widgets").hover(nil, { border = "rounded" })
          end,
          desc = "DAP Hover",
        },
        {
          "<F5>",
          "<CMD>DapContinue<CR>",
          desc = "Launch Debug / Continue"
        },
        {
          "<F10>",
          "<CMD>DapStepOver<CR>",
          desc = "Step Over"
        },
        {
          "<F11>",
          "<CMD>DapStepInto<CR>",
          desc = "Step Into"
        },
        {
          "<F12>",
          "<CMD>DapStepOut<CR>",
          desc = "Step Out"
        },
      }
    end,
    config = function()
      local dap = require("dap")

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      local dap, dapui = require("dap"), require("dapui")
      -- to close NvimTree when the dapui is opened and reopen it later
      local nvimtree_api = require("nvim-tree.api")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function ()
        dapui.open()
        nvimtree_api.tree.close()
      end
      dap.listeners.before.launch.dapui_config = function ()
        dapui.open()
        nvimtree_api.tree.close()
      end
      dap.listeners.before.event_terminated.dapui_config = function ()
        dapui.close()
        nvimtree_api.tree.open()
      end
      dap.listeners.before.event_exited.dapui_config = function ()
        dapui.close()
        nvimtree_api.tree.open()
      end
    end,
    keys = function()
      local dapui = require("dapui")

      return {
        {
          "<leader>dt",
          function()
            dapui.toggle()
          end,
          desc = "Toggle DAP UI",
        },
      }
    end
  }
}
