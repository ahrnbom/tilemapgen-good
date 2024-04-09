## Tilemapgen-good

Tilemapgen-good is a fork of [tilemapgen](https://github.com/charmed-ai/tilemapgen) which aims to improve the project by making it easy to install and use. The [readme of the original repository is available here](README_original.md).

### Requirements
* A Linux computer with a modern Nvidia GPU and Nvidia's drivers
* Docker

### Instructions
```
git clone https://github.com/ahrnbom/tilemapgen-good.git && \
cd tilemapgen-good && \
./run.sh
```

If you have a rootful installation of Docker (which is the default), you will need to replace the last line by `sudo ./run.sh`.
