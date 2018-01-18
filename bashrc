set -o vi

export VISUAL=vim
export EDITOR="$VISUAL"

function dcx {
    if [ $# -eq 2 ]; then
      cmd="su - $2"
    else
      cmd="bash"
    fi
    docker-compose exec $1 $cmd
}

function bench {
    begin=$(date +%s)
    eval $1
    end=$(date +%s)
    echo "Completed in $((end-begin)) seconds"
}

alias vi='vim'
alias repo='cd $(git rev-parse --show-toplevel)'

export PATH="/usr/local/lib/node/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:~/.local/bin"
