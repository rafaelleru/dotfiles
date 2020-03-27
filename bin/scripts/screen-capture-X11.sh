#!/bin/bash
IMG_NAME="/tmp/$(date).png"
scrot -s "$IMG_NAME"
xclip -selection clipboard -t image/png "$IMG_NAME"
