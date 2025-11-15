#!/bin/bash

WEB_DIR="/var/www/html/"

if [ -f output.txt ]; then
    sudo cp output.txt "$WEB_DIR"
    echo "File published to web server."
    echo "URL: http://localhost/output.txt"
else
    echo "ERROR: output.txt not found."
    exit 1
fi
