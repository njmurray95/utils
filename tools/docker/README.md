# Docker

> an open-source project that automates the deployment of software applications inside containers by providing an additional layer of abstraction and automation of OS-level virtualization on Linux.
> 
> -- Wikipedia

(Automated virtual machines for specific applications and projects -- containers run at a lower level than VMs so come strictly-defined with lower startup costs.)

https://docker-curriculum.com/

## Files and binaries

* `docker`: Main client for running commands, modifying containers, etc.
* `dockerd`: Daemon that runs containers in the background, executes commands from `docker` client.

## Config

Try these lines in a `bashrc`:
```
docker-login ()
{
    docker exec -it "$1" /bin/bash
}
```

---

## Build

```
docker build -f /path/to/dockerfile [-t test_tag_name] /path/to/output/
docker build -f filename .
```

## Misc.

Check that the `docker` (including the `dockerd` daemon) are installed correctly:
```
docker run hello-world
```

Login to a given container:
```
docker exec -it <container-name> /bin/bash
```

Run a new [image] with and as a bash session:
```
docker run -it --rm <image> /bin/bash
```

Run a new image and keep it in the background to log into later:
```
docker run -dt --name <name> <image>
docker exec -it <name> /bin/bash
```

##### Investigating a failed build

Your first bet is to run the build command with the `--progress=plain` flag, which will suppress all Docker's attempts at suppressing error messages from within the build.

If that doesn't work, the next approach is to log onto one of the intermediate layers in the build. Every time Docker executes a RUN command it creates a new layer. These layers all have saved IDs and can be spun-up as desired to investigate the state of a build somewhere before the final outcome.

Setting the (deprecated) `DOCKER_BUILDKIT=0` option will show the IDs of all intermediate builds in the chain:
```
DOCKER_BUILDKIT=0 docker build -t docker-test-1 .
```

Find the build before the command that failed and spin up that image:

```
docker run --rm -it <CONTAINER-ID> [/bin/bash]      
```

There is a more robust way to log into the very container that failed, after the failstate (if, for example, the command takes several hours and it isn't desired to run it again):

1. Find the contianer that broke the build:

```
docker ps -a
```

2. Commit the container to an image:
```
docker commit <CONTAINER-ID>
sha256:<HASH>
```

3. And now log onto the image:
```
docker run --rm -it 7015687976a4 [/bin/bash]
```

See this stack overflow answer for all: https://stackoverflow.com/questions/26220957/how-can-i-inspect-the-file-system-of-a-failed-docker-build
