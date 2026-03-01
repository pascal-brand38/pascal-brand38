function pascal-git-fetch-pr() {
  git fetch origin pull/$1/head:pr$1
}
