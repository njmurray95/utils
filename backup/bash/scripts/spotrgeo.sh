#!/bin/env bash

########################################
# SpotrGeo Build aliases
spotr-restart ()
{
    docker compose -f /home/nmurray/code/spotrgeo/docker/docker-compose.yml down
    docker compose -f /home/nmurray/code/spotrgeo/docker/docker-compose.yml up -d
    # docker compose -f /home/nmurray/code/spotrgeo/docker/docker-compose.yml up -d --build
}

spotr-rebuild()
{
    command cd /home/nmurray/code/spotrgeo/
    /home/nmurray/code/spotrgeo/build_docker_containers.sh -d
    BRANCH_TAG=`git branch --show-current | awk -F '-' '{print $1"-"}'`
    spotr-restart
    command cd $OLDPWD
    beep "Spotr Rebuilt for $BRANCH_TAG"
}

spotr-rebuild-all()
{
    command cd /home/nmurray/code/spotrgeo/
    /home/nmurray/code/spotrgeo/build_docker_containers.sh
    BRANCH_TAG=`git branch --show-current | awk -F '-' '{print $1"-"}'`
    spotr-restart
    command cd $OLDPWD
    beep "Spotr Rebuilt for $BRANCH_TAG"
}

spotr-web-dev()
{
    echo "Starting gulp dev web proxy..."
    npx gulp dev --gulpfile /home/nmurray/code/spotrgeo/spotrgeo_ui/lib/gulpfile.js 2>&1 >> /home/nmurray/.local/share/spotr-webdev.log &
    # PWD needs to be the script dir for some reason
    cd /home/nmurray/code/spotrgeo/spotrgeo_ui
    ./dev_serve.sh 2>&1 >> /home/nmurray/.local/share/spotr-webdev.log &
    cd $OLDPWD
}

spotr-permissions()
{
    sudo chmod -R 777 /opt/AV/ && touch /opt/AV/perms.lock
}

########################################
# SpotrGeo docker Status aliases
spotr-ps()
{
    format_str="{{.ID}}\t{{printf \"%-45s\" .Names}} {{printf \"%-20s\" .Status}}"
    echo -e "LIVE\n----"
    docker ps -f name="docker-*" --format "$format_str"

    echo -e "DEAD\n----"
    docker ps -a -f name="docker-*" -f status=dead -f status=exited --format "$format_str"
}


spotr-dead()
{
    docker ps -a -f status=dead -f status=exited
}

spotr-status()
{
    docker ps --format 'table {{.Names}}\t{{.Status}}'
}


spotr-watch()
{
    alacritty msg create-window -e docker logs -f docker-spotr-geo-backend-server-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-detection-consumer-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-pipeline-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-feature-extractor-1
}

spotr-watch-boron()
{
    alacritty msg create-window -e docker logs -f docker-spotr-geo-backend-server-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-detection-consumer-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-pipeline-rhel-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-feature-extractor-1
    alacritty msg create-window -e docker logs -f docker-spotr-geo-boron1-1
}

########################################
# Code sync aliases

spotr-pull-backend()
{
    docker cp docker-spotr-geo-backend-server-rhel-1:/opt/AV/SpotrGeo/spotrgeo_server/scripts /home/nmurray/code/spotrgeo/spotrgeo_server/spotrgeo_server/
}

spotr-push-frontend()
{

    docker cp /home/nmurray/code/spotrgeo/spotrgeo_ui/bin/ docker-spotr-geo-backend-server-rhel-1:/opt/AV/SpotrGeo/SpotrGeo/
}

spotr-push-ossim-config()
{
    docker cp /home/nmurray/code/spotrgeo/docker/minimal/ossim_preferences docker-spotr-geo-backend-server-rhel-1:/opt/ossim/ossim_preferences
    docker cp /home/nmurray/code/spotrgeo/docker/minimal/ossim_preferences docker-spotr-geo-pipeline-rhel-1:/opt/ossim/ossim_preferences
}

spotr-push-backend()
{
    docker cp /home/nmurray/code/spotrgeo/spotrgeo_server/spotrgeo_server/scripts/ docker-spotr-geo-backend-server-rhel-1:/opt/AV/SpotrGeo/spotrgeo_server/
    docker cp /home/nmurray/code/spotrgeo/spotrgeo_server/spotrgeo_server/scripts/ docker-spotr-geo-pipeline-rhel-1:/opt/AV/SpotrGeo/spotrgeo_server/
    docker cp /home/nmurray/code/spotrgeo/spotrgeo_server/spotrgeo_server/scripts/ docker-spotr-geo-detection-consumer-rhel-1:/opt/AV/SpotrGeo/spotrgeo_server/
}

# spotr-mda-sync()
# {
# 
# }

########################################
# Misc.
add-nadir()
{
    sudo mkdir -p /opt/AV/SpotrGeo/SpotrGeoData/c7f/unconverted/off_nadir_1/
    sudo cp /home/nmurray/Pictures/images/off_nadir_test/China/* /opt/AV/SpotrGeo/SpotrGeoData/c7f/unconverted/off_nadir_1/
    sudo chmod -R 777 /opt/AV/SpotrGeo/SpotrGeoData/c7f/unconverted/off_nadir_1/
    sudo chgrp -R 1077 /opt/AV/SpotrGeo/SpotrGeoData/c7f/unconverted/off_nadir_1/
}

# Running off_nadir_1 tests
# 1) clean-nadir
# 2) docker-restart
# 3) push-ossim-config (if testing with elevation)
# 4) add-nadir
clean-nadir()
{
    sudo rm -rf /opt/AV/SpotrGeo/SpotrGeoData/c7f/unconverted/off_nadir_1/
}
