#!/bin/sh

brightnessctl | awk '/Current brightness:/ {gsub(/[()]/, "", $4); print $4}'
