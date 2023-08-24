# Python

Python 3 should come installed on all new systems. Check for `which python` or `which python3` to check which name it lives under.

The biggest issue is legacy systems with Python2 vs Python3... If this is an issue add a few aliases to bash:

`bashrc:`
```
alias python2='/path/to/python2'
alias python3='/path/to/python3'
alias python='/path/to/python3'
```

#### pip

To install a package:
```
python -m pip install <module>
```

For some reason, python's package manager `pip` does not always come installed. Documentation on how to install is found here:

https://pip.pypa.io/en/stable/installation/

Usually, however, it's proven more reliable to download `get-pip.py` and run manually instead of relying on the `ensurepip` module being present:
```
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```

Or for python 2:
```
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
```

#### Anaconda (Managing Versions)

If you have installed `anaconda` you can switch between different python environments like this:

```
conda create -n py3 python=3
```

To activate it as the main python:

```
source activate mypython3
```

To deactivate:

```
source deactivate
```

#### Profiling

Python should come with `profile` and `cProfile` by default:

```
python -m cProfile ./path/to/script
```
