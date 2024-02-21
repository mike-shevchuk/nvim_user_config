
local mason = {
  "williamboman/mason.nvim",
  -- overrides `require("mason").setup(...)`

  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "stylua",
      -- "shellcheck",
      "beautysh",
      -- "shfmt",
      "flake8",
      "black",
      "isort",
      "prettier",
    })
  end,
}



local mason_null_ls = {
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources

  "jay-babu/mason-null-ls.nvim",
  -- overrides `require("mason-null-ls").setup(...)`
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "prettier",
      -- "stylua",
    })
  end,
}

local mason_dap = {
  -- use mason-dap to configure DAP installations
  "jay-babu/mason-nvim-dap.nvim",
  -- overrides `require("mason-nvim-dap").setup(...)`
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      -- "python",
    })
  end,
}


--
local luaSnip = {
  "L3MON4D3/LuaSnip",
  keys = function() return {} end,
}
-- then: setup supertab in cmp
local nvim_cmp = {
  "hrsh7th/nvim-cmp",
  event = {"BufRead", "BufNewFile"},
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    "onsails/lspkind-nvim",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("nvim-autopairs").setup()

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    --load snippet
    require("luasnip.loaders.from_vscode").lazy_load()
    
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["C-c"] = cmp.mapping.close(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        
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
        
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 10},
        { name = "luasnip", max_item_count = 5 },
        { name = "codeium", max_item_count = 5},
        { name = "buffer"},
        { name = "path", max_item_count = 5 },
        { name = "emoji", max_item_count = 3 },
        

    }),
      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 100,
          ellipsis_char = "...",
          symbol_map ={
            codeium = "",
          },
        }),
      },


      experiremental = {
        ghost_text = true,
         
      },virtual
    })

  end,
}

return { mason, mason_null_ls, mason_dap, nvim_cmp, luaSnip }
