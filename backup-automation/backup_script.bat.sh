@echo off

REM Generate date structure
for /f "tokens=1-3 delims=/" %%a in ("%date%") do (
set year=%%c
set month=%%a
set day=%%b
)

set folder=%year%/%month%/%day%

REM Dump SQLite database
sqlite3 orders.db ".dump" > backup.sql

REM Compress backup
powershell Compress-Archive backup.sql backup.zip -Force

REM Upload to S3
aws s3 cp backup.zip s3://raheem-de-backup-datalake-2026/backups/postgres/%folder%/backup.zip

echo Backup uploaded successfully
