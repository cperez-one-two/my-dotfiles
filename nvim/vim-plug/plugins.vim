call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neovim/nvim-lspconfig'																" Neovim's native LSP
Plug 'kabouzeid/nvim-lspinstall'														" Handles LSP installations and hooks
Plug 'glepnir/lspsaga.nvim'																	" Handle codeactions, definitions, etc.
Plug 'hrsh7th/nvim-compe'																		" Autocompletion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}	" Syntax Highlighting engine
Plug 'nvim-treesitter/nvim-treesitter-textobjects'					" Syntax Highlighting engine
Plug 'nvim-telescope/telescope.nvim'												" Telescope
Plug 'nvim-lua/plenary.nvim'																" Prerequisites for telescope
Plug 'nvim-lua/popup.nvim'																	" Prerequisites for telescope
Plug 'norcalli/nvim-colorizer.lua'													" Color previews on RBG values
Plug 'liuchengxu/vim-which-key'															" Whichkey - Port of emacs-which-key
Plug 'AckslD/nvim-whichkey-setup.lua'												" Lua wrapper for Whichkey
Plug 'kyazdani42/nvim-web-devicons'													" for file icons
Plug 'kyazdani42/nvim-tree.lua'															" Filetree

" Commenting
" Better Syntax Support
"Plug 'sheerun/vim-polyglot'
" File Explorer - DEPRECATED: use coc-explorer
"Plug 'scrooloose/NERDTree'
"Plug 'jiangmiao/auto-pairs'							" Auto pairs for '(' '[' '{'
" Vimwiki
"Plug 'vimwiki/vimwiki'
"Plug 'itchyny/lightline.vim'						" Lightline
" CoC Intellisense
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
"Plug 'honza/vim-snippets'
" fzf
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" vim-rooter
"Plug 'airblade/vim-rooter'

" Status and tab bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Themes
"Plug 'joshdick/onedark.vim'
"Plug 'overcache/NeoSolarized'
"Plug 'arcticicestudio/nord-vim'
"Plug 'morhetz/gruvbox'
"Plug 'vim-scripts/twilight256.vim'
"Plug 'tpope/vim-commentary'

call plug#end()
