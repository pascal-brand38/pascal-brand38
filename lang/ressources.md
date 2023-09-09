# Languages Resources

## Free Books

* On various languages: https://books.goalkicker.com/


## Python

### How to Publish an Open-Source Python Package to PyPI

Main reference is https://packaging.python.org/en/latest/tutorials/packaging-projects/,
as well as
[API tokens](https://pypi.org/manage/account/token/)

* Installation
```
python3 -m pip install --upgrade build twine
python3 -m build
```

* Upload: .pypirc must exist with a correct API token

```
Update version in pyproject.toml
git tag -a "x.y.z"
git push --tags
rm -rf dist src/*.egg-info
python -m build
python -m twine upload dist/* --verbose --skip-existing
    id = __token__
    password: py-XXX  (the private API token)
```

In order to connect to pypi, a 2-factor authentication is required
using OTP. I am using FreeOTP Authentication from Redhat