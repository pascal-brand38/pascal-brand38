# MSYS2

Install MSYS2 (cf. https://www.msys2.org/) (each to be run til success without errors)

## .bashrc: paths,...
```
cd
cp .bashrc .bashrc.save
cat << EOF >> .bashrc
export MSYS="winsymlinks:nativestr  ork
PATH=\$PATH:"/c/Program Files/nodejs"               # nodejs must be installed
NODE_PATH="/c/Users/pasca/AppData/Roaming/npm"      # is APPDATA/npm
PATH=\$PATH:"\$NODE_PATH"
export SETUPTOOLS_USE_DISTUTILS=stdlib              # Pillow (python image) installation - cf. https://pillow.readthedocs.io/en/latest/installation.html
EOF
```

## .minttyrc: enable CTRL-C and CTRL-V
```
cd
cat << EOF >> .minttyrc
# enable CTRL-C and CTRL-V
CtrlShiftShortcuts=yes
CtrlExchangeShift=yes
EOF
```

## Executable installation
```
pacman -Syu
pacman -Sy
pacman -Su
pacman -S git
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gedit mingw-w64-x86_64-meld3
pacman -S mingw-w64-x86_64-python3 mingw-w64-x86_64-python3-pip mingw-w64-x86_64-python3-setuptools
pacman -S mingw-w64-x86_64-optipng    # optional executable of spriteforhtml python package

# used by Pillow python package - image manipulation
# pacman -S \
#   mingw-w64-x86_64-libjpeg-turbo \
#   mingw-w64-x86_64-zlib \
#   mingw-w64-x86_64-libtiff \
#   mingw-w64-x86_64-freetype \
#   mingw-w64-x86_64-lcms2 \
#   mingw-w64-x86_64-libwebp \
#   mingw-w64-x86_64-openjpeg2 \
#   mingw-w64-x86_64-libimagequant \
#   mingw-w64-x86_64-libraqm \
#   mingw-w64-x86_64-optipng
```

```
python -m pip install --upgrade build
```

# Git configs

Note that in the following, gitconfig_other must be updated with real name and email address.

```
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

[init]
	defaultBranch = main
EOF
```

```
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

```
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


## Web Design
```
curl -k -L  https://raw.githubusercontent.com/pascal-brand38/pyHelper/main/install.sh > /tmp/install.sh
source /tmp/install.sh
python -m pip install spriteforhtml
pacman -S mingw-w64-x86_64-optipng
mkdir -p dev/other
cd dev/other
git clone git@github.com:XXX/web-design
cd web-design
mkdir -p site/papadamcats/dev/tmp
npm install
```

