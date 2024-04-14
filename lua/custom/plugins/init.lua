-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
-- NOTE: My wishlist for plugins
-- - Markdown Preview
-- - Oil (instead of Neotree?)
--
--
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

  {
    'ggandor/leap.nvim',
    init = function()
      require('leap').create_default_mappings()
    end,
  },

  {
    'tpope/vim-fugitive',
  },

  -- config = function()
  --   local logo = {
  --     '       ~                =              ',
  --     '       ooo ~             oo ~          ',
  --     '   ~ =oo+o=+~           =oooo          ',
  --     ' ~~+o+ooo====           =ooooo= ~      ',
  --     '~==.=oo+o====o=         ~oooo+o+=      ',
  --     '~+.+.==o+=+===o+~       +oo++o+++      ',
  --     '~=..==.=o===+===+=      ~++++++++~     ',
  --     '~.+....==+=++====o=~    ~++++++++~     ',
  --     '~..++....~+=+======     ~o+++++++~     ',
  --     '~.....++.~+ +==.+===+~  ~++++~+~+~     ',
  --     '~.~......~  ~.===.==+=  ~~++~+~+~~     ',
  --     '~........~   ~ =.==++=++~~~~~~~~~~     ',
  --     '~.....=..~      ==++==+++~~~~~~~~~     ',
  --     '~....... ~      ~+=+++++~++~~~~~~~     ',
  --     '~.. .....~         ++++++~+~~~~~~~     ',
  --     '~........~          +=.++~+~+~~~.      ',
  --     ' ~~ . . .~          ~==+++~+~+~ ~      ',
  --     '  ~~~ .. ~            .++~+~~ ~        ',
  --     '     ~~  ~            ~ =~+ ~          ',
  --     '      ~~~~              ~ ~            ',
  --   }
}
