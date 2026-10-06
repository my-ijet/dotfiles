#!/bin/zsh

TOTAL_TIME=300
TIMEOUT=$TOTAL_TIME

TIME_LEFT=$(date -d@$TIMEOUT -u +%M:%S)
NOTIFY_ID=$(notify-send -p -u critical "")

do_shutdown() {
  notify-send -t 3000 -e -w -u critical \
    "Компьютер выключается..." \
    2>/dev/null
  #poweroff
}

cleanup() {
  pkill -P "$ALARM_PID" 2>/dev/null 2>&1
  kill "$ALARM_PID" 2>/dev/null 2>&1
  exit 0
}
trap cleanup SIGINT SIGTERM EXIT

play_alarm() {
  local audio_path="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

  if [[ ! -f "$audio_path" ]]; then return 1; fi

  while true; do
    paplay "$audio_path" 2>/dev/null
    # sleep 1
  done
}

# Run endlessly
play_alarm &
ALARM_PID=$!

until ((TIMEOUT <= 0)); do
  TIME_LEFT=$(date -d@$TIMEOUT -u +%M:%S)

  ACTION=$(
    notify-send \
      -t 1000 -w -e \
      -u critical \
      -r "$NOTIFY_ID" \
      -A "cancel=Отмена" \
      -A "now=Выключить" \
      "Выключение через: $TIME_LEFT" \
      2>/dev/null
  )

  case "$ACTION" in
  "cancel")
    notify-send -e "Выключение отменено."
    exit 0
    ;;
  "now")
    do_shutdown
    break
    ;;
  esac

  ((TIMEOUT--))
done

#do_shutdown
