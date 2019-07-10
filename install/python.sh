#!/bin/bash

sudo apt -yq install \
  libncurses5-dev \
  libncursesw5-dev \
  libx11-dev \
  libxtst-dev \
  xorg-dev \
  g++ \
  cloc \
  python-dev \
  python3-dev \
  python-pip \
  python3-pip

pip3 install awscli --upgrade --user