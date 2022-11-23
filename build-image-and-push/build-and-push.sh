#!/bin/bash
set -e
FULL_NAME=$(echo "${REGISTRY_URL}/${PROJECT}/${PROJECT_NAME}${IMAGE_NAME_SUFFIX}:${VERSION}" | awk '{print tolower($0)}')


echo "#############################################"
echo "Building image..."
echo "${FULL_NAME}"
echo "#############################################"
docker build . -f ${DOCKERFILE} -t ${FULL_NAME} ${BUILD_ARGS}

echo "#############################################"
echo "Pushing to the container registry..."
echo "#############################################"
docker login -u ${REGISTRY_USERNAME} -p ${REGISTRY_PASSWORD} ${REGISTRY_URL}
docker push ${FULL_NAME}

docker rmi ${FULL_NAME}

echo "#############################################"
echo "Done!"
echo "#############################################"
exit 0