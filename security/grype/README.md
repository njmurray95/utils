# Grype

Another security scanner.

Invoke grype on a docker image:
```
grype <DOCKER-IMAGE>
```

Write to an html file:
```
grype <DOCKER-IMAGE> -o template -t </path/to/go/template/> > <output.html>
```
