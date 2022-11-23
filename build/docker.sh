#!/bin/bash
set -e
docker build ${GITHUB_ACTION_PATH} --build-arg IMAGE=$IMAGE -t tmp-${GITHUB_RUN_ID}
docker run --rm ${IMAGE_ARGS} \
    -v ${GITHUB_WORKSPACE}:"/github/workspace" \
    -e EXTRA_ARGS -e MAVEN_SETTINGS -e VERSION \
    --workdir /github/workspace \
    tmp-${GITHUB_RUN_ID}