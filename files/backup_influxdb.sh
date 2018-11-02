#!/usr/bin/env bash

set -x

AWS_PROFILE=$1
S3_BUCKET=$2
BACKUP_DIR=/tmp/influx_backup
BACKUP_FILE=/tmp/influx_backup.tar.gz

mkdir -p $BACKUP_DIR
rm $BACKUP_DIR/*

influxd backup -database home_assistant $BACKUP_DIR
rm $BACKUP_FILE || true
tar -zcvf $BACKUP_FILE $BACKUP_DIR

aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/`date "+%G/%m/%d"`/ --profile $AWS_PROFILE
echo 'Done backing up influx to S3'

