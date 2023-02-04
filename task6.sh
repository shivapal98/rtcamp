#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <site_name>"
  exit 1
fi

site_name=$1

# Stop and remove the containers
docker stop $(docker ps -a -f name=$site_name -q)
docker rm $(docker ps -a -f name=$site_name -q)

# Remove the local files
rm -rf $site_name

echo "Site $site_name deleted successfully."
