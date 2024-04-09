FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

# Install various dependencies
RUN python3 -m pip install fvcore==0.1.5.post20221221 iopath==0.1.10 transformers==4.39.3 diffusers==0.27.2 accelerate==0.29.1 huggingface-hub==0.22.2 numpy==1.26.3 pillow==10.2.0 safetensors==0.4.2 pyrallis==0.3.1 invoke==2.2.0

# Figure out which build of pytorch3d to install
COPY pytorch3d-version.py /pt3dv.py
RUN VER=$(python3 /pt3dv.py) && pip install --no-index --no-cache-dir pytorch3d==0.7.6 -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/$VER/download.html

RUN echo "echo \033[3\;33m    TILEMAPGEN-GOOD" >> /root/.bashrc && \
echo "echo Syntax: inv \<task\>" >> /root/.bashrc && \
    echo "cd /tilemapgen-good && inv -l" >> /root/.bashrc && \
    echo "echo \033[0m" >> /root/.bashrc && \
    echo "cd /tilemapgen-good && source <(inv --print-completion-script bash)" >> /root/.bashrc

WORKDIR /tilemapgen-good
