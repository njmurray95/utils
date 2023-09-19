# Python Config

In bashrc:
```
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python" # Store .pyc files here
export PYTHONUSERBASE="$XDG_DATA_HOME/python"       # User site-packages here
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/site.py" # Python start here
```

The file specified by $PYTHONSTARTUP will be run before any interactive session (allowing customizations, such as changing the location where `.python_history` is written to.)

