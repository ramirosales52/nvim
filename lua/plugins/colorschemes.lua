return {
  { "marko-cerovac/material.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "shaunsingh/nord.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "vague2k/vague.nvim" },
  { "rose-pine/neovim" },
  { "yorumicolors/yorumi.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "arzg/vim-colors-xcode" },
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon",
    },
  },
}
