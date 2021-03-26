FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

# Python support
RUN apt-get update && apt-get install -y python3-pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pytest

# Java/Maven support
RUN apt-get update && apt-get install -y openjdk-11-jdk maven

RUN apt-get update && apt-get install -y stress-ng

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
