FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3-pip stress-ng
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pytest

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
