#!/usr/bin/env bash
set -euo pipefail

LAYER_DIR="python"
ZIP_NAME="psycopg-layer.zip"
PACKAGE_NAME="psycopg"

echo "Cleaning old artifacts..."
rm -rf "${LAYER_DIR}" "${ZIP_NAME}"

echo "Creating layer directory..."
mkdir -p "${LAYER_DIR}"

echo "Installing ${PACKAGE_NAME} in AWS Lambda container..."
docker run --rm \
  --entrypoint /bin/sh \
  -v "$(pwd):/var/task" \
  public.ecr.aws/lambda/python:3.14 \
  -c "python -m pip install --upgrade pip && python -m pip install --no-cache-dir ${PACKAGE_NAME} -t /var/task/${LAYER_DIR}"

echo "Creating zip file..."
zip -r "${ZIP_NAME}" "${LAYER_DIR}"

echo "Done."
echo "Created: ${ZIP_NAME}"