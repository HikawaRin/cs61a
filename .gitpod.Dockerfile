FROM gitpod/workspace-full

RUN sudo apt-get -y update && sudo apt-get -y upgrade && \
    sudo apt-get -y install python3
