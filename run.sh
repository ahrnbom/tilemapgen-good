docker build --tag tmgg:latest . && \
docker run --rm --gpus all --name tilemapgen-good --mount type=bind,source="$(pwd)"/output,target=/mounted --mount type=bind,source="$(pwd)",target=/tilemapgen-good -it tmgg:latest bash
