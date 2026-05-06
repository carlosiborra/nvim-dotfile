-- Floating filename label in each window's upper-right corner. With git/diagnostics.
return {
  "b0o/incline.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        margin   = { vertical = 0, horizontal = 1 },
        padding  = 1,
        zindex   = 30,
      },
      hide = { cursorline = true },
      render = function(props)
        local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if fname == "" then fname = "[New]" end
        local icon, color = devicons.get_icon_color(fname, vim.fn.fnamemodify(fname, ":e"))
        local modified = vim.bo[props.buf].modified

        -- diagnostics counts
        local diag = vim.diagnostic.count(props.buf)
        local diag_str = {}
        if (diag[vim.diagnostic.severity.ERROR] or 0) > 0 then
          table.insert(diag_str, { "  " .. diag[vim.diagnostic.severity.ERROR], guifg = "#f7768e" })
        end
        if (diag[vim.diagnostic.severity.WARN] or 0) > 0 then
          table.insert(diag_str, { "  " .. diag[vim.diagnostic.severity.WARN], guifg = "#e0af68" })
        end

        local result = {
          icon and { icon .. " ", guifg = color } or "",
          { fname, gui = modified and "bold,italic" or "bold" },
          modified and { "  ●", guifg = "#a6e3a1" } or "",
        }
        for _, d in ipairs(diag_str) do table.insert(result, d) end
        return result
      end,
    })
  end,
}
