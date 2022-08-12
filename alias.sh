# useful
# plugins=(git
#     yarn-autocompletions
# )
# source $ZSH/oh-my-zsh.sh

# Required software
# * brew ------------------- https://brew.sh/
# * zsh/ohmyzsg(optional) -- brew install zsh / https://ohmyz.sh/
# * jq --------------------- https://formulae.brew.sh/formula/jq
# * ffmpeg ----------------- https://formulae.brew.sh/formula/ffmpeg#default
# * chrome ----------------- https://www.google.com/chrome/
# * git -------------------- https://git-scm.com/download/mac
# * node ------------------- https://nodejs.org/en/download/
# * nvm -------------------- https://github.com/nvm-sh/nvm
# * yarn ------------------- https://classic.yarnpkg.com/lang/en/docs/install/
# end Required software

unset LESS
PATH=$PATH:/home/username/.yarn/bin

export EDITOR=vim

# utils
alias chrome='open -a "Google Chrome"'
alias cat_scripts='cat package.json | jq ".scripts"'
alias realpath='~/bash-scripts/realpath.sh'

# git clone git@github.com:emersondemetrio/new-react-component.git
alias nrc='~/bash-scripts/new-react-component/nrc.py'
alias reset_modules='~/bash-scripts/reset-modules.sh'
alias reset_packages='~/bash-scripts/reset-modules.sh'
alias test_diff='clear; ./node_modules/.bin/jest -- $(git diff --name-only -- "*.test.tsx" "*.test.config.tsx")'
alias update_source='source ~/.<bash profile>'
alias update_src="update_source"
alias video-to-gif='~/bash-scripts/video-to-gif.sh'
alias vs='code .'
# end utils

## web apps
alias gmail="chrome https://mail.google.com/mail/u/0/?pli=1#inbox"
alias whatsapp="chrome https://web.whatsapp.com"
alias telegram="chrome https://web.telegram.org/k/"
## web apps

# git
alias gst='clear; echo ''; git status;'
alias gsd='gst;'
alias gcb='git checkout -b'
alias go-master='clear; git checkout master; git pull; git status; yarn;'
alias gomaster='go-master'
alias gomas='go-master'
alias rebase_master='git rebase -i origin/master'
alias reset_origin='~/bash-scripts/reset-origin.sh'
alias diff-name-only="git diff $1 --name-only"
alias new_branch="~/bash-scripts/new_branch.sh"
alias new-branch="new_branch"
alias add_all="~/bash-scripts/add-all-and-commit.sh"
alias push-origin="~/bash-scripts/push-origin.sh"
alias gclone="git clone $1"
# end git

# folders
alias cdp='cd ${HOME}/projects; clas;'
alias cpd='cdp'
alias cdd='cd ${HOME}/Downloads; clas;'
alias cds='cd ${HOME}/Desktop/'
alias cdss='cd ${HOME}/scripts/'
alias cdds='cdss'
alias cdu='cd $HOME}; clas;'
alias las='ls -las'
alias lasc='clear; ls -las'
alias clas='clear; printf "\nFiles in: `pwd`\n\n"; ls -las'
alias cbd='cdb'
alias cd..='cd ..'
alias cdscr='cd ~/scripts; pwd; code .'
# end folders

# react-native
alias log-android="npx react-native log-android"
alias android-log="log-android"
# end react-native
