#!/bin/sh

set -e

slu shell-scripts required-environment-variables -e GITHUB_REPOSITORY_URL -e GITHUB_TOKEN

./config.sh --url $GITHUB_REPOSITORY_URL --token $GITHUB_TOKEN --unattended
./run.sh
