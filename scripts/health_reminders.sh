#!/bin/bash

# Health Reminder Script for i3
# This script runs three independent, looping reminders in the background.

# --- CONFIGURATION ---
# Intervals are in seconds.
EYE_REST_INTERVAL=1200
WATER_INTERVAL=1800
FRUIT_INTERVAL=7200

# --- REMINDERS ---

# 1. Eye Rest Reminder (20-20-20 Rule)
(
  while true; do
    sleep "$EYE_REST_INTERVAL"
    notify-send -u normal -i "face-wink" "👀 Time to Rest!" "Look at something 20 feet (6 meters) away and/or walk around for 20 seconds."
  done
) &

# 2. Drink Water Reminder
(
  while true; do
    sleep "$WATER_INTERVAL"
    notify-send -u normal -i "dialog-information" "💧 Time to Hydrate!" "Have a glass of water to stay sharp."
  done
) &

# 3. Eat Fruit / Healthy Snack Reminder
(
  while true; do
    sleep "$FRUIT_INTERVAL"
    notify-send -u low -i "emblem-favorite" "🍎 Healthy Snack Time!" "Grab a piece of fruit or another healthy snack."
  done
) &

echo "Health reminders started."
