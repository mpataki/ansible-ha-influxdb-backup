# ansible-ha-influxdb-backup

[![Build Status](https://travis-ci.org/mpataki/ansible-ha-influxdb-backup.svg?branch=master)](https://travis-ci.org/mpataki/ansible-ha-influxdb-backup)

This ansible role creates an influxdb snapshot, compresses it, and backs it up to AWS S3 on a schedule.

## Requirements

Really this should work on any debian based system, but has been tested on a Raspberry Pi running Hassbian.

## Role Variables

- `influxdb_backup_aws_profile`
  - The AWS profile configured with permissions to write to S3.
  - This is configured via the [`ha-influxdb`](https://github.com/mpataki/ansible-ha-influxdb) role.
- `influxdb_backup_s3_bucket`
  - The name of the S3 bucket where you'd like your backups to be saved

## Dependencies

- [ha-influxdb](https://github.com/mpataki/ansible-ha-influxdb)
- [ha-aws](https://github.com/mpataki/ansible-ha-aws)

These can be obtain via git or ansible galaxy.

## Example Playbook

```yml
    - hosts: pi
      vars:
        influxdb_backup_aws_profile: <your-aws-profile>
        influxdb_backup_s3_bucket: <your-s3-bucket>
      roles:
         - role: mpataki.ha-influxdb-backup
```

## License

MIT
