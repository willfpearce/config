-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LOAD MACROS
vim.schedule(function()
  -- Concatenate comment line to previous line
  vim.fn.setreg("f", "0dwkJ")
  print("Macro 'f' loaded:", vim.fn.getreg("f"))

  -- Create ASM comment line break
  vim.fn.setreg("d", "Dd0xi//70a-0ll10l")
  print("Macro 'd' loaded:", vim.fn.getreg("d"))

  -- Create ASM subroutine comment template (requires @d above)
  vim.fn.setreg("s", "@do@dO Name:    oPurpose: oInput:   NoneoOutput:  None")
  print("Macro 's' loaded:", vim.fn.getreg("s"))

  -- "ATxmega128A1Udef.inc" file path
  vim.fn.setreg(
    "p",
    "C:/Program Files (x86)/Atmel/Studio/7.0/Packs/atmel/XMEGAA_DFP/1.3.146/avrasm/inc/ATxmega128A1Udef.inc"
  )
end)
