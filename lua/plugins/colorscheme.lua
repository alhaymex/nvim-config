return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Make sure this loads before other plugins
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Choose from: storm, moon, night, day
        transparent = true, -- Enable transparent background
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      
      -- Load the colorscheme
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
