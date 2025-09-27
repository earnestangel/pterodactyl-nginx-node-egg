# NGINX Startup Script

This script initializes PHP-FPM and NGINX for the container in a robust and configurable way.

## Features

- Starts NGINX with configurable config (`NGINX_CONF`) and prefix (`NGINX_PREFIX`)
- Colorized, structured output for readability
- Robust execution with `set -euo pipefail` and error trapping
- Fully configurable via environment variables

## Configuration

| Env Variable      | Default                              | Description                                  |
|-------------------|--------------------------------------|----------------------------------------------|
| `NGINX_CONF`      | `/home/container/nginx/nginx.conf`   | Path to the NGINX config file                |
| `NGINX_PREFIX`    | `/home/container`                    | Directory prefix for NGINX (`-p` flag)      |

## Script Details

- Uses strict shell flags and a trap for error reporting.
- Color codes and header functions improve readability and maintainability.