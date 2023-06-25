#/bin/bash

IMAGENAME="petersenna/fedora-texlive-scheme-full"

if [ ! -f ./Dockerfile ] ; then
        echo  "./Dockerfile not found"
        exit 1
fi

docker build -t $IMAGENAME .

docker login docker.io

docker push "docker.io/$IMAGENAME:latest"

