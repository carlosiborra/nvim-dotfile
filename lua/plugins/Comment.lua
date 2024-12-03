return {
  'numToStr/Comment.nvim',
  keys = { 'gc', 'gb' },
  config = function()
    require('Comment').setup()
    mappings = {
        basic = true, -- enable basic mappings like gc
        extra = true, -- enable extra mappings
    }
  end,
}
