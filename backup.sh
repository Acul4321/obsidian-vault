#!/bin/bash

# Get the current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Define the commit message
COMMIT_MESSAGE="vault backup: $TIMESTAMP"

# Change to the folder containing the files
cd src/content || { echo "Failed to navigate to folder"; exit 1; }

# Add all files in the folder to Git
git add .

# Commit the changes with the timestamped message
git commit -m "$COMMIT_MESSAGE"

# Push the changes to the linked repository
git push

# Print a success message
echo "Backup completed and pushed with message: '$COMMIT_MESSAGE'"