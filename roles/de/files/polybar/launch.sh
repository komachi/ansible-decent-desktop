#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [[ $(polybar --list-monitors | wc -l) == "1" ]]; then
  MONITOR=$(polybar --list-monitors | head -1 | cut -d":" -f1) polybar full &
else
  for m in $(polybar --list-monitors | grep -v primary | cut -d":" -f1); do
    MONITOR=$m polybar full &
  done

  MONITOR=$(polybar --list-monitors | grep primary | cut -d":" -f1 | head -1) polybar partial &
fi