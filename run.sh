docker build --tag tmgg:latest . && \
docker run --rm --gpus all --name tilemapgen-good --mount type=bind,source="$(pwd)"/output,target=/output -it tmgg:latest bash
