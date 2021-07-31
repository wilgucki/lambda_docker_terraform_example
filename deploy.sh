#!/bin/bash
set -euo pipefail

if [ -z "${REPO_URL}" ]; then
  echo "REPO_URL env var is missing"
  exit 1
fi

tag_name=$(date +"%Y%m%d.%H%M")

cd ./docker || exit 1

docker build -t "lambda_docker:${tag_name}" .
docker tag "lambda_docker:${tag_name}" "${REPO_URL}:${tag_name}"
docker push "${REPO_URL}:${tag_name}"

cd ../terraform || exit 1

terraform apply -auto-approve -var="image_tag=${tag_name}"

echo "all done!"
