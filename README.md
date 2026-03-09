# Cost-Efficient Backup & Serverless Data Lake on AWS

This project demonstrates a cost-efficient data engineering solution for automated database backups and analytics using AWS serverless services.

The solution ensures minimal AWS cost while supporting reliable backups and analytics queries.

---

## Architecture Overview

Local Database → Backup Script → Amazon S3 (Backup Storage)

Local CSV Dataset → Amazon S3 Data Lake → Amazon Athena Query Engine

---

## Technologies Used

- AWS S3
- Amazon Athena
- AWS CLI
- SQLite (local database simulation)
- Bash / Batch scripting
- Partitioned Data Lake design

---

## Part 1 – Cost Analysis

Two backup strategies were evaluated:

1. Daily Full Backups
2. Weekly Full + Incremental Backups

The incremental strategy was recommended due to lower storage cost and faster recovery options.

---

## Part 2 – Backup Automation

A script automates the database backup workflow:

1. Dump local SQLite database
2. Compress backup file
3. Upload backup to S3
4. Store backups using date-based structure
5. Apply retention logic

Example S3 backup structure:

s3://bucket/backups/postgres/YYYY/MM/DD/backup.zip

---

## Part 3 – Data Lake Design

Sample data is stored in Amazon S3 using partitioned folders:

s3://bucket/datalake/orders/year=2026/month=03/day=09/orders.csv

This structure enables efficient queries using Amazon Athena.

Example query:

SELECT *
FROM orders
WHERE year='2026'
AND month='03'
AND day='09';

Partition filters ensure minimal data scanning.

---

## Cost Control

Only low-cost AWS services were used:

- Amazon S3
- Amazon Athena
- AWS CLI

All resources were deleted after execution to guarantee zero AWS cost.

---

## Deliverables

- Cost analysis documentation
- Backup automation script
- Data lake implementation
- Athena query demonstration
- Cleanup proof and AWS billing confirmation
