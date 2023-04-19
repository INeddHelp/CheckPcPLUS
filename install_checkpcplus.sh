#!/bin/bash

BIN_DIR="/usr/local/bin"

if [ ! -d "$BIN_DIR" ]; then
  if ! sudo mkdir -p "$BIN_DIR"; then
    echo "Error: Failed to create directory $BIN_DIR"
    exit 1
  fi
fi

if ! sudo cp main.rb checkpcplus "$BIN_DIR"; then
  echo "Error: Failed to copy files to $BIN_DIR"
  exit 1
fi

if ! sudo chmod +x "$BIN_DIR/checkpcplus"; then
  echo "Error: Failed to set executable permission for $BIN_DIR/checkpcplus"
  exit 1
fi

echo "CheckPC Plus installed successfully!"
