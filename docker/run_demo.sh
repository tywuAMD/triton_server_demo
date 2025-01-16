#!/bin/bash

echo "//// Preparing the pre-built docker image ////" 
docker pull tyamd/rocm_triton_server_vllm_backend:ROCm6.2.3_vLLM0.6.6_gfx1100
docker image tag tyamd/rocm_triton_server_vllm_backend:ROCm6.2.3_vLLM0.6.6_gfx1100 tritonserver


if [ -z "$(docker images -q tritonserver:latest 2> /dev/null)" ]; then
  echo "//// Please make sure there exist a valid docker image named \"tritonserver\" ////"
  exist 0
fi

echo "//// Initializing the demo docker... ////"
chmod +x ./start_services.sh
docker compose build

echo "//// Running the demo docker... ////"
docker compose up