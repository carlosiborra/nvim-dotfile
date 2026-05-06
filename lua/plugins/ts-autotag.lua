-- Auto-close + auto-rename JSX/TSX/HTML tags. Essential for React Native work.
return {
  "windwp/nvim-ts-autotag",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "xml", "tsx", "jsx" },
  opts = {
    opts = {
      enable_close          = true,  -- auto-close <Foo>
      enable_rename         = true,  -- rename closing tag when you change opening
      enable_close_on_slash = false, -- don't fight typing </
    },
  },
}
