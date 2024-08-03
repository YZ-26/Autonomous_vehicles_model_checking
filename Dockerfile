FROM ubuntu:22.04

LABEL maintainer="Leonardo Picchiami <picchiami@di.uniroma1.it>"


ENV DEBIAN_FRONTEND=noninteractive


# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libncurses5 \
    libncurses5-dev \
    build-essential \
    cmake \
    nano \
    time


# Install Java 
RUN apt-get update && apt install -y default-jre


COPY prism-4.8.1-linux64-x86/ /opt/prism-4.8.1-linux64-x86
WORKDIR /opt/prism-4.8.1-linux64-x86
RUN chmod +x install.sh && ./install.sh

RUN mkdir /opt/prism-4.8.1-linux64-x86/time /opt/prism-4.8.1-linux64-x86/verification


# Copy PRISM model files
COPY prism_models/ /opt/prism-4.8.1-linux64-x86/prism_models/


# Copy PRISM property files
COPY prism_properties/ /opt/prism-4.8.1-linux64-x86/prism_properties/

# Copy shell scripts for experiments
COPY commands.sh /opt/prism-4.8.1-linux64-x86/commands.sh

