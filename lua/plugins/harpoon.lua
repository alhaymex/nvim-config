return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", function() mark.add_file() end, { desc = "Harpoon Add File" })
      vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end, { desc = "Harpoon Quick Menu" })

      vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end, { desc = "Harpoon File 1" })
      vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end, { desc = "Harpoon File 2" })
      vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end, { desc = "Harpoon File 3" })
      vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end, { desc = "Harpoon File 4" })
      vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end, { desc = "Harpoon File 5" })
    end,
  },
}
