#!/bin/bash

# monitor.sh - Скрипт мониторинга ресурсов
# Записывает в monitor.log состояние системы с интервалом N секунд

set -e

N=5
LOG_FILE="monitor.log"

# Проверка наличия необходимых команд
for cmd in free df uptime date; do
    if ! command -v $cmd &> /dev/null; then
        echo "Ошибка: команда $cmd не найдена" >&2
        exit 1
    fi
done

log_resources() {
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
    echo "--- free -h ---"
    free -h
    echo "--- df -h ---"
    df -h
    echo "--- uptime ---"
    uptime
    echo ""
}

trap 'echo "Мониторинг остановлен"; exit 0' INT TERM

echo "Запуск мониторинга. PID: $$"
echo "Лог записывается в $LOG_FILE"
echo "Для остановки нажмите Ctrl+C"

while true; do
    log_resources >> "$LOG_FILE"
    sleep $N
done
EOF
