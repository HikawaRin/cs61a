FROM ubuntu:22.04
CMD bash

RUN apt -y update && \
    apt -y install python3
