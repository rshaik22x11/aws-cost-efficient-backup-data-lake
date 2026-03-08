\# Backup Automation



\## Overview



This script demonstrates an automated backup workflow for a local SQLite database and uploads the compressed backup to Amazon S3.



\## Backup Process



1\. The SQLite database (`orders.db`) is dumped using the SQLite dump command.

2\. The dump file is compressed into a ZIP archive.

3\. The backup is uploaded to Amazon S3 using AWS CLI.

4\. Backups are stored in date-based folders.



Example structure:



s3://bucket/backups/postgres/YYYY/MM/DD/backup.zip



\## Retention Policy



A retention step is included in the script using AWS CLI commands to identify old backup files.  

This can be used to remove backups older than the defined retention period.



\## Cost Considerations



The solution is designed to avoid AWS costs by:



\- Using only Amazon S3 for storage

\- Keeping total stored data under 100 MB

\- Using AWS CLI instead of compute services

\- Running database operations locally

