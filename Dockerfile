#
# DeepStyle
#
# https://github.com/oeeckhoutte/deepStyle
#

# Pull base image.
FROM ubuntu:14.04

# Install basics.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

#RUN rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Install DeepDreamStyle deps.
RUN \
  apt-get install -y lua5.2 && \
  apt-get install -y luarocks && \
  apt-get install -y luajit

RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-all | bash

RUN luajit -ltorch

RUN \
  apt-get install -y libprotobuf-dev protobuf-compiler && \
  luarocks install loadcaffe && \
  luarocks install image && \
  luarocks install nn

RUN \
  mkdir DeepStyle && \
  cd DeepStyle && \
  git clone https://github.com/jcjohnson/neural-style.git && \
  cd neural-style && \
  sh models/download_models.sh


# Define default command.
CMD ["bash"]