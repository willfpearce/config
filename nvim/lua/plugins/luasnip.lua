return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    -- Optional: Load friendly snippets
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    -- Correct keys configuration
    keys = function()
      local ls = require("luasnip")
      return {
        {
          "<Tab>",
          function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
          end,
          mode = "i",
          desc = "Expand or jump forward in snippet",
          silent = true,
        },
        {
          "<S-Tab>",
          function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
            end
          end,
          mode = "i",
          desc = "Jump backward in snippet",
          silent = true,
        },
      }
    end,

    config = function()
      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
