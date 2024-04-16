# coolify-nginx-reverse-proxy

Simple nginx reverse proxy on coolify.

This could be useful if you want to expose a local IP:[PORT] on your LAN to the outside world.

## Environment variables

### `W_APP`

App name, this would work as the subdomain on your coolify instance.

### `W_DOMAIN`

Domain where your coolify instances is configured.

### `W_PROXY_URL`

IP or URL you want to expose via coolify.

### `W_CLIENT_MAX_BODY_SIZE`

nginx config.

## `compose.yml` setup

```
version: '3'
services:
  web:
    image: ghcr.io/cabaalexander/coolify-nginx-reverse-proxy:latest
    container_name: nginx-proxy-${W_APP:-pox}
    environment:
      - W_PROXY_URL=${W_PROXY_URL:-https://coolify.io}
      - W_CLIENT_MAX_BODY_SIZE=${W_CLIENT_MAX_BODY_SIZE:-20M}
    restart: unless-stopped
    labels:
      - traefik.enable=true
      - 'traefik.http.routers.http-0-${W_APP:-pox}.rule=Host(`${W_APP:-pox}.${W_DOMAIN:-example.com}`) && PathPrefix(`/`)'
      - traefik.http.routers.http-0-${W_APP:-pox}.entryPoints=http
      # enable https
      - traefik.http.routers.http-0-${W_APP:-pox}.middlewares=gzip
      - traefik.http.services.http-0-${W_APP:-pox}.loadbalancer.server.port=8090
      - traefik.http.routers.http-0-${W_APP:-pox}.tls=true
      - traefik.http.routers.http-0-${W_APP:-pox}.tls.certresolver=letsencrypt
      - traefik.http.routers.http-0-${W_APP:-pox}.entryPoints=https
      - traefik.http.routers.http-0-${W_APP:-pox}.middlewares=redirect-to-https

# configs
# domain: https://<W_APP>.<W_DOMAIN>:80
```

