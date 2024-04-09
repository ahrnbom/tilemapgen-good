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

### Why?
The original tilemapgen repository made several design choices that made it very difficult to install and run. In particular, its mix of pinned and unpinned dependencies was a problem. PyTorch is somewhat picky to install, if you want proper GPU support. PyTorch3d is even more picky. And conda is a somewhat complicated tool that further complicates the process. This fork tries to solve these problems by a simple Dockerfile setup. This should be very useful, even if you decide to not use Docker yourself, as the actual install commands are all there and easily translated to other tools, or a native install.
