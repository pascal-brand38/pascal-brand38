# Languages Resources

## Free Books

* On various languages: https://books.goalkicker.com/


## Python

### How to Publish an Open-Source Python Package to PyPI

Main reference is https://packaging.python.org/en/latest/tutorials/packaging-projects/

* Installation
```
python3 -m pip install --upgrade build twine
python3 -m build
```

* Upload
```
python -m build
python -m twine upload dist/*
```
