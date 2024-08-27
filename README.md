# coolify-nginx-reverse-proxy

Simple nginx reverse proxy on coolify.

This could be useful if you want to expose a local IP:[PORT] on your LAN to the outside world.

## Environment variables

### `PROXY_URL`

IP or URL you want to expose via coolify.

## `compose.yml` setup

```yaml
services:
  webapp:
    image: ghcr.io/cabaalexander/coolify-nginx-reverse-proxy:latest
    environment:
      - SERVICE_FQDN_WEBAPP_80
      - PROXY_URL=${PROXY_URL:-https://example.com/}
    restart: unless-stopped
```
