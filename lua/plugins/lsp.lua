return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "ts_ls", 
          "clangd", 
          "zls", 
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.tbl_extend("force", opts, { desc = "LSP Hover Docs" }))
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, vim.tbl_extend("force", opts, { desc = "Workspace Symbol" }))
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, vim.tbl_extend("force", opts, { desc = "Line Diagnostic" }))
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, vim.tbl_extend("force", opts, { desc = "Prev Diagnostic" }))
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, vim.tbl_extend("force", opts, { desc = "Code Action" }))
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, vim.tbl_extend("force", opts, { desc = "Signature Help" }))
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_lsp_status then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      vim.lsp.config("*", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })

      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("zls")
    end,
  },
}
