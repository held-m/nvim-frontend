FROM node:14.21-alpine3.16

RUN apk update && apk upgrade
RUN apk add --no-cache neovim neovim-doc git wl-clipboard gcc g++ wget curl \
         bash gzip fzf fd ripgrep bat delta viu

arg HOME=/home/node

RUN mkdir /app
RUN chown -R node:node /app

COPY ./config/nvim ${HOME}/.config/nvim
RUN chown -R node:node ${HOME}/.config

RUN npm i -g vscode-langservers-extracted
RUN npm i -g cssmodules-language-server
RUN npm install -g typescript typescript-language-server

USER node
################### Install Plugins ######################

# Sand Thema
RUN git clone --depth=1 https://github.com/held-m/neovim-sand.git \
        ${HOME}/.local/share/nvim/site/pack/neovim-sand/start/neovim-sand
# Neosolarized Thema
RUN git clone --depth=1 https://github.com/svrana/neosolarized.nvim.git \
        ${HOME}/.local/share/nvim/site/pack/neosolarized.nvim/start/neosolarized.nvim

# LSP and autocompletion
RUN git clone --depth=1 https://github.com/neovim/nvim-lspconfig.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-lspconfig/start/nvim-lspconfig && \
    git clone --depth=1 https://github.com/hrsh7th/nvim-cmp.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-cmp/start/nvim-cmp && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-buffer.git \
        ${HOME}/.local/share/nvim/site/pack/cmp-buffer/start/cmp-buffer && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-path.git \
        ${HOME}/.local/share/nvim/site/pack/cmp-path/start/cmp-path && \
    git clone --depth=1 https://github.com/saadparwaiz1/cmp_luasnip.git \
        ${HOME}/.local/share/nvim/site/pack/cmp_luasnip/start/cmp_luasnip && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-nvim-lsp.git \
        ${HOME}/.local/share/nvim/site/pack/cmp-nvim-lsp/start/cmp-nvim-lsp && \
    git clone --depth=1 https://github.com/hrsh7th/cmp-nvim-lua.git \
        ${HOME}/.local/share/nvim/site/pack/cmp-nvim-lua/start/cmp-nvim-lua

# git clone --depth=1 https://github.com/VonHeikemen/lsp-zero.nvim.git \
    #     ${HOME}/.local/share/nvim/site/pack/lsp-zero.nvim/start/lsp-zero.nvim

# Snippets
RUN git clone --depth=1 https://github.com/L3MON4D3/LuaSnip.git \
        ${HOME}/.local/share/nvim/site/pack/LuaSnip/start/LuaSnip && \
    git clone --depth=1 https://github.com/rafamadriz/friendly-snippets.git \
        ${HOME}/.local/share/nvim/site/pack/friendly-snippets/start/friendly-snippets

# Hightlights
RUN git clone --depth=1 https://github.com/nvim-treesitter/nvim-treesitter.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-treesitter/start/nvim-treesitter

# Lui Gui
RUN git clone --depth=1 https://github.com/ray-x/guihua.lua.git \
        ${HOME}/.local/share/nvim/site/pack/guihua.lua/start/guihua.lua

# Comments
RUN git clone --depth=1 https://github.com/terrortylor/nvim-comment.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-comment/start/nvim-comment

# Notify
RUN git clone --depth=1 https://github.com/rcarriga/nvim-notify.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-notify/start/nvim-notify

# Status line
RUN git clone --depth=1 https://github.com/nvim-lualine/lualine.nvim.git \
        ${HOME}/.local/share/nvim/site/pack/lualine.nvim/start/lualine.nvim

# Tree files
RUN git clone --depth=1 https://github.com/nvim-tree/nvim-web-devicons.git \
    ${HOME}/.local/share/nvim/site/pack/nvim-web-devicons/start/nvim-web-devicons && \
    git clone --depth=1 https://github.com/nvim-tree/nvim-tree.lua.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-tree.lua/start/nvim-tree.lua

# FZF
RUN git clone --depth=1 https://github.com/ibhagwan/fzf-lua.git \
        ${HOME}/.local/share/nvim/site/pack/fzf-lua/start/fzf-lua

# Keymap
RUN git clone --depth=1 https://github.com/folke/which-key.nvim.git \
        ${HOME}/.local/share/nvim/site/pack/which-key.nvim/start/which-key.nvim

# Rainbow
RUN git clone --depth=1 https://github.com/p00f/nvim-ts-rainbow.git \
        ${HOME}/.local/share/nvim/site/pack/nvim-ts-rainbow/start/nvim-ts-rainbow
 
################## --------------- #######################

WORKDIR /app
