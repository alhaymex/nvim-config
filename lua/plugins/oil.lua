return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },   
    config = function()
      local oil = require("oil")

      oil.setup({
        default_file_explorer = true,  
        columns = {
          "icon",
        },
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            oil.open()
          end
        end,
      })
    end,
  },
}
