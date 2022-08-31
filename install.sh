#!/bin/bash

# Set the source folder
SRC=$(cd $(dirname "$0"); pwd)

sudo ln -sL "${SRC}/eds.sh" /usr/local/bin/eds