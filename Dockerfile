# Build from base image
FROM python:3.9.16-bullseye

# Add maintainer information
LABEL maintainer="Tiffany Huff <tiffanynicolehuff@utexas.edu>"

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
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
    libdbus-1-3

# Clone the pyReconstruct repository
RUN git clone https://github.com/SynapseWeb/pyReconstruct.git

# Upgrade pip
RUN /usr/local/bin/python -m pip install --upgrade pip

# Install Python and script dependencies
RUN pip install \
    pandas \
    opencv-python-headless \
    pyyaml \
    asciitree==0.3.3 \
    entrypoints==0.4 \
    fasteners==0.18 \
    imageio==2.25.0 \
    lxml==4.9.2 \
    networkx==3.0 \
    numcodecs==0.11.0 \
    numpy==1.24.1 \
    opencv-python==4.7.0.68 \
    packaging==23.0 \
    Pillow==9.4.0 \
    PyOpenGL==3.1.6 \
    pyqtgraph==0.13.1 \
    PySide6==6.4.2 \
    PySide6-Addons==6.4.2 \
    PySide6-Essentials==6.4.2 \
    PyWavelets==1.4.1 \
    scikit-image==0.19.3 \
    scipy==1.10.0 \
    shiboken6==6.4.2 \
    tifffile==2023.1.23.1 \
    trimesh==3.18.1 \
    zarr==2.13.6

# Command for execution
CMD ["python", "pyReconstruct/src/PyReconstruct.py"]

# To run this container using Docker on Mac, open a terminal and pass the
# command: 'xhost + 127.0.0.1' then execute the command: 
# 'docker run -e DISPLAY=host.docker.internal:0 tiffhuff/pyreconstruct:0.0.1 python pyReconstruct/src/PyReconstruct.py'
#
# To run this container using Apptainer/Singularity:
# 'apptainer exec docker://tiffhuff/pyreconstruct:0.0.1 python /app/pyReconstruct/src/PyReconstruct.py'