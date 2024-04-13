-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    init = function()
      require('onedarkpro').setup {
        options = {
          transparency = EnableTransparency,
        },
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',
    },
  },

  --  zen-mode.nvim [distraction free mode]
  --  https://github.com/folke/zen-mode.nvim
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
  },

  -- session-manager [session]
  -- https://github.com/Shatur/neovim-session-manager
  {
    'Shatur/neovim-session-manager',
    event = 'User BaseDefered',
    cmd = 'SessionManager',
    opts = function()
      local config = require 'session_manager.config'
      return {
        autoload_mode = config.AutoloadMode.Disabled,
        autosave_last_session = false,
        autosave_only_in_session = false,
      }
    end,
    config = function(_, opts)
      local session_manager = require 'session_manager'
      session_manager.setup(opts)

      -- Auto save session
      -- BUG: This feature will auto-close anything nofile before saving.
      --      This include neotree, aerial, mergetool, among others.
      --      Consider commenting the next block if this is important for you.
      --
      --      This won't be necessary once neovim fixes:
      --      https://github.com/neovim/neovim/issues/12242
      -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
      --   callback = function ()
      --     session_manager.save_current_session()
      --   end
      -- })
    end,
  },

  {
    'ggandor/leap.nvim',
    init = function()
      require('leap').create_default_mappings()
    end,
  },
}
