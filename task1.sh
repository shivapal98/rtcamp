#!/bin/bash

# Check docker
if command -v docker > /dev/null; then
  echo "Docker is installed"
else
  echo "Docker is not installed"
fi

# Check Docker Compose
if command -v docker-compose >/dev/null 2>&1; then
  echo "Docker Compose is installed."
else
  echo "Docker Compose is not installed."
fi
