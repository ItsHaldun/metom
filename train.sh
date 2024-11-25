#! /bin/bash

# I am not sure if this is needed actually
source .env_init

# Change to poetry env
poetry run python train.py
