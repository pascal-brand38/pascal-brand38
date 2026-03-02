function pascal-git-fetch-pr() {
  git fetch origin pull/$1/head:pr$1
}

alias help='~/dev/pascal-brand38/pascal-brand38/help/help.bash'
