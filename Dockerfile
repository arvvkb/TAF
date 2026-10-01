FROM alpine:3.18

RUN apk update && apk add --no-cache curl

RUN mkdir -p /xray && \
    curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh -o /tmp/install.sh && \
    chmod +x /tmp/install.sh && \
    bash /tmp/install.sh -u local && \
    rm /tmp/install.sh

COPY config.json /xray/config.json

EXPOSE 2087

CMD ["/root/.local/bin/xray", "run", "-c", "/xray/config.json"]
