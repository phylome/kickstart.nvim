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

  {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },

    config = function()
      local logo = {
        '       ~                =              ',
        '       ooo ~             oo ~          ',
        '   ~ =oo+o=+~           =oooo          ',
        ' ~~+o+ooo====           =ooooo= ~      ',
        '~==.=oo+o====o=         ~oooo+o+=      ',
        '~+.+.==o+=+===o+~       +oo++o+++      ',
        '~=..==.=o===+===+=      ~++++++++~     ',
        '~.+....==+=++====o=~    ~++++++++~     ',
        '~..++....~+=+======     ~o+++++++~     ',
        '~.....++.~+ +==.+===+~  ~++++~+~+~     ',
        '~.~......~  ~.===.==+=  ~~++~+~+~~     ',
        '~........~   ~ =.==++=++~~~~~~~~~~     ',
        '~.....=..~      ==++==+++~~~~~~~~~     ',
        '~....... ~      ~+=+++++~++~~~~~~~     ',
        '~.. .....~         ++++++~+~~~~~~~     ',
        '~........~          +=.++~+~+~~~.      ',
        ' ~~ . . .~          ~==+++~+~+~ ~      ',
        '  ~~~ .. ~            .++~+~~ ~        ',
        '     ~~  ~            ~ =~+ ~          ',
        '      ~~~~              ~ ~            ',
      }

      local settings = {
        -- every line should be same width without escaped \
        header = {
          type = 'text',
          align = 'center',
          fold_section = false,
          title = 'Header',
          margin = 50,
          content = logo,
          highlight = 'Statement',
          default_color = '',
          oldfiles_amount = 0,
        },
        parts = {
          'header',
        },
      }
      require('startup').setup(settings)
    end,
  },
}
