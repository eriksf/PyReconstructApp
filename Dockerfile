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

RUN apt-get update && apt-get install libgl1 -y 
RUN apt-get install -y libxkbcommon-x11-0 
RUN apt-get install libegl1-mesa libegl1 -y 
RUN apt-get install libdbus-1-3 -y 
RUN apt-get install -y libxcb-xinerama0 
RUN apt-get install -y libxcb-xv0
RUN apt-get install -y libxcb-util1 
RUN apt-get install -y libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev 
RUN apt-get install -y libxcb-icccm4 
RUN apt-get install -y libxcb-image0 
RUN apt-get install -y libxcb-keysyms1 
RUN apt-get install -y libxcb-render-util0 
RUN apt-get install -y libxcb-shape0 
RUN apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y 
RUN apt-get install python3-pyqt5 -y

#ENV PATH=/home1/09252/tiffhuff/.local/lib/python3.9/site-packages:$PATH