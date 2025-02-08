#!/bin/bash

# Script name: deploy.sh

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Get current git commit hash for archive name
COMMIT_HASH=$(git rev-parse --short HEAD)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create archives directory if it doesn't exist
mkdir -p archives

# Archive existing public directory if it exists
if [ -d "public" ]; then
    echo "Archiving existing public directory..."
    tar -czf "archives/public_${TIMESTAMP}_${COMMIT_HASH}.tar.gz" public/
fi

# Build new site
echo "Building Hugo site..."
hugo --minify

# Deploy to server
echo "Deploying to server..."
rsync -avz --delete public/ dukerupert@mirandashift.com:/var/www/aestusguides/

echo "Deployment complete!"
