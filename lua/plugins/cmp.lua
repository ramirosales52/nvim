return {
  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Latex
  { "kdheepak/cmp-latex-symbols" },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "latex_symbols", option = { strategy = 2 } },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, item)
            local KIND_ICONS = {
              Tailwind = "██████████",
            }

            if item.kind == "Color" and entry.completion_item.documentation then
              local doc = entry.completion_item.documentation

              if type(doc) == "table" and doc.value then
                doc = doc.value
              end

              local _, _, r, g, b = string.find(doc or "", "^rgb%((%d+), (%d+), (%d+)")
              local color

              if r and g and b then
                color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
              else
                local hex = (doc or ""):match("#%x%x%x%x%x%x")
                if hex then
                  color = hex:gsub("#", "")
                else
                  item.kind = LazyVim.config.icons.kinds.Color .. item.kind

                  return item
                end
              end

              local group = "Tw_" .. color

              if vim.api.nvim_call_function("hlID", { group }) < 1 then
                vim.api.nvim_command("highlight " .. group .. " guifg=#" .. color)
              end

              item.kind = KIND_ICONS.Tailwind
              item.kind_hl_group = group

              return item
            end

            -- Otros tipos de sugerencia
            item.kind = KIND_ICONS[item.kind] or item.kind

            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
            cmp.config.compare.scopes,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<S-CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          ["<C-e>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<tab>"] = function(fallback)
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end,
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
      })
    end,
  },
  main = "lazyvim.util.cmp",
}
