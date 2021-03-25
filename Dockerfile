FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get install -y python3-pip openjdk-11-jdk maven stress-ng
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pytest

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
