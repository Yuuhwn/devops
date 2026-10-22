#!/bin/bash
# watchdog.sh - checks the number of web containers and keeps it at 3
# usage: ./watchdog.sh          (3 web, check every 10 sec)
#        ./watchdog.sh 3 5      (3 web, check every 5 sec)
# stop:  pkill -f watchdog.sh

DESIRED=${1:-3}       # how many web to keep
INTERVAL=${2:-10}     # check every N seconds
LOG=watchdog.log

cd "$(dirname "$0")" || exit 1     # go to the folder with compose.yaml

echo "$(date '+%Y-%m-%d %H:%M:%S') start: web=$DESIRED, check every ${INTERVAL}s" >> "$LOG"

for i in $(seq 1 100000); do
  # 1) count running web containers
  running=$(docker compose ps web | grep -c "guestbook-web")

  # 2) if it is not 3, make it 3 again
  if [ "$running" -ne "$DESIRED" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') web running: $running -> back to $DESIRED" >> "$LOG"
    docker compose up -d --scale web=$DESIRED > /dev/null 2>&1
  fi

  # 3) restart web that is unhealthy
  for n in $(seq 1 $DESIRED); do
    health=$(docker inspect --format '{{.State.Health.Status}}' guestbook-web-$n 2>/dev/null)
    if [ "$health" = "unhealthy" ]; then
      echo "$(date '+%Y-%m-%d %H:%M:%S') guestbook-web-$n unhealthy -> restart" >> "$LOG"
      docker restart guestbook-web-$n > /dev/null
    fi
  done

  sleep "$INTERVAL"
done
