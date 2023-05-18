FROM condaforge/miniforge3:23.1.0-1
LABEL maintainer="Tiffany Huff <tiffanynicolehuff@utexas.edu>, Erik Ferlanti <eferlanti@tacc.utexas.edu>"

WORKDIR /app

# Configure ENV
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add docker-clean script
COPY extras/docker-clean /usr/bin/docker-clean
RUN chmod a+rx /usr/bin/docker-clean && docker-clean

# Install system dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        less \
        libxcb-xinerama0 \
        libxcb-xinerama0-dev \
        libxkbcommon-x11-0 \
        xvfb \
        libxcb-xv0 \
        libxkbcommon-x11-dev \
        libxcb-xtest0-dev \
        libxcb-randr0-dev \
        libxcb-xinerama0-dev \
        libxcb-shape0-dev \
        libxcb-xkb-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-keysyms1-dev \
        libxcb-render-util0-dev \
        libx11-xcb-dev \
        libglu1-mesa-dev \
        libxrender-dev \
        libxi-dev \
        x11-utils \
        x11-xserver-utils \
        libdbus-1-3 \
    && docker-clean

# Copy in the conda environment file and
# install the custom conda environment
COPY PyReconstruct/autoseg-environment.yml /tmp/autoseg-environment.yml

ARG ENV_NAME=pr_autoseg
RUN conda env create -f /tmp/autoseg-environment.yml -n ${ENV_NAME} \
    && echo "conda activate ${ENV_NAME}" >> /etc/skel/.bashrc \
    && echo "conda activate ${ENV_NAME}" >> ~/.bashrc \
    && rm -rf /tmp/autoseg-environment.yml \
    && docker-clean

ENV PATH=/opt/conda/envs/${ENV_NAME}/bin:$PATH

# Copy in code
COPY PyReconstruct /app/PyReconstruct

# Command for execution
CMD ["python", "/app/PyReconstruct/src/PyReconstruct.py"]

# To run this container using Docker on Mac, open a terminal and pass the
# command: 'xhost + 127.0.0.1' then execute the command: 
# 'docker run -e DISPLAY=host.docker.internal:0 tiffhuff/pyreconstruct:0.0.1 python pyReconstruct/src/PyReconstruct.py'
#
# To run this container using Apptainer/Singularity:
# 'apptainer exec docker://tiffhuff/pyreconstruct:0.0.1 python /app/pyReconstruct/src/PyReconstruct.py'
