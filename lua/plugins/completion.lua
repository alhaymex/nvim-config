return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- source for LSP completion
      "hrsh7th/cmp-buffer",   -- source for text inside current buffer
      "hrsh7th/cmp-path",     -- source for filesystem paths
      "L3MON4D3/LuaSnip",     -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- adapter for luasnip
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- cycle previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- cycle next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),     -- trigger completion manual popup
          ["<C-e>"] = cmp.mapping.abort(),            -- close popup window
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion (Enter)
          
          -- Tab navigation behavior
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Order of sources matters for priority
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- 1st priority: LSP suggestions
          { name = "luasnip" },  -- 2nd priority: Snippets
          { name = "path" },     -- 3rd priority: File paths
          { name = "buffer" },   -- 4th priority: Words in file
        }),
      })
    end,
  },
}
