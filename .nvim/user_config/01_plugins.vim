call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  " Dependency telescope
  Plug 'nvim-lua/plenary.nvim'

  " Fuzzy Search
  Plug 'nvim-telescope/telescope.nvim'
  nnoremap <leader>t <cmd>Telescope find_files<cr>
  nnoremap <leader>f <cmd>Telescope live_grep<cr>
  nnoremap <leader>b <cmd>Telescope buffers<cr>

  " Color themes
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Git blame
  Plug 'tpope/vim-fugitive'

  " Enable lua plugins
  Plug 'folke/lua-dev.nvim'

  " Tree Sitter
  Plug 'nvim-treesitter/nvim-treesitter'
  " Need manually add language
  " :TSInstall all
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'windwp/nvim-ts-autotag'

  " For icons
  Plug 'nvim-tree/nvim-web-devicons'

  " File explorer
  Plug 'nvim-tree/nvim-tree.lua'
  nnoremap <leader>g <cmd>NvimTreeToggle<cr>
  nnoremap <leader>G <cmd>NvimTreeFindFile<cr>

  " Autopair
  Plug 'windwp/nvim-autopairs'

  " Commenting
  Plug 'numToStr/Comment.nvim'

  " Notification for nvim
  Plug 'rcarriga/nvim-notify'

  " FZF
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  " Cool line (powerline, lualine, heirline)
  Plug 'nvim-lualine/lualine.nvim'

  " Auto Complete
  Plug 'ervandew/supertab'
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'hrsh7th/cmp-buffer'
  " Plug 'hrsh7th/cmp-path'
  " Plug 'hrsh7th/cmp-cmdline'
  " Plug 'hrsh7th/nvim-cmp'

" UndoTree
  Plug 'mbbill/undotree'
  map <Leader>h :UndotreeToggle<CR>
  if has("persistent_undo")
    set undodir=~/.undodir/
    " set undofile
  endif

  Plug 'rking/ag.vim'

  " EXPERIMENTAL
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  " https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
  Plug 'jose-elias-alvarez/null-ls.nvim'
  " Plug 'mfussenegger/nvim-lint'
  " Plug 'mhartington/formatter.nvim'
call plug#end()
