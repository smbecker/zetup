#!/bin/bash

if [ "$(lspci | grep -i 'VGA compatible controller: NVIDIA')" != "" ]; then
  sudo apt install -y nvidia-cuda-toolkit
fi
