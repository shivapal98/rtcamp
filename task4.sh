#!/bin/bash

# Get the site name from the user
read -p "Enter the site name (e.g. example.com): " site_name

# Check if the site name is provided
if [ -z "$site_name" ]; then
  echo "Error: Site name is not provided."
  exit 1
fi

# Check if the entry already exists
grep -q "$site_name" /etc/hosts
if [ $? -eq 0 ]; then
  echo "Error: Entry for $site_name already exists."
  exit 1
fi

# Add the entry to the /etc/hosts file
echo "127.0.0.1 $site_name" | sudo tee -a /etc/hosts

echo "Success: Entry for $site_name added to /etc/hosts."
