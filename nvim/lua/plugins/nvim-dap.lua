-- Neovim Debug Adapter, with keybinds
local dap = require("dap")
return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      {
        "<leader>db",
        function()
          dap.toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          dap.continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dC",
        function()
          dap.run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dT",
        function()
          dap.terminate()
        end,
        desc = "Terminate",
      },
      {
        "<F8>",
        function()
          dap.step_over()
        end,
      },
      {
        "<F10>",
        function()
          dap.step_into()
        end,
      },
      {
        "<F12>",
        function()
          dap.step_out()
        end,
      },
    },
  },
}
