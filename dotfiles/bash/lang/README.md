# The Bash Language

---

Debug a script line-by-line.

Add these lines to a script:
```
set -x
trap read debug
```

Then invoke the script, hitting <enter> for every single line.

---
