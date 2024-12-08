set -o vi

export VISUAL=hx
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

function rsed {
    find $1 -type f -print0 | xargs -0 sed -i $2
}

alias repo='cd $(git rev-parse --show-toplevel)'

export PATH="/usr/local/lib/node/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:~/.local/bin"
