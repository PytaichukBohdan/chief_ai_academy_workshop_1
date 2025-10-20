#!/bin/bash

# Get the script's directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Check if .env exists in project root
if [ ! -f "$PROJECT_ROOT/.env" ]; then
    if [ -f "$PROJECT_ROOT/.env.sample" ]; then
        echo ".env not found. Copying from .env.sample..."
        cp "$PROJECT_ROOT/.env.sample" "$PROJECT_ROOT/.env"
        echo "Created $PROJECT_ROOT/.env from .env.sample"
        echo "Please edit .env and add your API keys"
    else
        echo "Error: Neither .env nor .env.sample exists in project root"
        exit 1
    fi
fi

# Copy .env to server directory
cp "$PROJECT_ROOT/.env" "$PROJECT_ROOT/app/server/.env"

echo "Successfully copied .env to app/server/.env"