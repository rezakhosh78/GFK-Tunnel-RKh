#!/bin/bash
set -e
GFK_DIR="/opt/paqctl/gfk"
INSTALL_DIR="/opt/paqctl"
cd "$GFK_DIR"
"$INSTALL_DIR/venv/bin/python" mainclient.py &
PID1=$!
trap "kill $PID1 2>/dev/null; wait" EXIT INT TERM
wait
