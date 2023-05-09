--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "nightly",   -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main",       -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false,   -- automatically reload and sync packer after a successful update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {
      -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      ["My AstroNvim Fork"] = "AnthonyMichaelTDM/AstroNvim", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- configure color scheme
  -- colorscheme = "catppuccin",
  colorscheme = "astrotheme",
  -- colorscheme = "pywal",
  -- Override highlight groups in any theme
  highlights = {
    -- apply highlight group to all colorschemes (include the default_theme)
    init = {
      -- set the transparency for all of these highlight groups
      -- Normal = { bg = "NONE", ctermbg = "NONE" },
      -- NormalNC = { bg = "NONE", ctermbg = "NONE" },
      -- FloatBorder = { bg = "NONE", ctermbg = "NONE" },
      -- CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      -- CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      -- CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      -- LineNr = {},
      -- SignColumn = {},
      -- StatusLine = {},
      -- NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      -- NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
      -- Pmenu = { bg = "NONE", ctermbg = "NONE" },
      -- WinBar = { bg = "NONE", ctermbg = "NONE" },
      -- WinBarNC = { bg = "NONE", ctermbg = "NONE" },
      -- TelescopeNormal = { bg = "NONE", ctermbg = "NONE" },
      -- TelescopePreviewNormal = { bg = "NONE", ctermbg = "NONE" },
      -- TelescopePromptNormal = { bg = "NONE", ctermbg = "NONE" },
      -- TelescopeResultsNormal = { bg = "NONE", ctermbg = "NONE" },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        -- disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ",                 -- sets vim.g.mapleader
      autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,              -- enable completion at start
      autopairs_enabled = true,        -- enable autopairs at start
      diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    setup_handlers = {
      -- add custom handler
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      -- Example disabling formatting for a specific language server
      -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
      --   on_attach = function(client, bufnr)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      -- }
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = {
        function()
          require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
            require("astronvim.utils.buffer")
                .close(bufnr)
          end)
        end,
        desc = "Pick to close",
      },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure plugins
  plugins = {
    -- github copilot
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          panel = {
            auto_refresh = true,
          },
          suggestion = {
            auto_trigger = true,
          }
        })
      end,
    },

    -- wakatime integration
    {
      'wakatime/vim-wakatime',
      lazy = false,
    },

    -- in-editor markdown preview
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      build = "cd app && npm install && git reset --hard",
      -- config = function()
      --   vim.cmd(
      --     [[
      --     function OpenMarkdownPreview (url)
      --       execute "silent ! firefox --new-window " . a:url
      --     endfunction
      --     ]]
      --   )
      --   vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      -- end,
    },

    -- rust support
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer" },
      },
    },
    {
      "rust-lang/rust.vim",
      ft = "rust",
      init = function()
        vim.g.rustfmt_autosave = 1
      end,
    },
    {
      "simrat39/rust-tools.nvim", -- add lsp plugin
      -- event = "BufEnter *.rs",
      -- after = { "mason-lspconfig.nvim" },
      dependencies = { "neovim/nvim-lspconfig", "mason-lspconfig.nvim" },
      ft = "rust",
      opts = {
        tools = {
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {
            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },
        },
      },
      config = function(_, opts, bufnr)
        require("rust-tools").setup(opts)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group,
          { buffer = bufnr })
      end,
    },
    {
      "saecki/crates.nvim",
      ft = { "rust", "toml" },
      config = function(_, opts)
        local crates = require("crates")
        crates.setup(opts)

        -- add crates as a cmp source for cargo.toml files
        vim.api.nvim_create_autocmd("bufread", {
          group = vim.api.nvim_create_augroup("cmpsourcecargo", { clear = true }),
          pattern = "cargo.toml",
          callback = function()
            require("cmp").setup.buffer({ sources = { { name = "crates" } } })
          end,
        })

        crates.show()
      end,
    },
    -- color schemes
    {
      "catppuccin/nvim",
      -- as = "catppuccin",
      lazy = false,
      config = function()
        require("catppuccin").setup {}
      end,
    },
    {
      "AlphaTechnolog/pywal.nvim",
      -- as = "pywal",
      lazy = false,
      config = function()
        require("pywal").setup()
      end,
    },
    {
      "AnthonyMichaelTDM/twilight.nvim",
      -- "folke/twilight.nvim",
      dependencies = "nvim-treesitter",
      lazy = false,
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          dimming = {
            inactive = true,
          },
          context = 0,
          node_context = 2,
          expand = {
            "function",
            "function_definition",
            "function_declaration",
            "method",
            "method_definition",
            "class",
            "class_definition",
            "table",
          },
          exclude = { "zsh", "markdown", "help", "asciidoc", "conf", "sh", "vim", "toml" },
        }
      end,
    },
    {
      "xiyaowong/transparent.nvim",
      lazy = false,
      opts = {
        groups = { -- table: default groups
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLineNr', 'CursorLine', 'EndOfBuffer', 'FloatBorder'
        },
        extra_groups = {
          "NormalFloat",                         -- plugins which have float panel such as Lazy, Mason, LspInfo
          "WinBar", "WinBarNC",                  -- scope bar
          "NeoTreeNormal", "NeoTreeNormalNC",    -- NeoTree
          "ShadeOverlay", "ShadeBrightnessPopup" -- Shade
        },
      }
    },
  },
  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   desc = "Sync packer after modifying plugins.lua",
    --   group = "packer_conf",
    --   pattern = "plugins.lua",
    --   command = "source <afile> | PackerSync",
    -- })
    -- Set up custom filetypes
    vim.filetype.add({
      extension = {
        md = function(path, bufnr)
          --return the filetype, and a function that sets variables
          return "markdown", function()
            --set variables
            vim.opt.wrap = true
          end
        end,
      },
    })

    -- suppress some warnings
    local notify = function(msg, ...)
      if msg.match("warning: multiple different client offset_encodings") then
        return
      end
      vim.notify(msg, ...)
    end
    vim.nofity = notify
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
