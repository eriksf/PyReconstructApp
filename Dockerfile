FROM python:3.9.16-bullseye

RUN apt-get update && apt-get upgrade -y \
    && git clone https://github.com/SynapseWeb/pyReconstruct $WORK/pyReconstruct \
    && cd $WORK/pyReconstruct \
    && pip install --upgrade pip \
    && pip install -r src/requirements.txt 

ENV PATH=/home1/09252/tiffhuff/.local/lib/python3.9/site-packages:$PATH