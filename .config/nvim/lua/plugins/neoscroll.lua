return {
  "karb94/neoscroll.nvim",
  event = "BufEnter",
  opts = {
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
    hide_cursor = false,
    duration_multiplier = 0.6,
    easing = "circular",
  },
}
