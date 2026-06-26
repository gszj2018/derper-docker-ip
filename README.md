# Unofficial Tailscale DERP Image for IP-only Deployment

## Example Usage
```bash
podman run -d                           \
    --name=derper                       \
    --restart=always                    \
    -p 33445:33445                      \
    -p 3478:3478/udp                    \
    -v /root/derper-certs:/derper-certs \
    -e DERPER_HOST="<Your Server IP>"   \
    ghcr.io/gszj2018/derper-docker-ip:latest
```