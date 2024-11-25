#! /bin/bash

# I am not sure if this is needed actually
source .pyenv_init

# Change to poetry env
poetry shell

python3 train.py
