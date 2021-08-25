"------------------------------------------------------------------------
"        __                __ __         ___ ___ __
" .----.|  |--.---.-.----.|  |__|.-----.|   |   |__|.--------.
" |  __||     |  _  |   _||  |  ||  -__||   |   |  ||        |
" |____||__|__|___._|__|  |__|__||_____| \_____/|__||__|__|__|
"
" My vimrc
"-----------------------------------------------------------------------

" General settings "{{{
" --------------------------------------------------------------------------------
	source $HOME/.config/nvim/general-config/config.vim
	source $HOME/.config/nvim/general-config/mappings.vim

"}}}

" Plugin Manager "{{{
" --------------------------------------------------------------------------------
source $HOME/.config/nvim/vim-plug/plugins.vim

" }}}

" Plugin settings "{{{
" --------------------------------------------------------------------------------
"source $HOME/.config/nvim/plugin-config/vim-which-key-mappings.vim
source $HOME/.config/nvim/plugin-config/lsp-keymaps.vim
source $HOME/.config/nvim/plugin-config/treesitter-code-folding.vim

"source $HOME/.config/nvim/plug-config/fzf.vim
"source $HOME/.config/nvim/plug-config/vim-commentary.vim
"source $HOME/.config/nvim/plug-config/coc/coc.vim
"source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim

"}}}

" Lua Plugins "{{{
" --------------------------------------------------------------------------------
lua << EOF
require("lsp")
require("treesitter")
require("completion")
require("which-key")
require("plug-colorizer")
EOF

"luafile $HOME/.config/nvim/lua/plug-colorizer.lua
"lua require'colorizer'.setup()

"}}}

" Colorscheme "{{{
" --------------------------------------------------------------------------------
colo onedark
"source $HOME/.config/nvim/themes/tweelight-dark.vim
"source $HOME/.config/nvim/plug-config/vimwiki.vim
"source $HOME/.config/nvim/themes/nord.vim
"source $HOME/.config/nvim/themes/onedark.vim
"source $HOME/.config/nvim/themes/solarized.vim
"source $HOME/.config/nvim/themes/airline.vim
"source $HOME/.config/nvim/themes/lightline.vim

"}}}
