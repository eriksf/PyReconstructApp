#FROM openjdk:17.0.2-jdk

#RUN microdnf upgrade && \
#    microdnf install libXext libXrender libXtst

FROM python:3.9.16-bullseye

RUN apt-get update && apt-get upgrade -y \
RUN git clone https://github.com/SynapseWeb/pyReconstruct \
RUN cd pyReconstruct \
RUN cd launch \
RUN cd linux \
RUN sh run.sh \
#    && cd ../../ \
#    && pip install -r src/requirements.txt \
# RUN python -m venv env \
# RUN source env/bin/activate \
#    && pip install --upgrade pip \
RUN pip install -r src/requirements.txt \
#    && PATH="env/bin:$PATH" \
RUN apt-get update && apt-get install libgl1 -y \
RUN apt-get install -y libxkbcommon-x11-0 \
RUN apt-get install libegl1-mesa libegl1 \
RUN apt-get install libdbus-1-3 -y \
RUN apt-get install libxcb-xinerama0 \
RUN apt-get install libxcb-util1 \
RUN apt-get install libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev libxcb-xkb-dev \
RUN apt-get install -y libxcb-icccm4 \
RUN apt-get install -y libxcb-image0 \
RUN apt-get install -y libxcb-keysyms1 \
RUN apt-get install -y libxcb-render-util0 \





RUN python src/PyReconstruct.py