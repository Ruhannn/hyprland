export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

# update mode reminder
zstyle ':omz:update' mode reminder

# my plugins
plugins=(aliases copyfile copypath dirhistory fancy-ctrl-z sudo zoxide zsh-interactive-cd zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh
# my custom fn
vite() {
  bun create vite "$1" --template react-ts && cd "$1" && twin && bun run dev
}
next() {
  bun create next-app "$@" --typescript --eslint --app --turbopack --use-bun --yes && cd "$1" && twinx && bun run dev
}

ct() {
  cloudflared tunnel --url http://localhost:$1
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
alias ls='lsd --hyperlink=auto'
alias icns='mkdir -p ./output_folder && icns2png -x -o ./output_folder "$@"'
alias ytm='yt-dlp -f "bestaudio" -x --audio-format mp3 --audio-quality 0 -o "/home/ruhan/Videos/Youtube/audio/%(title).200s.%(ext)s" "$@"'
alias ytv='yt-dlp -f "bv*+ba/best" --merge-output-format mp4 -o "/home/ruhan/Videos/Youtube/video/%(title).200s.%(ext)s" "$@"'
alias zshrc='${=EDITOR} ~/.zshrc'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias cpf='copyfile'
alias cpp='copypath'
alias yuml='yum list --installed'                                                       # l
alias yumauto='sudo yum autoremove && sudo yum clean all'                               # auto
alias u='sudo yum update --disablerepo=amdgpu && sudo yum upgrade --disablerepo=amdgpu' # u
alias i='sudo yum install --disablerepo=amdgpu'                                         # i
alias r='sudo yum remove'                                                               # r
alias s='yum search  --disablerepo=amdgpu'                                              # s
alias discord-update='sudo /home/ruhan/Downloads/Programs/EquilotlCli-linux'
alias h='history'
alias hs='history | grep'
# alias fetch='fastfetch --kitty-icat /home/ruhan/Downloads/aaa/tenor2.gif --cpu-temp --gpu-temp'
alias fetch='fastfetch --kitty-icat /mnt/Ruhan/tenor.gif --cpu-temp --gpu-temp'
alias cngwal='swww img --transition-type grow --transition-pos top-right --transition-step 90 --transition-fps 160'
alias gc='git clone'
alias mine='cd /home/ruhan/Documents/mc && ./start.sh'
alias mine-local='cd /home/ruhan/Documents/mc && java -Xmx1024M -Xms1024M -jar server.jar nogui'
alias snode='sudo $(where node)'

# exports
# ! nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# ! bun
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
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
. "/home/ruhan/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
# if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
#   exec Hyprland
# fi
