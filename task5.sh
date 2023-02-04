#!/bin/bash

# Check the status code of example.com
status_code=$(curl -s -o /dev/null -w "%{http_code}" example.com)

# Check if the status code is 200 (OK)
if [ "$status_code" -eq 200 ]; then
  # Prompt the user to open the website in their browser
  read -p "example.com is up and healthy, would you like to open it in your browser now? [y/n] " response
  if [ "$response" == "y" ]; then
    xdg-open "http://example.com"
  fi
else
  # Show an error message if the status code is not 200
  echo "example.com is not reachable, status code: $status_code"
fi