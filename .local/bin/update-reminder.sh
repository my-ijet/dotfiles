#!/bin/bash

ACTION=$(notify-send \
  -u critical \
  -A "update=Обновить" \
  "Время обновить систему")

if [ "$ACTION" = "update" ]; then
  kitty -e bash -c 'yay -Syu; echo
                   echo "Нажмите любую кнопку для выхода,[r] для перезагрузки..."
                   read -n 1 -r KEY
                   if [ "$KEY" = "r" ] || [ "$KEY" = "R" ]; then reboot; fi'
fi
