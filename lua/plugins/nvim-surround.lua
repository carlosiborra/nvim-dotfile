-- ys, cs, ds operators for surround. Daily-use in any language.
-- Examples: ysiw" → wrap word in quotes; cs"' → change " to '; ds( → delete surrounding ()
return {
  "kylechui/nvim-surround",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
