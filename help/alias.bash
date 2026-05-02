alias help='~/dev/pascal-brand38/pascal-brand38/help/help.bash'

function pascal-git-fetch-pr() {
  git fetch origin pull/$1/head:pr$1
}
export -f pascal-git-fetch-pr

function pascal-git-clone() {
  REPO=$1
  OWNER=$2
  if [ -z "$OWNER" ]; then
    OWNER="pascal-brand38"
  fi
  git clone git@github.com:$OWNER/$REPO.git
  cd $REPO
}
export -f pascal-git-clone

function pascal-cache-clean() {
  npm cache clean --force
  pnpm store prune
  yarn cache clean
}

source ~/dev/pascal-brand38/pascal-brand38/help/alias/alias-magick.bash
source ~/dev/pascal-brand38/pascal-brand38/help/alias/alias-npm.bash
