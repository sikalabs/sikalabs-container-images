#!/bin/sh

./config.sh --url $GITHUB_REPOSITORY_URL --token $GITHUB_TOKEN --unattended
./run.sh
