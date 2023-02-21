#! /bin/bash
docker build -t party_image --build-arg WORK_DIR=$PWD --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) environment || exit

gpu=$(lspci | grep -i '.* vga .* nvidia .*')

printf '==============\n'

if [[ $gpu == *' nvidia '* ]]; then
    printf 'Nvidia GPU is present:  %s\n' "$gpu"
    docker run -ti \
        -v ~:/home/$USER \
        --gpus all \
        -v /mnt:/mnt \
        -v /etc/localtime:/etc/localtime:ro \
        -u $(id -u):$(id -g) \
        --net=host \
        party_image bash 
else
    printf 'Nvidia GPU is not present cpu only!\n'
    docker run -ti \
        -v ~:/home/$USER \
        -v /mnt:/mnt \
        -v /etc/localtime:/etc/localtime:ro \
        -u $(id -u):$(id -g) \
        --net=host \
        party_image bash 
fi
