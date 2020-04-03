#!/bin/bash

source ./common_settings.sh

function cleanup() {
  docker stop ${container_name} || (echo "${container_name} not existing or running ...")
  docker rm -f -v ${container_name}|| (echo "${container_name} not existing or running ...")
  docker ps |grep ${container_name}
}

cleanup
#make a directory called data that has svs,output and log folders 
echo "Going to start container"
data_path="/Users/ramoncorrea/Desktop/mydata/"
container_path="/root/data/"
docker run -d --name ${container_name} \
--publish 8888:8888 \
-v ${data_path}:${container_path}\
-t ${image_name}:${image_tag} \
sleep 2
docker ps

echo "enter container"
docker exec -it $container_name /bin/bash
