FROM ruby:2.5.7-slim-buster

ENV BUILD_DEPS="git gcc g++ make"

RUN mkdir -p /home/build \
  && cd /home/build \
  && apt-get update \
  && apt-get install -y --no-install-recommends $BUILD_DEPS zlib1g-dev fontforge \
  \
  && git clone https://github.com/bramstein/sfnt2woff-zopfli.git sfnt2woff-zopfli \
  && cd sfnt2woff-zopfli \
  && make \
  && mv sfnt2woff-zopfli /usr/local/bin/sfnt2woff \
  \
  && cd .. \
  && git clone --recursive https://github.com/google/woff2.git \
  && cd woff2 \
  && make clean all \
  && mv woff2_compress /usr/local/bin/ \
  && mv woff2_decompress /usr/local/bin/ \
  \
  && gem install fontcustom \
  && apt-get remove -y --purge $BUILD_DEPS \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /home/app
