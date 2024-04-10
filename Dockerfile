FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

# Install various dependencies
RUN python3 -m pip install fvcore==0.1.5.post20221221 iopath==0.1.10 transformers==4.39.3 diffusers==0.27.2 accelerate==0.29.1 huggingface-hub==0.22.2 numpy==1.26.3 pillow==10.2.0 safetensors==0.4.2 pyrallis==0.3.1

# Figure out which build of pytorch3d to install
COPY pytorch3d-version.py /pt3dv.py
RUN VER=$(python3 /pt3dv.py) && pip install --no-index --no-cache-dir pytorch3d==0.7.6 -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/$VER/download.html

# Install maptilegen-good
COPY . /tilemapgen-good
RUN cd /tilemapgen-good && pip install -e .

# Fetch stable diffusion models
RUN cd /tilemapgen-good/ && python3 -c "from tilemapgen.stable_diffusion import get_txt2img_pipe; get_txt2img_pipe()"
RUN cd /tilemapgen-good/ && python3 -c "from tilemapgen.stable_diffusion import get_depth2img_pipe; get_depth2img_pipe()"


RUN echo "echo \033[3\;33m   ~~~ TILEMAPGEN-GOOD ~~~" >> /root/.bashrc && \
    echo "echo Make sure to use --parent_path /output on your tilemapgen commands!" >> /root/.bashrc && \
    echo "echo \033[0m" >> /root/.bashrc && \
    echo "PS1='\[\e[1;33m\] 🦆 \[\e[1;36m\]\w:\[\e[0;0m\]$ '" >> /root/.bashrc

WORKDIR /tilemapgen-good
