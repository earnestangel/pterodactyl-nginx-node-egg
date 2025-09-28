#!/usr/bin/env bash
set -euo pipefail
trap 'echo -e "${YELLOW}[Startup] Error on line $LINENO${NC}"' ERR

# Color definitions
RED='\033[0;31m'
BLUE='\033[0;34m'; BOLD_BLUE='\033[1;34m'
WHITE='\033[0;37m'; GREEN='\033[0;32m'
YELLOW='\033[0;33m'; CYAN='\033[1;36m'
UNDERLINE='\033[4m'; NC='\033[0m'

# Header function
header() {
  echo -e "${BLUE}───────────────────────────────────────────────${NC}"
  echo -e "${BOLD_BLUE}$1${NC}"
}

# Configurable paths/files via env vars with defaults
NGINX_CONF="${NGINX_CONF:-/home/container/nginx/nginx.conf}"
NGINX_PREFIX="${NGINX_PREFIX:-/home/container}"

# Success message
echo -e "${GREEN}[Startup] Services successfully launched!${NC}"

# Brief pause
sleep 1

# Copyright footer
echo -e " "
echo -e "\033[0;34m───────────────────────────────────────────────\033[0m"
echo -e "\033[1;36m© 2023-2025 by Ym0T - Thanks to all contributors\033[0m"
echo -e "\033[1;36mNode support by Earnest Angel: \033[4;34mhttps://github.com/earnestangel/pterodactyl-nginx-node-egg\033[0m"
echo -e "\033[1;36mOriginal Script: \033[4;34mhttps://github.com/Ym0T\033[0m"
echo -e "\033[1;36mLicensed under the MIT License.\033[0m"
echo -e "\033[1;36mSee the LICENSE file for details.\033[0m"
echo -e "\033[0;34m───────────────────────────────────────────────\033[0m"

# Start NGINX
nginx -c "$NGINX_CONF" -p "$NGINX_PREFIX"
