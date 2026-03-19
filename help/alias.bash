function pascal-git-fetch-pr() {
  git fetch origin pull/$1/head:pr$1
}

alias help='~/dev/pascal-brand38/pascal-brand38/help/help.bash'

function pascal-git-clone() {
  REPO=$1
  OWNER=$2
  if [ -z "$OWNER" ]; then
    OWNER="pascal-brand38"
  fi
  git clone git@github.com:$OWNER/$REPO.git
  cd $REPO
}

function pascal-npminstall-local-packages() {
  REPO=$1
  if [ -z "$REPO" ]; then
    REPO="swiper"
  fi
  echo "Packing and installing local packages astro-$REPO..."
  cd ~/dev/pascal-brand38/astro/astro-$REPO
  npm pack --pack-destination /tmp
  cd -
  npm install /tmp/astro-$REPO-*.tgz
  rm /tmp/astro-$REPO-*.tgz
}
