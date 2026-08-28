return {
  -- 1. Extend Tree-sitter to handle Elixir and HEEx structural templates
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex", "html" })
      end
    end,
  },

  -- 2. Configure Mason to auto-install the required servers
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir-ls", "tailwindcss-language-server" })
    end,
  },

  -- 3. Configure the LSPs inside LazyVim's native lspconfig handler
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ElixirLS Setup
        elixirls = {
          cmd = { "elixir-ls" },
          settings = {
            elixirLS = {
              dialyzerEnabled = true,
              fetchDeps = false,
              enableTestLenses = false,
            },
          },
        },
        -- Tailwind CSS Setup for styling auto-complete inside HEEx files
        tailwindcss = {
          filetypes = { "html", "elixir", "eelixir", "heex" },
          init_options = {
            userLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
            },
          },
        },
      },
      -- Ensure proper filetype detection maps cleanly to the LSP
      setup = {
        elixirls = function()
          vim.filetype.add({
            extension = {
              ex = "elixir",
              exs = "elixir",
              eex = "eelixir",
              heex = "heex",
            },
          })
        end,
      },
    },
  },

  -- 4. Sensible formatting settings for Phoenix source files
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        heex = { "mix" },
      },
    },
  },
}
