return {
  "BibekBhusal0/nvim-shadcn",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-shadcn").setup({
      -- Configuration options here
    })
  end,
}
