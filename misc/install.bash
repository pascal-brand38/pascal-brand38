#

package='astro-build-time-constants'
number=${1:-3605}    # $1, and if does not exit, is 30 (not -30)

# package='astro-webtools'

install() {
  export npm_config_cache=$(mktemp -d)
  i=$1
  command="npm install $package"

  echo
  echo ===============================================================
  echo install $i: $command
  $command
  rm -rf node_modules $npm_config_cache
}

dir=/tmp/tmp-install
rm -rf $dir
mkdir -p $dir
cd $dir

npm init -y
for i in $(seq 1 $number);
do
  install $i
done
cd ..
rm -rf tmp
