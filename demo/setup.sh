#!/bin/sh
source .env
set -e

make -C ./keys aws-keys
make -C ./terraform setup
make -C ./keys setup