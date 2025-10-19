#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="${SCRIPT_DIR}/.env"

if [[ -f "$ENV_FILE" ]]; then
    # shellcheck disable=SC1090
    source "$ENV_FILE"
else
    echo "Error: $ENV_FILE not found" >&2
    exit 1
fi

COMPOSE_SCRIPT="${PROJECT_ROOT}/compose-update.sh"
LOG_FILE="${PROJECT_ROOT}/compose-update.log"

cd "$PROJECT_ROOT"

docker compose pull
docker compose up -d --remove-orphans
docker image prune -f

echo "$(date '+%Y-%m-%d %H:%M:%S') – compose update completed" >> "$LOG_FILE"
