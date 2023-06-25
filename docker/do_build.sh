#!/bin/bash

# To work with aliases inside Fedora' toolbox
#shopt -s expand_aliases
#alias docker="flatpak-spawn --host podman"

DOCKERFILE="docker/fedora-texlive-scheme-full/Dockerfile"
if [ ! -f $DOCKERFILE ] ; then
	echo "$DOCKERFILE not found"
	exit 1
fi

# Build only if needed. Saves 10+ seconds on Windows...
#docker image ls |grep mcec-cv &> /dev/null
#if test $? -ne "0"; then
#  docker build -t fedora-texlive-scheme-full . -f docker/fedora-texlive-scheme-full/Dockerfile
#  docker build -t mcec-cv . -f docker/mcec-cv/Dockerfile
#fi

IMAGENAME="petersenna/fedora-texlive-scheme-full:latest"
#IMAGENAME="fedora-texlive-scheme-full:latest"
AB=$(realpath $(pwd))
#docker run --rm=true -u $(id -u):$(id -g) -i \
docker run --rm=true -i \
  -v ${AB}:${HOME}:Z \
  -w ${HOME} -it  $IMAGENAME $@
