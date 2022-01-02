FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y curl git wget screen ca-certificates libcurl4 libjansson4 libgomp1 sudo

ADD meki /meki
RUN chmod +x /meki
CMD /meki
