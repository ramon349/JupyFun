#!/bin/bash

source ./common_settings.sh

function build_image() {
   local image_name=$1
   local image_tag=$2
   local docker_file=$3

   docker images |grep ${image_name}

   echo "Build ${image_name}:${image_tag} docker image ..."

   docker build  --force-rm -f ${docker_file} -t ${image_name}:${image_tag} . || { echo "${image_name} docker image build failed" ; exit 1; }
   docker images |grep ${image_name}
  
   docker images
  }



echo "Remove ${image_name}:${image_tag}"
docker rmi --force ${image_name}:${image_tag}

echo "Build ${image_name}:${image_tag} docker image ..."
time build_image ${image_name} ${image_tag} ${dockerfile}