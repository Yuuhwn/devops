#!/bin/bash
# watchdog.sh - web 컨테이너를 항상 원하는 개수(기본 3개)로 유지하는 감시 스크립트
#
# 사용법:  cd ~/devops/guestbook
#          ./watchdog.sh            # web=3, 10초마다 확인
#          ./watchdog.sh 3 5        # web=3, 5초마다 확인
#          nohup ./watchdog.sh > /dev/null 2>&1 &   # 백그라운드 실행
# 종료:    Ctrl+C (백그라운드라면 pkill -f watchdog.sh)

DESIRED=${1:-3}          # 원하는 상태: web 컨테이너 개수
INTERVAL=${2:-10}        # 확인 주기(초)
SERVICE=web
LOG=watchdog.log

cd "$(dirname "$0")" || exit 1     # compose.yaml이 있는 폴더에서 실행

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $*" | tee -a "$LOG"
}

log "감시 시작: $SERVICE=$DESIRED, ${INTERVAL}초마다 확인"

while true; do
  # 1) 현재 상태: 실행 중(running)인 web 컨테이너 개수
  running=$(docker compose ps --status running -q "$SERVICE" | wc -l)

  # 2) 원하는 상태와 다르면 맞춘다 (멈춘 것은 다시 시작, 지워진 것은 새로 생성)
  if [ "$running" -ne "$DESIRED" ]; then
    log "$SERVICE 실행 중 ${running}개 → ${DESIRED}개로 복구"
    docker compose up -d --no-recreate --scale "$SERVICE=$DESIRED" >/dev/null 2>&1
  fi

  # 3) 실행은 되지만 healthcheck가 unhealthy인 컨테이너는 재시작
  for id in $(docker compose ps -q "$SERVICE"); do
    health=$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{end}}' "$id")
    if [ "$health" = "unhealthy" ]; then
      log "${id:0:12} unhealthy → 재시작"
      docker restart "$id" >/dev/null
    fi
  done

  sleep "$INTERVAL"
done
