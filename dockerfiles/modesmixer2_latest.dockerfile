FROM ubuntu:18.04 AS base

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	netbase \
	sqlite3 \
	openssl && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM --platform=$TARGETPLATFORM ubuntu:18.04 as builder

ARG TARGETARCH

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	curl \
	ca-certificates

RUN set -ex; \
	if [ ${TARGETARCH} = "arm" -o ${TARGETARCH} = "arm64" ]; then \
		echo "Download armhf version";\
		curl -SL "https://drive.google.com/uc?export=download&id=18DjTxitzZj9RsVPxt7lmnptfL5eZqHxJ" | tar -xzC /usr/local/bin modesmixer2 ; \
	fi; \
    if [ ${TARGETARCH} = "amd64" ]; then \
		echo "Download AMD64 version" ; \
		curl -SL "https://drive.google.com/uc?export=download&id=1QzUqYTt-Bf-m817-i3W_RvodB019kxC5" | tar -xzC /usr/local/bin modesmixer2 ; \
	fi;

FROM base

COPY --from=builder /usr/local/bin/modesmixer2 /usr/local/bin/modesmixer2

EXPOSE 8080/tcp

ENTRYPOINT ["/usr/local/bin/modesmixer2","--web","8080"]