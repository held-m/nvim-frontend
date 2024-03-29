return require('packer').startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-----------------------CORE---------------------
	
	-- Let Paq manage itself
	use "savq/paq-nvim"
	
	-- Use braces when passing Options
	use {"lervag/vimtex", opt=true}
	
	-- notify
	use {'rcarriga/nvim-notify'}

	-----------------------LSP-----------------------
	
	-- Autocompletion
	use	{'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'saadparwaiz1/cmp_luasnip'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-nvim-lua'}

	-- Snippets
	use	{'L3MON4D3/LuaSnip'}
	use	{'rafamadriz/friendly-snippets'}

	-- Mason
	use { "williamboman/mason.nvim" }
	use {'williamboman/mason-lspconfig.nvim'}

	-- lsp config
	use {'neovim/nvim-lspconfig'}
	
	-- lsp zero
	use {'VonHeikemen/lsp-zero.nvim'}

	---------------------EDIT-----------------------
	
	-- auto pare braces
	use {'jiangmiao/auto-pairs'}
	
	-- Comments
	use {"terrortylor/nvim-comment"}

	---------------------FORMATER-------------------
	
	-- formater
	use { 'mhartington/formatter.nvim' }

    ------------------------NAVIGATE----------------

	use {'nvim-tree/nvim-tree.lua'};

	use {'ibhagwan/fzf-lua'};

	-- keymap
	use {'folke/which-key.nvim'};

	-----------------------VIEW----------------------
    
	-- Colorschema
	use {'held-m/neovim-sand'}

	-- Lua Gui
	use {'ray-x/guihua.lua'}

	-- status line
	use {'nvim-lualine/lualine.nvim'}

	-- optional, for file icons
	use {'nvim-tree/nvim-web-devicons'}

	-- show colors
	use {'ap/vim-css-color'}

	
end)
