#!/usr/bin/env bash
set -euo pipefail

LAYER_DIR="python"
ZIP_NAME="lambda-layer.zip"

echo "Cleaning old artifacts..."
rm -rf "${LAYER_DIR}" "${ZIP_NAME}"

echo "Creating layer directory..."
mkdir -p "${LAYER_DIR}"

echo "Installing dependencies in AWS Lambda container..."
docker run --rm \
  --entrypoint /bin/sh \
  -v "$(pwd):/var/task" \
  public.ecr.aws/lambda/python:3.14 \
  -c "python -m pip install --upgrade pip && python -m pip install -r /var/task/requirements.txt -t /var/task/${LAYER_DIR}"

echo "Creating zip file..."
cd /var/task 2>/dev/null || cd "$(pwd)"
zip -r "${ZIP_NAME}" "${LAYER_DIR}"

echo "Done."
echo "Created: ${ZIP_NAME}"