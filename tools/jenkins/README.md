# Jenkins

> Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software.

> -- Jenkins Documentation: https://jenkins.io/doc/

Jenkins can run automatic scheduled tests for its configured projects. Naturally, this configuration can be very hairy, but is powerful once it's done right.

Jenkins operates as a server accessible through the web browser. By default Jenkins operates through Port 8080. Generally each project is configured separately and can be configured in one of two ways: via browser interface or via `Jenkinsfile` config.

## Installation

Jenkins Download page: https://jenkins.io/download/ (Generally want the Long-Term Support release)

For a quick-start, run:

```
$ java -jar jenkins.war --httpPort=8080
```
Then browse to `http://localhost:8080`.

Long-term Jenkins should exist on its own server.

## Files

Jenkins Server files:

* `~/.jenkins` or `$JENKINS_HOME`: Directory for archives of builds and other metadata

Project files:

* `Jenkinsfile`: The default location for the Jenkins project config (though this file can be named anything as long as Jenkins correctly points to it). 

## CLI

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
