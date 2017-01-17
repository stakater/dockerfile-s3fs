FROM    stakater/base-alpine
LABEL   authors="Hazim <hazim_malik@hotmail.com>"

RUN     apk -Uv add automake fuse fuse-dev g++ git curl curl-dev libxml2-dev make openssl-dev
RUN     rm /var/cache/apk/*
RUN     mkdir -p /s3fs && mkdir -p /usr/src

ARG     S3FS_VERSION=v1.80
RUN     curl -s -L https://github.com/s3fs-fuse/s3fs-fuse/archive/${S3FS_VERSION}.tar.gz |  tar zxv -C /usr/src &&
        cd /usr/src/s3fs-fuse-${S3FS_VERSION} && \
        ./autogen.sh && \
        ./configure --prefix=/usr
RUN     cd /usr/src/s3fs-fuse-${S3FS_VERSION} && \
        make && \
        make install

# Expose volume for passwd file
VOLUME  ["/passwd"]
# Expose the working directory
VOLUME 	["/s3fs"]

WORKDIR "/s3fs"