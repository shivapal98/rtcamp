#!/bin/bash

# Check for command-line argument
if [ $# -eq 0 ]
  then
    echo "Please provide the site name as a command-line argument."
    exit 1
fi

# Set site name
SITE_NAME=$1

# Download latest WordPress version
curl -O https://wordpress.org/latest.tar.gz

# Extract WordPress files
tar xzf latest.tar.gz

# Copy WordPress files to a new directory for the site
cp -r wordpress $SITE_NAME

# Remove the downloaded WordPress archive
rm latest.tar.gz

# Change to the new site directory
cd $SITE_NAME

# Create a wp-config.php file
cp wp-config-sample.php wp-config.php

# Modify database information in the wp-config.php file
sed -i 's/database_name_here/'"$SITE_NAME"'/g' wp-config.php
sed -i 's/username_here/'"$SITE_NAME"'/g' wp-config.php
sed -i 's/password_here/'"$SITE_NAME"'/g' wp-config.php

echo "WordPress site created successfully! Visit http://localhost/$SITE_NAME to access the site."
