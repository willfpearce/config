return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      projects = {
        dev = {
          vim.fn.expand("~/dev"),
          vim.fn.expand("~/projects"),
          vim.fn.expand("~/source/repos"),
          vim.fn.expand("~/code"),
        },
      },
    },
  },
}
