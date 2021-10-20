-- Basic settings
require("whichkey_setup").config{
    hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}

local wk = require('whichkey_setup')

local keymap = {
    --w = {':w!<CR>', 'save file'}, -- set a single command and text
    --j = 'split args', -- only set a text for an already configured keymap
    -- ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
	n = {':NvimTreeToggle<CR>', 'filetree'},
    [','] = {'<Cmd>Telescope buffers<CR>', 'buffers'},
	z = {
		name = '+folding',
		m = {'zM', 'fold-all'},
		r = {'zR', 'unfold-all'},
	},
	f = { -- set a nested structure
		name = '+find',
		c = {
				name = '+commands',
				c = {'<Cmd>Telescope commands<CR>', 'commands'},
				h = {'<Cmd>Telescope command_history<CR>', 'history'},
		},
		f = {'<Cmd>Telescope find_files<CR>', 'files'},
		g = {'<Cmd>Telescope live_grep<CR>', 'files'},
		h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
		q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
	},

	g = { -- TODO: Git stuff
		name = '+git',
		g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
		c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
		b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
		s = {'<Cmd>Telescope git_status<CR>', 'status'},
	},

	w = {
		name = '+window',
		j = {'<C-w>j', 'focus-w-down'},
		h = {'<C-w>h', 'focus-w-left'},
		k = {'<C-w>k', 'focus-w-up'},
		l = {'<C-w>l', 'focus-w-right'},
		J = {'<C-w>J', 'move-w-down'},
		H = {'<C-w>H', 'move-w-left'},
		K = {'<C-w>K', 'move-w-up'},
		L = {'<C-w>L', 'move-w-right'},
		o = {'<C-w>o', 'only-curr-w'},
		['='] = {'<C-w>=', 'equal-width'},
		['_'] = {'<C-w>=', 'max-w-height'},
		['|'] = {'<C-w>=', 'max-w-width'},
	},
}

wk.register_keymap('leader', keymap)
