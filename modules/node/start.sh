#!/usr/bin/env bash
set -euo pipefail
trap 'echo -e "${RED}[Node] Error on line $LINENO${NC}"' ERR

# Color definitions
BLUE='\033[0;34m'; BOLD_BLUE='\033[1;34m'
WHITE='\033[0;37m'; GREEN='\033[0;32m'
YELLOW='\033[0;33m'; RED='\033[0;31m'
NC='\033[0m'

# header function
header() {
  echo -e "${BLUE}───────────────────────────────────────────────${NC}"
  echo -e "${BOLD_BLUE}[Node] $1${NC}"
}

# configurations
NPM_START_CMD="${NPM_START_CMD:-}"

# create and set .npm path
mkdir -p /home/container/.npm
export NPM_CONFIG_CACHE="/home/container/.npm"

# set default node port
export PORT="${NODE_PORT:-}"

# start header
header "Starting Node module"
cd /home/container/node
$NPM_START_CMD