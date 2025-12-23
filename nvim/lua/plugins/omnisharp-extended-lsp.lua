return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    config = function()
      -- extended goto references with "gr"
      vim.keymap.set("n", "gr", function()
        require("omnisharp_extended").telescope_lsp_references(
          require("telescope.themes").get_ivy({ excludeDefinition = true })
        )
      end, { noremap = true })
      -- extended goto defintion with "gd"
      vim.keymap.set("n", "gd", require("omnisharp_extended").telescope_lsp_definition, { noremap = true })
      -- extended goto references with "<leader>D"
      vim.keymap.set("n", "<leader>D", function()
        require("omnisharp_extended").telescope_lsp_references()
      end, { noremap = true })
      -- extended goto implentation with "gi"
      vim.keymap.set("n", "gi", require("omnisharp_extended").telescope_lsp_implementation, { noremap = true })
    end,
  },
}
