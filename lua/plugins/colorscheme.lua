return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- simply point at our Catppuccin-flavour loader
      colorscheme = function()
        vim.cmd([[colorscheme catppuccin]])
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load immediately so overrides are applied
    priority = 1000, -- ensure it loads before other plugins
    opts = {
      flavour = "mocha", -- set mocha flavour
      background = { -- maintain dark background mapping
        light = "latte",
        dark = "mocha",
      },
      -- apply our pure-black overrides here
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    -- bufferline integration remains unchanged
    dependencies = { "akinsho/bufferline.nvim" },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])
      -- ensure any leftover highlights are true black
      vim.cmd([[highlight Normal guibg=#000000]])
      vim.cmd([[highlight NonText guibg=#000000]])
    end,
  },
}
