#!/bin/bash

# Database credentials
USER="utsav"
PASSWORD="utsav1234"
HOST="localhost"
DB_NAME="my_database"

# Backup directory
BACKUP_PATH='/var/backups/mysql/'
DATE=$(date +%F)

# Set default file permissions
umask 177

# Create backup directory if it does not exist
mkdir -p "$BACKUP_PATH"

# Dump database into SQL file
mysqldump --user="$USER" --password="$PASSWORD" --host="$HOST" "$DB_NAME" > "$BACKUP_PATH/$DB_NAME-$DATE.sql"

# Remove backups older than 7 days
find "$BACKUP_PATH" -type f -name "*.sql" -mtime +7 -exec rm {} \;
