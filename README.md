# ansible-ha-influxdb-backup

This ansible role creates an influxdb snapshot, compresses it, and backs it up to AWS S3 on a schedule.

## Requirements

You need to have an AWS account configures with credentials.

## Role Variables

- `influxdb_backup_aws_profile`
  - The AWS profile configured with permissions to write to S3.
  - This is configured via the [`ha-influxdb`](https://github.com/mpataki/ansible-ha-influxdb) role.
- `influxdb_backup_s3_bucket`
  - The name of the S3 bucket where you'd like your backups to be saved

## Dependencies

You first need to sign up for DuckDNS and obtain a token.

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
