-- Perf: enable Lua module bytecode cache (50-80% faster cold startup on Neovim 0.9+)
if vim.loader and vim.loader.enable then
  vim.loader.enable()
end

-- Perf: disable unused built-in plugins (~10ms shave on startup)
local disabled_built_ins = {
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin",
  "vimball", "vimballPlugin",
  "2html_plugin", "logipat", "rrhelper",
  "spellfile_plugin", "matchit", "tutor", "rplugin",
}
for _, plugin in ipairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

require("config.config")
require("config.lazy-config")
require("config.autocmds")
require("keymaps.keymaps")
