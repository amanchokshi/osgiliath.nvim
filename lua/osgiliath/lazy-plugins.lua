-- NOTE: Configure and install plugins

require('lazy').setup {

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Color magic
  require 'osgiliath.plugins.colors',

  -- Git signs
  require 'osgiliath.plugins.gitsigns',

  -- Which key
  require 'osgiliath.plugins.which-key',

  -- Telescope (Fuzzy Finders etc)
  require 'osgiliath.plugins.telescope',

  -- LSP config
  require 'osgiliath.plugins.lspconfig',

  -- Autoformat
  require 'osgiliath.plugins.conform',

  -- Autocompletion
  require 'osgiliath.plugins.cmp',

  -- Highlight todo, notes, bugs
  require 'osgiliath.plugins.todo',

  -- Mini Modules
  require 'osgiliath.plugins.mini',

  -- The mysterious treesitter
  require 'osgiliath.plugins.treesitter',

  -- Autopairs
  require 'osgiliath.plugins.autopairs',

  -- File browsing
  require 'osgiliath.plugins.neo-tree',
  require 'osgiliath.plugins.oil',
  require 'osgiliath.plugins.gx',

  -- require 'osgiliath.plugins.debug',
  -- require 'osgiliath.plugins.lint',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
