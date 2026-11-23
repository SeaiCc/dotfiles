# dotfiles

Linux 环境下的个人配置。点文件放到 `~`，`.config/` 放到 `~/.config/`。

| 配置 | 路径 | 说明 |
| --- | --- | --- |
| zsh | [.zshrc](.zshrc) / [.zshenv](.zshenv) | 历史记录、自动补全、语法高亮、CUDA、nvm、starship、alias |
| tmux | [.tmux.conf](.tmux.conf) | TPM、catppuccin、vim-tmux-navigator、tmux-thumbs、自定义键位 |
| starship | [.config/starship.toml](.config/starship.toml) | 极简提示符（仅目录 + 符号） |
| kitty | [.config/kitty/](.config/kitty/) | 终端配置，主题在 [themes/](.config/kitty/themes/) |
| neovim | [.config/nvim/](.config/nvim/) | [init.lua](.config/nvim/init.lua)，模块位于 [lua/config/](.config/nvim/lua/config/) 与 [lua/plugins/](.config/nvim/lua/plugins/)，LSP 在 [lsp/](.config/nvim/lsp/) |
| dwm | [dwm/](dwm/) | dwm 源码及补丁，见 [patches/](dwm/patches/) |

dwm 已打的补丁：[alpha](dwm/patches/dwm-alpha-20250918-74edc27.diff)、[attachaside](dwm/patches/dwm-attachaside-6.6.diff)、[gaps](dwm/patches/dwm-gaps-6.0.diff)、[pertag](dwm/patches/dwm-pertag-6.2.diff)、[resizecorners](dwm/patches/dwm-resizecorners-6.5.diff)、[restartsig](dwm/patches/dwm-restartsig-20180523-6.2.diff)、[tagshift](dwm/patches/dwm-tagshift-6.3.diff)，配置见 [config.h](dwm/config.h)。
