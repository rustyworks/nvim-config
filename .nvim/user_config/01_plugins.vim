call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  " Dependency telescope
  Plug 'nvim-lua/plenary.nvim'

  " Fuzzy Search
  Plug 'nvim-telescope/telescope.nvim'
  nnoremap <leader>t <cmd>Telescope find_files<cr>
  nnoremap <leader>f <cmd>Telescope live_grep<cr>
  nnoremap <leader>b <cmd>Telescope buffers<cr>

  " FZF
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  " Project
  Plug 'nvim-telescope/telescope-project.nvim'

  " Color themes
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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

  " Tabline
  Plug  'nanozuki/tabby.nvim'

  " Landing Dashboard
  Plug 'goolord/alpha-nvim'

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

  " Cool line (powerline, lualine, heirline)
  Plug 'nvim-lualine/lualine.nvim'

  " Auto Complete
  Plug 'ervandew/supertab'

  " UndoTree
  Plug 'mbbill/undotree'
  map <Leader>h :UndotreeToggle<CR>
  if has("persistent_undo")
    set undodir=~/.undodir/
    " set undofile
  endif

  " Silver Searcher
  Plug 'rking/ag.vim'

  " Multicursor
  Plug 'mg979/vim-visual-multi'

  " Python indentation
  Plug 'Vimjas/vim-python-pep8-indent'

  " Rust
  " Need to install rust-analyzer using `rustup component add rust-analyzer`
  Plug 'simrat39/rust-tools.nvim'

  " Markdown
  " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " EXPERIMENTAL
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'  " To start using :LspStart
  " https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
  Plug 'jose-elias-alvarez/null-ls.nvim'
call plug#end()
