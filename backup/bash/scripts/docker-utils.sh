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

docker-clean()
{
    # TODO: Prune unused images
    docker system prune --filter "until=24h"
}

docker-sweep()
{
    mem_usage=`df | grep data_disk | awk '{printf "%d\n", $5}'`
    [[ mem_usage -lt 90 ]] && return 0
    echo "Docker using too much memory, pruning..."
    yes | docker system prune --filter "until=24h"
    beep "Docker system pruned"
}
