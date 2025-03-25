#!/bin/bash

# Navigate to the script's directory (where main.py is located)
cd "$(dirname "$0")"

# Start the Dash server in the background
nohup python3 main.py > xrd_log.txt 2>&1 &

# Wait a few seconds to ensure the server starts
sleep 3

# Open the app in the default web browser (cross-platform)
if [[ "$OSTYPE" == "darwin"* ]]; then
    open http://127.0.0.1:8050       # macOS
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open http://127.0.0.1:8050   # Linux
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    start http://127.0.0.1:8050      # Windows
fi

# Keep the script running until the Dash app is closed
wait
