#!/bin/bash

# monitor.sh - Скрипт мониторинга ресурсов
N=5

log_resources() {
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
    free -h
    df -h
    uptime
    echo ""
}

while true; do
    log_resources >> monitor.log
    sleep $N
done
EOF
