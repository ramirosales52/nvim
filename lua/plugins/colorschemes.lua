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
  { "datsfilipe/min-theme.nvim" },
  { "datsfilipe/vesper.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "savq/melange-nvim" },
  { "fenetikm/falcon" },
  { "kdheepak/monochrome.nvim" },
  { "frenzyexists/aquarium-vim" },
  { "kvrohit/substrata.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "nyngwang/nvimgelion" },
  { "cryptomilk/nightcity.nvim", version = "*" },
  { "alexmozaidze/palenight.nvim" },
  { "slugbyte/lackluster.nvim" },
  { "diegoulloao/neofusion.nvim", priority = 1000, config = true },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
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
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "kyazdani42/blue-moon",
    config = function()
      vim.opt.termguicolors = true
    end,
  },
  {
    "sainnhe/edge",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.edge_enable_italic = true
    end,
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
    "sontungexpt/witch",
    priority = 1000,
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-moon", -- default colorsheme
    },
  },
}
