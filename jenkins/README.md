# Jenkins

Most folders above are structured as single-entry dirs for a Jenkinsfile showing a particular test-case. Although the convention of naming each "Jenkinsfile" is arbitrary, this is the convention Jenkins defaults to and is easier than creating my own.

# CLI Notes

The CLI is distributed as jenkins-cli.jar, which comes with a full Jenkins installation. It can generally be found two ways. First, it can be locally downloaded from `<server>/jnlpJars/jenkins-cli.jar' (where `<server>` defaults to `http://localhost:8080`). Second, it can be copied/moved manually from the WEB-INF where Jenkins is storing its jarfiles. (On RHEL this was `/var/cache/jenkins/waf/WEB-INF/`, but may vary with OS.)

Authenticate:
```
$ java -jar jenkins-cli.jar -s <server> -auth username:password who-am-i
```

Alternately:
```
$ echo "username:password" > /path/to/credentials
$ java -jar jenkins-cli.jar -s <server> -auth @/path/to/credentials who-am-i
```
