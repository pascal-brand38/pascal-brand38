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

function pascal-npminstall-local-packages() {
  REPO=$1
  if [ -z "$REPO" ]; then
    REPO="astro-swiper"
  fi
  echo "Packing and installing local packages $REPO..."
  cd ~/dev/pascal-brand38/astro/$REPO
  npm pack --pack-destination /tmp
  cd -
  npm install /tmp/$REPO-*.tgz
  rm /tmp/$REPO-*.tgz
}
export -f pascal-npminstall-local-packages

source ~/dev/pascal-brand38/pascal-brand38/help/alias/alias-magick.bash
