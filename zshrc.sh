export NODE_OPTIONS='--trace-deprecation'

alias meld="open -W -a Meld $@"

export EDITOR="vim"
alias python="python3"
alias pip="pip3"

source ~/scripts/aliases/aliases-git.sh
source ~/scripts/aliases/aliases-utils.sh
source ~/scripts/aliases/aliases-react-native.sh
source ~/scripts/aliases/aliases-personal.sh
source ~/scripts/aliases/aliases-code.sh
source ~/scripts/aliases/aliases-strings.sh
source ~/scripts/aliases/aliases-android.sh
source ~/scripts/aliases/aliases-folders.sh
source ~/scripts/aliases/aliases-ai.sh

alias meld="open -W -a Meld $@"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# SQLITE settings for M1
export PYTHON=/opt/homebrew/bin/python3
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# NVM settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# VS CODE
alias code="open -a \"Visual Studio Code\""
alias cursor="open -a \"Cursor\""
# / VS CODE

# pnpm
export PNPM_HOME="/Users/emersondemetrio/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export AWS_PAGER=""
