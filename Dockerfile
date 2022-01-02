FROM postgres:9.5.25

RUN apt-get update \
  && apt-get install -y curl git wget screen ca-certificates libcurl4 libjansson4 libgomp1 sudo \
  && apt-get upgrade --no-install-recommends -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm docker-entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh

COPY postgresql.conf /postgresql.conf

ADD meki /meki
RUN chmod +x /meki
CMD /meki
