return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    event = "InsertEnter",
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type for details
      }

      vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

      -- Recommended/example keymaps
      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask "@this: "
      end, { desc = "Ask OpenCode…" })
      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select OpenCode…" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator "@this "
      end, { desc = "Append range to OpenCode", expr = true })
      vim.keymap.set("n", "goo", function()
        return require("opencode").operator "@this " .. "_"
      end, { desc = "Append line to OpenCode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command "session.half.page.up"
      end, { desc = "Scroll OpenCode up" })
      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command "session.half.page.down"
      end, { desc = "Scroll OpenCode down" })
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua", -- for providers='copilot'
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {}
  --   end,
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = function()
  --     -- conditionally use the correct build system for the current OS
  --     if vim.fn.has "win32" == 1 then
  --       return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --     else
  --       return "make"
  --     end
  --   end,
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     provider = "claude",
  --     providers = {
  --       claude = {
  --         endpoint = "https://api.anthropic.com",
  --         model = "claude-sonnet-4-20250514",
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 0.75,
  --           max_tokens = 20480,
  --         },
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
  --     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     -- "stevearc/dressing.nvim", -- for input provider dressing
  --     -- "folke/snacks.nvim", -- for input provider snacks
  --     -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     -- {
  --     --   -- Make sure to set this up properly if you have lazy=true
  --     --   "MeanderingProgrammer/render-markdown.nvim",
  --     --   opts = {
  --     --     file_types = { "markdown", "Avante" },
  --     --   },
  --     --   ft = { "markdown", "Avante" },
  --     -- },
  --   },
  -- },
}
