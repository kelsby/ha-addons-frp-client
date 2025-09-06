ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.3.2

FROM $BUILD_FROM

ARG FRP_VERSION=0.64.0

RUN apk add --no-cache curl bash tar

RUN ARCH="$(apk --print-arch)" && \
    case "$ARCH" in \
      x86_64)   FRP_ARCH="amd64" ;; \
      aarch64)  FRP_ARCH="arm64" ;; \
      armv7)    FRP_ARCH="arm" ;; \
      *) echo "Unsupported arch: $ARCH" && exit 1 ;; \
    esac && \
    curl -L "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz" \
    | tar xz -C /usr/local/bin --strip-components=1 "frp_${FRP_VERSION}_linux_${FRP_ARCH}/frpc"

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
