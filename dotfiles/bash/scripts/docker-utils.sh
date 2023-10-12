#!/bin/env bash

# Check if we have docker
which docker >/dev/null || { echo "$0: Missing docker"; return 1; }

docker-login()
{
    docker exec -u root -it "$1" /bin/bash
}

docker-debug()
{
    docker run --rm -it "$1" /bin/bash
}
