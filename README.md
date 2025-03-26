# Neovim config

## What is this project?
Kickstart's design philosophy is to give a very barebones starting point but have you ever felt like, having a system that is both barebones and jazzy?

This here is a very opinionated setup for kickstart, that adds prettier UI without sacrificing the lightweight nature of kickstart just clone, delete `.git` and you're good to go

## How to install:
This guide here assumes that you've got neovim installed, check your OS/distro instruction on how to install it.

> [!NOTE]  
> This repo is a testing ground and prone to changes.

### Installing as your basic config:

#### Prepare for installation: 
```bash
# Install neovim ( e.g.: arch )
sudo pacman -S neovim

# remove or backup your previous config
mv ~/.config/nvim ~/.config/nvim.bak

# remove cached stuff
rm -rf ~/.local/state/nvim/ && rm -rf ~/.local/share/nvim/
```
#### Clone the repo (linux distros) : 
```bash
git clone https://github.com/greed-d/nvim-minimal ~/.config/nvim && nvim
```

### Installing as secondary config:
Neovim provides a feature called `NVIM_APPNAME` which can help you run different instances of neovim with different configs. You can use it like

#### Clone the repo and launch using `NVIM_APPNAME`:
```bash
git clone https://github.com/greed-d/nvim-minimal ~/.config/nvimin
NVIM_APPNAME=nvimin nvim
```

## 🖼️ Screenshots

### Dashboard : 
![dashboard](./.screenshots/dashboard.png) 
### Blink :
![cmp](./.screenshots/cmp.png)

### File Explorer
![explorer](./.screenshots/explorer.png)

## 💡 Notable Plugins : 

[Barbecue](https://github.com/utilyre/barbecue.nvim) [ VSCode like winbar of neovim ]

[snacks.nvim](https://github.com/folke/snacks.nvim) [ Quality of Life plugins ] 

[Harpoon](https://github.com/Theprimeagen/harpoon) [ To jump between files in open workspaces ] 

[Lualine](https://github.com/nvim-lualine/lualine.nvim) [ For pretty lualine (Depends on [Lualine so Fancy](https://github.com/greed-d/lualine-so-fancy.nvim)) ] 

[NvTerm](https://github.com/NvChad/nvterm) [ For terminals ]

[Oil](https://github.com/stevearc/oil.nvim) [ To edit file tree like buffer ]

[Bufferline](https://github.com/akinsho/bufferline.nvim) [ To view open buffers ]

## All Plugins
```
blink.cmp 
conform.nvim 
fidget.nvim 
friendly-snippets 
gitsigns.nvim 
lazy.nvim 
lualine-so-fancy.nvim 
lualine.nvim 
mason-lspconfig.nvim 
mason-tool-installer.nvim 
mason.nvim 
mini.nvim 
nvim 
nvim-lspconfig 
nvim-material-icon 
nvim-treesitter 
plenary.nvim 
snacks.nvim 
telescope-fzf-native.nvim 
telescope-ui-select.nvim 
telescope.nvim 
todo-comments.nvim 
which-key.nvim 
barbecue 
bufferline.nvim 
harpoon 
indentmini.nvim 
lazydev.nvim 
neo-tree.nvim 
nui.nvim 
nvim-autopairs 
nvim-lint 
nvim-navic 
nvterm 
oil.nvim 
peek.nvim 
presence.nvim 
```
