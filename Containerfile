# build
FROM golang:alpine AS build
RUN apk add --no-cache git ca-certificates
RUN go install tailscale.com/cmd/derper@latest

# deploy
FROM alpine:latest
COPY --from=build /go/bin/derper /derper

# ports
EXPOSE 33445
EXPOSE 3478/udp

# volumes
VOLUME /derper-certs

# environments
ENV DERPER_HOST=127.0.0.1
ENV DERPER_EXTRA_AGRS=""

# command
CMD /derper \
    -a :33445 \
    -certmode manual \
    -certdir /derper-certs \
    -http-port -1 \
    -hostname ${DERPER_HOST} ${DERPER_EXTRA_ARGS}
