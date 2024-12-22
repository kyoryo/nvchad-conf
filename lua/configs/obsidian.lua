local opts = {
  workspaces = {
    {
      name = "pc personal",
      path = "/mnt/c/Users/franz/Dropbox/ObsidianVault/kyoryo",
    },
  },

  notes_subdir = "literature_notes",
  new_notes_location = "notes_subdir",
  daily_notes = {
    folder = "daily",
    templates = "templates/daily.md",
  },
  completion = {
    nvim_cmp = true,
  },

  -- Either 'wiki' or 'markdown'.
  preferred_link_style = "wiki",

  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Optional, boolean or a function that takes a filename and returns a boolean.
  -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local out = {
      id = note.id,
      aliases = note.aliases,
      tags = note.tags,
    }

    local getDate = function(metadata)
      local date = os.date "%Y-%M-%d"
      if metadata == nil then
        return date
      end
      return metadata.date
    end

    note.metadata = {
      date = getDate(note.metadata),
      last_edited = os.date "%Y-%B-%d",
    }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  -- Optional, for templates (see below).
  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    -- substitutions = {
    --   [":id"] = function()
    --     return os.date "%Y-%m-%d-%H-%M-%S"
    --   end,
    -- },
  },

  -- key mappings, below are the defaults
  mappings = {
    -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- toggle check-boxes
    ["<leader>ot"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  -- -- Optional, define your own callbacks to further customize behavior.
  -- callbacks = {
  --   -- Runs at the end of `require("obsidian").setup()`.
  --   ---@param client obsidian.Client
  --   post_setup = function(client) end,
  --
  --   -- Runs anytime you enter the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   enter_note = function(client, note) end,
  --
  --   -- Runs anytime you leave the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   leave_note = function(client, note) end,
  --
  --   -- Runs right before writing the buffer for a note.
  --   ---@param client obsidian.Client
  --   ---@param note obsidian.Note
  --   pre_write_note = function(client, note) end,
  --
  --   -- Runs anytime the workspace is set/changed.
  --   ---@param client obsidian.Client
  --   ---@param workspace obsidian.Workspace
  --   post_set_workspace = function(client, workspace) end,
  -- },

  ui = {
    -- Disable some things below here because I set these manually for all Markdown files using treesitter
    checkboxes = {},
    bullets = {},
  },
}

return require("obsidian").setup(opts)
