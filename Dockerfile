FROM python:3.9.16-bullseye

RUN apt-get update && apt-get install -y curl && \
    curl -o /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV PATH /opt/conda/bin:$PATH

RUN conda install -c anaconda libxcb -y

RUN apt-get update && apt-get upgrade -y \
    && git clone https://github.com/SynapseWeb/pyReconstruct $WORK/pyReconstruct \
    && cd $WORK/pyReconstruct \
    && pip install --upgrade pip \
    && pip install -r src/requirements.txt

RUN apt-get update && apt-get install libgl1 -y \
    && apt-get install -y libxkbcommon-x11-0 \
    && apt-get install libegl1-mesa libegl1 -y \
    && apt-get install libdbus-1-3 -y \
    && apt-get install -y libxcb-xinerama0 \
    && apt-get install -y libxcb-xv0 \
    && apt-get install -y libxcb-util1 \
    && apt-get install -y libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
    && apt-get install -y libxcb-icccm4 \
    && apt-get install -y libxcb-image0 \
    && apt-get install -y libxcb-keysyms1 \
    && apt-get install -y libxcb-render-util0 \
    && apt-get install -y libxcb-shape0 \
    && apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y \
    && apt-get install python3-pyqt5 -y