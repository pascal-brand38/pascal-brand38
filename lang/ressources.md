# Languages Resources

## Free Books

* On various languages: https://books.goalkicker.com/

## JS

### Publish on npm




https://www.freecodecamp.org/news/how-to-create-and-publish-your-first-npm-package/


ncu -u to update all packages in package.json
npm i --package-lock-only

* ```npm init``` to create the package
* package.json
  * binaries:
    * ```bin``` section for binary
    * .mjs starts with ```#!/usr/bin/env node```

npm install -g to have the binary global


## Publish a npm package
```bash
# update package.json and package-lock.json, commit and create a tag
npm version <patch | minor | major>
git push  && git push --tags
npm login
npm publish
```

## git

git push -d origin <branchname>             # Delete remote
git branch -d <branchname>                  # Delete local
git remote update origin --prune            # Delete remote branch from local gitk --all
git fetch origin pull/ID/head:BRANCH_NAME   # Fetch a pull-request



## Python

### How to Publish an Open-Source Python Package to PyPI

Main reference is https://packaging.python.org/en/latest/tutorials/packaging-projects/,
as well as
[API tokens](https://pypi.org/manage/account/token/)

* Installation
```
python3 -m pip install --upgrade setuptools wheel twine

python3 -m pip install --upgrade build twine
python3 -m build
```

* Upload: .pypirc must exist with a correct API token

```
Update version in pyproject.toml
git tag -a "x.y.z" -m "x.y.z"
git push --tags
rm -rf dist src/*.egg-info
python -m build
python -m twine upload dist/* --verbose --skip-existing
    id = __token__
    password: py-XXX  (the private API token)
```

In order to connect to pypi, a 2-factor authentication is required
using OTP. I am using FreeOTP Authentication from Redhat

### pypi.org statistics

https://pypistats.org/packages/spriteforhtml



## JS

### Update all local packages (https://medium.com/subjective-developer/update-all-node-packages-to-latest-aa128396b92b)
```
npm install -g npm-check-updates
ncu --upgrade
npm install
```
