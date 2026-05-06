return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "package.json", "pyproject.toml", "go.mod" },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    pcall(function() require("telescope").load_extension("projects") end)
  end,
}
