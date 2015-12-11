export GREP_OPTIONS='--color=always'

alias vi='vim'

## git
gb() {
    git blame -L $1,+$2 $3
}
alias gdiff='git diff'
alias glog='git log'
alias gpull='git checkout master && git fetch -p && git merge origin/master'
alias gadd='git add -A && git status'
alias gcommit='git commit -m'
alias gstatus='git status'
alias gpush='git push origin'

## misc
alias jab='php jab.php'
