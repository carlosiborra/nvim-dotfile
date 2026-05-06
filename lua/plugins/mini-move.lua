-- Move lines (normal) or selections (visual) with Alt-Arrow. Auto-reindents.
-- Using Alt-Arrow instead of Alt-hjkl avoids collision with Copilot's <M-l>
-- (accept ghost text) in insert mode.
return {
  "echasnovski/mini.move",
  event = "VeryLazy",
  opts = {
    mappings = {
      left       = "<M-Left>",
      right      = "<M-Right>",
      down       = "<M-Down>",
      up         = "<M-Up>",
      line_left  = "<M-Left>",
      line_right = "<M-Right>",
      line_down  = "<M-Down>",
      line_up    = "<M-Up>",
    },
  },
}
