# 终端类型
export TERM=xterm-kitty

# 设置历史记录文件的路径
HISTFILE=~/.zsh_history

# 设置在会话（内存）中和历史文件中保存的条数，建议设置得大一些
HISTSIZE=1000
SAVEHIST=1000

# 忽略重复的命令，连续输入多次的相同命令只记一次
setopt HIST_IGNORE_DUPS

# 忽略以空格开头的命令（用于临时执行一些你不想保存的敏感命令）
setopt HIST_IGNORE_SPACE

# 在多个终端之间实时共享历史记录
# 这是实现多终端同步最关键的选项
setopt SHARE_HISTORY

# 让新的历史记录追加到文件，而不是覆盖
setopt APPEND_HISTORY
# 在历史记录中记录命令的执行开始时间和持续时间
setopt EXTENDED_HISTORY

# 自动补全
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# 语法检查
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 开启 tab 上下左右选择补全
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit

# 目录/文件颜色
# eval "$(dircolors)"
export LS_COLORS="di=1;36:$LS_COLORS"

# CUDA
export PATH="/opt/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/opt/cuda/lib64:$LD_LIBRARY_PATH"

# nvm
source /usr/share/nvm/init-nvm.sh

# alias
alias ls='ls --color=auto'
alias cc='export USE_BUILTIN_RIPGREP=false && node /home/cuitao/gitSourceCode/AGENT/cc/dist/cli.js'

# starship
eval "$(starship init zsh)"
bindkey -e
