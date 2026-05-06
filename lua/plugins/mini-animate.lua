-- Smooth scroll, cursor, resize, open/close animations. Cursor/VS Code feel.
-- Disable any of these by setting `enable = false` on the matching entry.
return {
  "echasnovski/mini.animate",
  event = "VeryLazy",
  config = function()
    local animate = require("mini.animate")
    animate.setup({
      cursor = {
        enable   = true,
        timing   = animate.gen_timing.linear({ duration = 80, unit = "total" }),
      },
      scroll = {
        enable   = true,
        timing   = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        -- skip animation for huge jumps so PageDown/G feels snappy
        subscroll = animate.gen_subscroll.equal({
          predicate = function(total) return total > 1 and total <= 200 end,
        }),
      },
      resize = {
        enable   = true,
        timing   = animate.gen_timing.linear({ duration = 80, unit = "total" }),
      },
      open  = { enable = false }, -- window-open animation is jarring with snacks dashboard
      close = { enable = false },
    })
  end,
}
