#!/bin/bash

# Get the site name from the command line argument
site_name=$1

# Check if the site name is provided
if [ -z "$site_name" ]; then
  echo "Please provide the site name as a command-line argument."
  exit 1
fi

# Download the latest version of WordPress
curl -O https://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz

# Create the WordPress directory
mkdir $site_name
mv wordpress/* $site_name/
rm -rf wordpress latest.tar.gz

# Configure the WordPress site
cd $site_name
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$site_name/g" wp-config.php
sed -i "s/username_here/$DB_USER/g" wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
sed -i "s/localhost/$DB_HOST/g" wp-config.php

echo "WordPress site $site_name is now ready to use."
