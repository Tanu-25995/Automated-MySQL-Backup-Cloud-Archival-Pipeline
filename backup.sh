#!/bin/bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DB_NAME="backup_demo"
BACKUP_DIR="/home/tanuja/mysql-backup-project/backups"
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql.gz"
mysqldump --no-tablespaces "$DB_NAME" | gzip > "$BACKUP_FILE"
echo "Backup completed: $BACKUP_FILE"
/home/tanuja/mysql-backup-project/aws-venv/bin/aws s3 cp "$BACKUP_FILE" s3://tanuja-mysql-backups-2026/
