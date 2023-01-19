FROM node:19.1.0-alpine3.16

RUN apk update && apk upgrade
RUN apk add --no-cache neovim neovim-doc git wl-clipboard gcc g++ wget curl \
         bash gzip fzf fd ripgrep bat delta viu

ARG HOME=/home/node
ARG WORKDIR=/app

ENV USR=node
ENV GRP=node


RUN mkdir ${WORKDIR}
RUN chown -R ${USR}:${GRP} ${WORKDIR}

COPY ./config/nvim ${HOME}/.config/nvim
RUN chown -R ${USR}:${GRP} ${HOME}/.config

COPY ./.local ${HOME}/.local
RUN chown -R ${USR}:${GRP} ${HOME}/.local

RUN npm i -g neovim
RUN npm i -g typescript
RUN npm i -g eslint_d
RUN chown -R ${USR}:${GRP} ${HOME}/.npm

USER node

WORKDIR /app
