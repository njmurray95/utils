# Docker

> an open-source project that automates the deployment of software applications inside containers by providing an additional layer of abstraction and automation of OS-level virtualization on Linux.
> 
> -- Wikipedia

(Automated virtual machines for specific applications and projects -- containers run at a lower level than VMs so come strictly-defined with lower startup costs.)

https://docker-curriculum.com/

## Files and binaries

* `docker`: Main client for running commands, modifying containers, etc.
* `dockerd`: Daemon that runs containers in the background, executes commands from `docker` client.

## Misc.

Check that the `docker` (including the `dockerd` daemon) are installed correctly:
```
docker run hello-world
```

