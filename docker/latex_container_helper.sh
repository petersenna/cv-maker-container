#!/bin/bash

IMAGENAME="petersenna/fedora-texlive-scheme-full:latest"

# To work with aliases inside Fedora' toolbox
#shopt -s expand_aliases
#alias docker="flatpak-spawn --host podman"

AB=$(realpath $(pwd))

docker run --rm=true -i \
  -v ${AB}:${HOME}:Z \
  -w ${HOME} $IMAGENAME $@
