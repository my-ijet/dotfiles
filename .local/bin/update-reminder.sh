#!/bin/bash
ACTION=$(notify-send \
  -u critical \
  -A "update=Обновить" \
  "Время обновить систему")

if [ "$ACTION" = "update" ]; then
  kitty -e bash -c "yay -Syu; echo 'Нажмите для выхода...'; read -n 1"
fi
