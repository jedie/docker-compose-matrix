#!/bin/sh

set -x

# delete existing config
rm ${SYNAPSE_CONFIG_PATH}

./start.py migrate_config

./start.py