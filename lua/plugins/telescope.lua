return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- 5–10× faster sorter
    "nvim-telescope/telescope-ui-select.nvim",                       -- vim.ui.select replacement
  },
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { "%.git/", "node_modules/", "%.DS_Store" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = function(prompt_bufnr)
              actions.send_selected_to_qflist(prompt_bufnr)
              actions.open_qflist()
            end,
          },
        },
      },
      pickers = {
        find_files = { theme = "dropdown", hidden = true },
        live_grep  = { theme = "dropdown" },
        buffers    = { theme = "dropdown", previewer = false, sort_lastused = true },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension, "projects")
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Help" },
    { "<leader>fp", "<cmd>Telescope projects<cr>",     desc = "Projects" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",     desc = "Recent files" },
    { "<leader>fc", "<cmd>Telescope commands<cr>",     desc = "Commands" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>",      desc = "Keymaps" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",  desc = "Diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",   desc = "Doc symbols" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>",  desc = "Workspace symbols" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>",  desc = "Grep word under cursor" },
  },
}
