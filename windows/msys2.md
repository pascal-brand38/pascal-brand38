# MSYS2

Install MSYS2 (cf. https://www.msys2.org/) (each to be run til success without errors)

Install node.js

## .bashrc: paths,...
```bash
cd
cp .bashrc .bashrc.save
cat << EOF >> .bashrc
export MSYS="winsymlinks:nativestr  ork
PATH=\$PATH:"/c/Program Files/nodejs"               # nodejs must be installed
NODE_PATH=`cygpath -u "$APPDATA/npm"`               # "/c/Users/<MYNAME>/AppData/Roaming/npm"
PATH=$PATH:"/c/php"                                 # used for apache serverPATH=\$PATH:"\$NODE_PATH"
export SETUPTOOLS_USE_DISTUTILS=stdlib              # Pillow (python image) installation - cf. https://pillow.readthedocs.io/en/latest/installation.html
EOF
```

## .minttyrc: enable CTRL-C and CTRL-V
```bash
cd
cat << EOF >> .minttyrc
# enable CTRL-C and CTRL-V
CtrlShiftShortcuts=yes
CtrlExchangeShift=yes
EOF
```

## Main executable installation
```bash
pacman -Syu
pacman -Sy
pacman -Su
pacman -S git
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gedit mingw-w64-x86_64-meld3
pacman -S mingw-w64-x86_64-python mingw-w64-x86_64-python-pip mingw-w64-x86_64-python-setuptools
pacman -S mingw-w64-x86_64-rust   # rust compiler to be able install twine with python to publish pipy project
pacman -S mingw-w64-x86_64-cmake mingw-w64-x86_64-gcc-fortran mingw-w64-x86_64-openblas      # used to install pyHelper
pacman -S mingw-w64-x86_64-optipng    # optional executable of spriteforhtml python package
pacman -S mingw-w64-x86_64-mupdf-mupdf-tools   # pdf repair
pacman -S mingw-w64-x86_64-github-cli  # gh command
pacman -S mingw-w64-x86_64-python-gsutil # firebase
pacman -S rsync zip unzip
pacman -S mingw-w64-x86_64-hugo
pacman -S subversion
```

## Python packages

Check for Pilow installation on msys2
(cf. https://pillow.readthedocs.io/en/latest/installation/basic-installation.html#basic-installation
and https://pillow.readthedocs.io/en/latest/installation/building-from-source.html#building-from-source)

```bash
pacman -S mingw-w64-x86_64-ffmpeg mingw-w64-x86_64-optipng
pacman -S \
    mingw-w64-x86_64-libjpeg-turbo \
    mingw-w64-x86_64-zlib \
    mingw-w64-x86_64-libtiff \
    mingw-w64-x86_64-freetype \
    mingw-w64-x86_64-lcms2 \
    mingw-w64-x86_64-libwebp \
    mingw-w64-x86_64-openjpeg2 \
    mingw-w64-x86_64-libimagequant \
    mingw-w64-x86_64-libraqm
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade Pillow --no-binary :all:
CFLAGS="-Wno-incompatible-pointer-types" python3 -m pip install --upgrade Pillow
python -m pip install responsiveimage
python -m pip install py-spriteforhtml

python -m pip install --upgrade build
python -m pip install pylint pytest
```

## JS packages

```bash
npm install --global gulp-cli
npm install --global vite
npm install --global npm-check-updates
npm update -g
```


# Git configs

Note that in the following, gitconfig_other must be updated with real name and email address.

```bash
cd
cat << EOF >> .gitconfig
[core]
    editor = gedit

[diff]
    tool = meld

[difftool]
    prompt = false

[merge]
    tool = meld

[mergetool]
    prompt = false

[includeIf "gitdir:**"]
    path = .gitconfig_other

[includeIf "gitdir:**/pascal-brand38/**"]
    path = ~/.gitconfig_pascal-brand38

[includeIf "gitdir:/c/wamp64/www/**"]
    path = ~/.gitconfig_pascal-brand38

[init]
	defaultBranch = main
EOF
```

```bash
cd
mkdir -p dev/pascal-brand38
cat << EOF >> .gitconfig_pascal-brand38
[user]
    name = Pascal Brand
    email = pascal.brand38@gmail.com

[core]
    sshCommand = "ssh -i ~/.ssh/id_rsa_pascal-brand38"
EOF
```

```bash
cd
mkdir -p dev/other
cat << EOF >> .gitconfig_other
[user]
    name = SETNAME
    email = SETNAME@gmail.com

[core]
    sshCommand = "ssh -i ~/.ssh/id_rsa_other"
EOF
```

# Ssh keys

Create ssh keys with ```ssh-keygen.exe```, and using name ```/home/pasca/.ssh/id_rsa_pascal-brand38``` and ```/home/pasca/.ssh/id_rsa_other```

Then upload the .pub keys on github.com


# Git sources
```bash
cd ${HOME}/dev/pascal-brand38
for repo in docs jsHelper pyHelper webtools
do
  echo ================= install ${repo}.git
  git clone git@github.com:pascal-brand38/${repo}
done
for repo in jsHelper webtools
do
  echo ================= npm install ${repo}.git
  cd ${HOME}/dev/pascal-brand38/${repo}
  npm install
done

cd ${HOME}/dev/other
git clone git@github.com:OTHER/REPO
cd REPO
npm install
```


```
https://api.github.com/users/pascal-brand38/repos
```


# Cleaning

```
python -m pip cache purge
npm cache clean --force
```
