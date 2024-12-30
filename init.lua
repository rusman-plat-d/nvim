-- Basic Settings
vim.opt.number = true          -- Line numbers
vim.opt.relativenumber = false -- Relative line numbers
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.shiftwidth = 4         -- Indent size
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.smartindent = true
vim.o.background = 'dark'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
-- vim.opt.guicursor = "n-v-c:block,i:ver25,r-cr-o:hor20"
vim.opt.list = true
vim.opt.listchars = {
  -- tab = '› ',            -- Tab character
  tab = '→ ', -- Tab character
  trail = '·', -- Trailing spaces
  -- trail = '•',           -- Trailing spaces
  nbsp = '␣', -- Non-breaking space
  -- eol = '↴',             -- End of line
}

-- vim.opt.statusline = "%f" -- Display full file path in the status line
vim.opt.tabline = "%f"

vim.opt.mouse = "a" -- Use Mouse for Copy-Paste

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install Plugins using Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'          -- Plugin manager
  use 'neovim/nvim-lspconfig'           -- LSP configuration
  use {
    'nvim-treesitter/nvim-treesitter',  -- Syntax highlighting
    run = ':TSUpdate'                   -- Automatically update parsers
  }
  use 'jose-elias-alvarez/null-ls.nvim' -- Formatting and linting
  use {
    'nvim-tree/nvim-tree.lua',          -- File Explorer
    requires = {
      'nvim-tree/nvim-web-devicons',    -- optional, for file icons
    },
    -- tag = 'nightly'                     -- optional, updated every week
  }

  use 'hrsh7th/nvim-cmp'     -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'   -- Buffer completions
  use 'hrsh7th/cmp-path'     -- Path completions
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate"                  -- Optional: Automatically update Mason on install
  }
  use 'williamboman/mason-lspconfig.nvim' -- Easy LSP integration with Mason
  use {
    "jayp0521/mason-null-ls.nvim",
    requires = { "jose-elias-alvarez/null-ls.nvim" }
  }
  use {
    "jayp0521/mason-nvim-dap.nvim",
    requires = { "mfussenegger/nvim-dap" }
  }
  use 'onsails/lspkind-nvim'               -- Icons for LSP
  use 'mfussenegger/nvim-lint'             -- Linting
  use 'prettier/vim-prettier'              -- Formatting
  use 'nvim-lua/plenary.nvim'              -- Dependency for Telescope
  use 'akinsho/toggleterm.nvim'            -- Terminal management
  use 'nvim-telescope/telescope.nvim'      -- Fuzzy finder
  use 'nvim-lualine/lualine.nvim'          -- Statusline
  use 'tpope/vim-commentary'               -- Commenting utility
  use 'Mofiqul/vscode.nvim'                -- VS Code Theme
  use 'fatih/vim-go'                       -- Go-related tools (optional)
  use 'jose-elias-alvarez/typescript.nvim' -- TypeScript tooling
  use 'L3MON4D3/LuaSnip'                   -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'           -- Snippet completions
  use 'mfussenegger/nvim-dap'              -- Core debugging plugin
  use 'rcarriga/nvim-dap-ui'               -- UI for nvim-dap
  use 'theHamsta/nvim-dap-virtual-text'    -- Inline debugging info
  use 'nvim-telescope/telescope-dap.nvim'  -- Telescope integration for nvim-dap
  use 'tpope/vim-fugitive'                 -- Git commands in Neovim
  use 'lewis6991/gitsigns.nvim'            -- Git signs in the gutter (added, changed, removed lines)
  use 'kdheepak/lazygit.nvim'              -- LazyGit integration
  use 'lukas-reineke/indent-blankline.nvim'
  use 'HiPhish/rainbow-delimiters.nvim'
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- PHP-specific support
  use 'phpactor/phpactor'         -- PHP IDE-like features
  use 'stephpy/vim-php-cs-fixer'  -- PHP code formatter
  use 'StanAngeloff/php.vim'      -- PHP syntax highlighting
  -- Blade template support
  use 'jwalton512/vim-blade'      -- Blade syntax highlighting
  -- use 'theodesp/nvim-treesitter-blade'
  use 'noahfrederick/vim-laravel' -- Laravel artisan commands
end)


-- Keybinding Configuration for VSCode-like Shortcuts
vim.g.mapleader = " " -- Set Space as the Leader key

-- File Operations
vim.keymap.set('n', '<leader>o', ':edit ', { noremap = true, silent = true }) -- Open file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })     -- Save file

-- File Navigation
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Terminal Toggle
vim.keymap.set('n', '<C-t>', ':split | terminal<CR>', { noremap = true, silent = true })

-- Window Management
vim.keymap.set('n', '<C-S-\\>', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':close<CR>', { noremap = true, silent = true })

-- Navigation
vim.keymap.set('n', '<A-Left>', '<C-o>', { noremap = true, silent = true })  -- Go back
vim.keymap.set('n', '<A-Right>', '<C-i>', { noremap = true, silent = true }) -- Go forward

-- Insert Line (Like Ctrl+Enter / Shift+Enter)
vim.keymap.set('n', '<C-Enter>', 'o<Esc>', { noremap = true })
vim.keymap.set('n', '<S-Enter>', 'O<Esc>', { noremap = true })

-- Yank to system clipboard
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+yg_', { noremap = true, silent = true })

-- Paste from system clipboard
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true, silent = true })

-- Key mappings for linting and formatting
vim.api.nvim_set_keymap('n', '<leader>l', ':lua require("lint").try_lint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':Prettier<CR>', { noremap = true })

-- Debugging with nvim-dap
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<S-F11>', ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })

-- Git Integration
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Comments (Requires vim-commentary)
vim.keymap.set('n', '<C-/>', 'gcc', { noremap = true }) -- Toggle comment in normal mode
vim.keymap.set('v', '<C-/>', 'gc', { noremap = true })  -- Toggle comment in visual mode

-- Undo // Redo
vim.keymap.set('i', '<C-u>', '<C-o>u', { noremap = true, silent = true })
vim.keymap.set('i', '<C-r>', '<C-o><C-r>', { noremap = true, silent = true })

-- Laravel specific mappings
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>!php artisan route:list<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lm', '<cmd>!php artisan make:', {})
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>!php artisan tinker<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>!php artisan cache:clear<CR>', { noremap = true, silent = true })

require("nvim-web-devicons").setup({
  default = true,
})

-- Nvim Tree Configuration
-- require("nvim-tree").setup({})
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true, -- Disable netrw
  hijack_netrw = true,  -- Hijack netrw window
  actions = {
    open_file = {
      quit_on_open = false, -- Close tree when opening a file
      resize_window = true,
    },
  },
  diagnostics = {
    enable = true, -- Show diagnostics in the tree
    -- icons = {
    --   hint = "",
    --   info = "",
    --   warning = "",
    --   error = "",
    -- },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true, -- Enable git integration
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = "all", -- Highlights the opened file
    full_name = true,               -- Ensures the full path is displayed
    icons = {
      glyphs = {
        -- default = "",
        -- symlink = "",
        -- bookmark = "󰆤",
        modified = "●",
        -- folder = {
        --   arrow_closed = "",
        --   arrow_open = "",
        --   default = "",
        --   open = "",
        --   empty = "",
        --   empty_open = "",
        --   symlink = "",
        --   symlink_open = "",
        -- },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
    },
    special_files = {
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md",
      "package.json",
    },
    symlink_destination = true,
  },
  update_focused_file = {
    enable = true,
    -- update_cwd = false,
    update_cwd = true, -- Optionally update the working directory
  },
  view = {
    width = 30,    -- Width of the tree window
    side = "left", -- Display tree on the left
    -- mappings = {
    --   list = {
    --     { key = { "o", "<CR>" }, action = "edit" },
    --     { key = "<C-v>",         action = "vsplit" },
    --     { key = "<C-x>",         action = "split" },
    --     { key = "<C-t>",         action = "tabnew" },
    --   },
    -- },
  },
})
-- require'nvim-web-devicons'.get_icons()

-- Keybinding for toggling Nvim Tree
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- Treesitter for Better Syntax Highlighting
require('nvim-treesitter.configs').setup {
  -- ensure_installed = "all",
  -- ensure_installed = { "blade", "cpp", "css", "go", "html", "json", "python", "lua", "javascript", "php", "rust", "typescript", "tsx", "yaml" }, -- Install parsers for these languages
  ensure_installed = {
    "cpp", "css", "go", "html", "json", "python", "lua",
    "javascript", "php", "rust", "typescript", "tsx", "vue", "yaml"
  },               -- Install parsers for these languages
  highlight = {
    enable = true, -- Enable syntax highlighting
    -- additional_vim_regex_highlighting = { "blade" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true -- Enable automatic indentation
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",    -- Initialize selection
      node_incremental = "grn",  -- Increment node selection
      scope_incremental = "grc", -- Increment scope selection
      node_decremental = "grm",  -- Decrement selection
    },
  }
}

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope Key Bindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })


-- Lualine Statusline
-- require('lualine').setup()
require('lualine').setup {
  options = {
    theme = 'auto',          -- Matches your color scheme
    section_separators = '', -- Simplified style
    component_separators = ''
  }
}


-- LSP Setup
local lspconfig = require('lspconfig')
local cmp = require 'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
  automatic_installation = true, -- Automatically install servers
})

cmp.setup({
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    format = require('lspkind').cmp_format({ with_text = true, maxwidth = 50 })
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

require("mason-lspconfig").setup_handlers({
  -- Default handler
  function(server_name)
    lspconfig[server_name].setup({})
  end,

  -- Specific server configuration
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } }, -- Fix "undefined global 'vim'" for Lua
        },
      },
    })
  end,
})

require("mason-null-ls").setup({
  ensure_installed = { "prettier", "eslint_d" },
  automatic_installation = true,
})

require("mason-nvim-dap").setup({
  ensure_installed = { "python", "node2" },
  automatic_installation = true,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.prettier, -- Use Prettier for formatting
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "typescript", "javascript", "json", "yaml" },
    }),
    -- Formatting
    -- null_ls.builtins.formatting.prettier, -- For JavaScript, TypeScript, etc.
    null_ls.builtins.formatting.stylua, -- For Lua
    null_ls.builtins.diagnostics.eslint_d,

    -- Linting
    null_ls.builtins.diagnostics.eslint, -- For JavaScript, TypeScript, etc.
    null_ls.builtins.diagnostics.flake8, -- For Python

    -- Code Actions
    null_ls.builtins.code_actions.gitsigns, -- Git-related actions
  },
})

require('lint').linters_by_ft = {
  yaml = { 'yamllint' },
}

-- Helper function to set up LSP keymaps
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end


-- Angular LSP
lspconfig.angularls.setup {}

-- Python LSP
lspconfig.pyright.setup {
  on_attach = on_attach
}

-- JavaScript/TypeScript LSP
lspconfig.ts_ls.setup {
  on_attach = on_attach
}

-- -- Set up TypeScript LSP
-- lspconfig.tsserver.setup({
--   on_attach = function(client, bufnr)
--     -- Optional: Disable formatting if using a different formatter like Prettier
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false

--     -- Keymaps for LSP
--     local opts = { noremap = true, silent = true }
--     local buf_set_keymap = vim.api.nvim_buf_set_keymap
--     buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--     buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--     buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   end,
-- })

-- Setup TypeScript language server
-- require('typescript').setup({
--   server = {
--     on_attach = function(client, bufnr)
--       local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--       local opts = { noremap = true, silent = true }
--       buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--       buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     end,
--   },
-- })

-- C/C++ LSP
-- lspconfig.clangd.setup{
--     on_attach = on_attach
-- }

-- Go LSP
lspconfig.gopls.setup {
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true, -- Auto-import completion
      experimentalPostfixCompletions = true,
    },
  },
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Key mappings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

    -- Auto-import on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- synchronously organize imports
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for client_id, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            end
          end
        end
      end,
    })
  end,
}

-- Intelephense setup
lspconfig.intelephense.setup {
  settings = {
    intelephense = {
      stubs = {
        "bcmath", "bz2", "calendar", "Core", "curl", "date",
        "dba", "dom", "enchant", "fileinfo", "filter", "ftp",
        "gd", "gettext", "hash", "iconv", "imap", "intl",
        "json", "ldap", "libxml", "mbstring", "mcrypt", "mysql",
        "mysqli", "password", "pcntl", "pcre", "PDO", "pdo_mysql",
        "Phar", "readline", "recode", "Reflection", "regex",
        "session", "SimpleXML", "soap", "sockets", "sodium",
        "SPL", "standard", "superglobals", "sysvsem", "sysvshm",
        "tokenizer", "xml", "xdebug", "xmlreader", "xmlwriter",
        "yaml", "zip", "zlib", "wordpress", "phpunit", "laravel"
      },
    }
  }

}

-- Rust LSP
lspconfig.rust_analyzer.setup {
  on_attach = on_attach
}

-- HTML/CSS/JSON LSP
lspconfig.html.setup {
  on_attach = on_attach
}
lspconfig.cssls.setup {
  on_attach = on_attach
}
lspconfig.jsonls.setup {
  on_attach = on_attach
}

-- Lua LSP
lspconfig.lua_ls.setup {
  on_attach = on_attach
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.k8s.yaml", -- Example: Add Kubernetes schema support
      },
    },
  },
}

vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })

require('gitsigns').setup {
  -- signs = {
  --     add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr' },
  --     change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr' },
  --     delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr' },
  --     topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
  --     changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr' },
  -- },
  current_line_blame = true, -- Show git blame on the current line
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Keybindings for gitsigns
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)
  end
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "vendor" },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",     -- Move down
        ["<C-k>"] = "move_selection_previous", -- Move up
      },
    },
  },
}

-- Optional: Load Telescope extensions (e.g., for FZF-like performance)
pcall(require('telescope').load_extension, 'fzf')

-- require("trouble").setup()
require("trouble").setup {
  position = "bottom", -- position of the list: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  -- fold_open = "", -- icon for open folds
  -- fold_closed = "", -- icon for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  action_keys = { -- key mappings for actions in the trouble list
    close = "q", -- close the list
    refresh = "r", -- manually refresh
    jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open location
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P", -- toggle auto preview
    hover = "K", -- show details about the diagnostic under the cursor
    preview = "p", -- preview the location of the diagnostic
    close_folds = {"zM", "zm"}, -- close all folds
    open_folds = {"zR", "zr"}, -- open all folds
    toggle_fold = {"zA", "za"}, -- toggle fold under the cursor
    previous = "k", -- previous item
    next = "j" -- next item
  },
  indent_lines = true, -- add indent guide below the fold icons
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = false, -- automatically close the list when diagnostics are cleared
  auto_preview = false, -- automatically preview the location of the diagnostic
  auto_fold = false, -- automatically fold a file's diagnostics on open
  -- signs = {
  --   error = "",
  --   warning = "",
  --   hint = "",
  --   information = "",
  --   other = "﫠"
  -- },
  use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})


-- local highlight = {
--   "RainbowRed",
--   "RainbowYellow",
--   "RainbowBlue",
--   "RainbowOrange",
--   "RainbowGreen",
--   "RainbowViolet",
--   "RainbowCyan",
-- }
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
--   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require("ibl").setup { scope = { highlight = highlight } }

-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- Load the VS Code theme
require('vscode').setup({
  -- Enable transparent background (default: false)
  transparent = false,

  -- Enable italic comment (default: false)
  italic_comments = true,

  -- Disable nvim-tree background color (default: false)
  disable_nvimtree_bg = true,

  -- Color overrides for specific groups
  color_overrides = {
    vscLineNumber = '#FFFFFF', -- Example: Custom color for line numbers
  },

  -- Group overrides for specific highlights
  group_overrides = {
    Cursor = { fg = '#FFFFFF', bg = '#FF0000', bold = true },
  }
})

-- Load the colorscheme
vim.cmd('colorscheme vscode')

require("toggleterm").setup {
  size = 20,                         -- Height of the terminal split
  open_mapping = [[<C-\>]],          -- Shortcut to toggle terminal
  hide_numbers = true,               -- Hide line numbers
  shade_filetypes = {},
  shade_terminals = true,            -- Apply shading
  shading_factor = 2,                -- Degree of shading
  start_in_insert = true,            -- Start in insert mode
  insert_mappings = true,            -- Use mappings in insert mode
  terminal_mappings = true,          -- Use mappings in terminal mode
  persist_size = true,
  direction = 'horizontal',          -- VSCode-style terminal at the bottom
  close_on_exit = true,              -- Close terminal when process exits
  shell = vim.o.shell,               -- Default shell
  float_opts = { border = "curved" } -- Rounded corners for floating terminal
}

-- Open/close the terminal
vim.api.nvim_set_keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Switch between terminal and editor
vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Map CTRL+L to clear the terminal in terminal mode
-- vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n>:clear<CR>i]], { noremap = true, silent = true })

-- Open terminal with specific IDs
vim.api.nvim_set_keymap("n", "<leader>t1", ":1ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t2", ":2ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t3", ":3ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t4", ":4ToggleTerm<CR>", { noremap = true, silent = true })
