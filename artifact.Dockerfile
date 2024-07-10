ARG PYTHON_VERSION

FROM runtime:${PYTHON_VERSION} AS build

ARG LIBRDKAFKA_VERSION

RUN cd /tmp \
    && git clone https://github.com/confluentinc/librdkafka \
    && cd librdkafka \
    && git checkout tags/v${LIBRDKAFKA_VERSION} \
    && ./configure --arch=aarch64 \
    && make \
    && make install \
    && PATH=$PATH:/usr/sbin \
    && ldconfig \
    && cd ../ \
    && rm -rf librdkafka

COPY artifact.sh /opt/scripts/artifact.sh
RUN /opt/scripts/artifact.sh

FROM scratch AS artifact

COPY --from=build "/tmp/librdkafka-build/" /

FROM build AS release

CMD ["/bin/bash"]
