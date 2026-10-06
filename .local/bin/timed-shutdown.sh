#!/bin/bash

TOTAL_TIME=300
TIMEOUT=$TOTAL_TIME

TIME_LEFT=$(date -d@$TIMEOUT -u +%M:%S)
NOTIFY_ID=$(notify-send -p -u critical "")

paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &
while [ $TIMEOUT -gt 0 ]; do
  TIME_LEFT=$(date -d@$TIMEOUT -u +%M:%S)

  ACTION=$(notify-send \
    -t 1000 -w -e \
    -u critical \
    -r "$NOTIFY_ID" \
    -A "cancel=Отмена" \
    -A "now=Выключить" \
    "Выключение через: $TIME_LEFT")

  case "$ACTION" in
  "cancel")
    notify-send -e "Выключение" "Выключение отменено."
    exit 0
    ;;
  "now") break ;;
  esac

  ((TIMEOUT--))
done

notify-send -t 3000 -e -w "Выключение" "Компьютер выключается..."
poweroff
