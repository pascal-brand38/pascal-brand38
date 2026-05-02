function pascal-npm--local-packages() {
  PASCALREPO=$1
  if [ -z "$PASCALREPO" ]; then
    PASCALREPO="astro-swiper"
  fi
  echo "Packing and installing local packages $PASCALREPO..."
  cd ~/dev/pascal-brand38/astro/$PASCALREPO
  npm pack --pack-destination /tmp
  cd -
}
export -f pascal-npm--local-packages

function pascal-npminstall-local-packages() {
  pascal-npm--local-packages $1
  npm install /tmp/$PASCALREPO-*.tgz
  # rm /tmp/$PASCALREPO-*.tgz
}
export -f pascal-npminstall-local-packages

function pascal-pnpminstall-local-packages() {
  pascal-npm--local-packages $1
  pnpm install --prefer-offline=false /tmp/$PASCALREPO-*.tgz
  # rm /tmp/$PASCALREPO-*.tgz
}
export -f pascal-pnpminstall-local-packages
