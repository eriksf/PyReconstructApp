FROM openjdk:17.0.2-jdk

RUN microdnf upgrade && \
    microdnf install libXext libXrender libXtst

#FROM python:3.10.10-bullseye

# RUN apt-get upate && apt-get upgrade -y \
#    && git clone https://github.com/SynapseWeb/pyReconstruct \
#    && cd pyReconstruct \
#    && cd launch \
#    && cd linux \
#    && sh run.sh \
#    && cd ../../ \
#    && python -m venv env \
#    && source env/bin/activate \
#    && pip install --upgrade pip \
#   && pip install -r src/requirements.txt \
#    && PATH="env/bin:$PATH"
#    && python src/PyReconstruct.py