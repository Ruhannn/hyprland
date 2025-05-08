export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"



# update mode reminder
zstyle ':omz:update' mode reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# my plugins
plugins=(aliases copyfile copypath dirhistory fancy-ctrl-z sudo zoxide zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search zsh-completions)

source $ZSH/oh-my-zsh.sh
# my custom fn
vite() {
  bun create vite "$1" --template react-ts && cd "$1" && twin && bun run dev
}
next(){
  bun create next-app "$@" --typescript --eslint --app --turbopack --use-bun --yes && cd "$1" && twinx && bun run dev
}

function node-docs {
  local section=${1:-all}
  open_command "https://nodejs.org/docs/$(node --version)/api/$section.html"
}

make_searcher() {
  name="$1"
  base_url="$2"
  eval "
    $name() {
      query=\$(printf '%s+' \"\$@\" | sed 's/+$/\n/')
      (xdg-open \"$base_url\$query\" >/dev/null 2>&1 &)
    }
  "
}


make_searcher google "https://www.google.com/search?q="
make_searcher github "https://github.com/search?q="
make_searcher yt "https://www.youtube.com/results?search_query="
make_searcher gpt "https://chatgpt.com/?q="


# my custom alias
alias twin='bun install tailwindcss @tailwindcss/vite && cp /home/ruhan/Documents/template/viteconfig.ts vite.config.ts && echo "@import \"tailwindcss\";" > src/index.css && rm src/App.css && cp /home/ruhan/Documents/template/aya.tsx src/App.tsx'
alias twinx='bun install tailwindcss @tailwindcss/postcss postcss && cp /home/ruhan/Documents/template/postcss.config.mjs ./postcss.config.mjs && echo "@import \"tailwindcss\";" > app/globals.css && rm app/page.module.css && cp /home/ruhan/Documents/template/aya.tsx app/page.tsx'
alias ls='lsd'
alias icns='mkdir -p ./output_folder && icns2png -x -o ./output_folder "$@"'
alias ytm='yt-dlp -x --audio-format mp3 -o "/home/ruhan/Downloads/Youtube/audio/%(title)s.%(ext)s" "$@"'
alias ytv='yt-dlp -f bestvideo+bestaudio/best -o "/home/ruhan/Downloads/Youtube/video/%(title)s.%(ext)s" "$@"'
alias zshrc='${=EDITOR} ~/.zshrc'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias cpf='copyfile'
alias cpp='copypath'
alias yuml='yum list --installed' # l
alias yumu='sudo yum upgrade' # u
alias yumauto='sudo yum autoremove && sudo yum clean all' # auto
alias yumi='sudo yum install' # i
alias yumr='sudo yum remove' # r
alias yums='yum search' # s
alias discord-update='sudo /home/ruhan/Downloads/Programs/EquilotlCli-linux'
alias h='history'
alias hs='history | grep'
alias fetch='fastfetch --kitty-icat /mnt/D89C34B29C348D4E/tenor.gif  --cpu-temp --gpu-temp'
# exports
# ! nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ! bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/ruhan/.bun/_bun" ] && source "/home/ruhan/.bun/_bun"
# ! spicetify
export PATH=$PATH:/home/ruhan/.spicetify
# ! teldrive
export PATH=$PATH:/home/ruhan/Documents/Teldrive
# ! editor
export EDITOR="code" # code

#  ! theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cedaeb,fg+:#4a93f9,bg:#36283d,bg+:#cedaeb
  --color=hl:#a7c1e7,hl+:#4a93f9,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#71ADE9,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt=">"
  --marker="" --pointer="" --separator="" --scrollbar="│"'
# eval
export BAT_THEME="base16"
eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias ew)