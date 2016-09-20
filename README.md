## DeepStyle Dockerfile

Having fun with Art and Deep Neuronal Networks

Work in progress...


### Base Docker Image

* [ubuntu:14.04](https://registry.hub.docker.com/u/library/ubuntu/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. You can build an image from Dockerfile: `docker build -t="oeeckhoutte/deepStyle" github.com/oeeckhoutte/deepStyle`)


### Usage

    docker run -i -t --rm oeeckhoutte/deepStyle

    $ cd ./DeepStyle/neural-style
    $ th neural_style.lua -style_image ./examples/inputs/starry_night.jpg -content_image ./examples/inputs/brad_pitt.jpg  -gpu -1 -print_iter 1

