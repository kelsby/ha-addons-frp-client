ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.3.2
FROM $BUILD_FROM

# Ставим зависимости
RUN apk add --no-cache curl tar

# Скачиваем frpc
ARG FRP_VERSION=0.61.1
RUN ARCH="$(apk --print-arch)" && \
    case "$ARCH" in \
      x86_64)   FRP_ARCH="amd64" ;; \
      aarch64)  FRP_ARCH="arm64" ;; \
      armv7)    FRP_ARCH="arm" ;; \
      *) echo "Unsupported arch: $ARCH" && exit 1 ;; \
    esac && \
    curl -L "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz" \
    | tar xz -C /usr/local/bin --strip-components=1 frp_${FRP_VERSION}_linux_${FRP_ARCH}/frpc

# Копируем скрипт запуска как сервис s6
COPY run.sh /etc/services.d/frpc/run
RUN chmod +x /etc/services.d/frpc/run
