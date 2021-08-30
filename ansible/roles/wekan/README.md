# Description

This role configures [Wekan](https://wekan.github.io/) open-source kanban for Status.im.

# Usage

Available at: https://boards.status.im/

We used to use Google OAuth but it had to be made available to external contirbutors.

# Configuration

The bare minimum includes:
```yaml
wekan_domain: 'wekan.example.org'
wekan_smtp_port: 587
wekan_smtp_host: 'smtp.example.org'
wekan_smtp_user: 'smtp-secret-user'
wekan_smtp_pass: 'smtp-secret-pass'
wekan_smtp_from: 'Wekan Board <wekan@example.im>'
```
There is also optional OAuth config.

# Backups

Backups are done via a [systemd timer](https://www.freedesktop.org/software/systemd/man/systemd.timer.html) and [`mongodump`](https://docs.mongodb.com/manual/reference/program/mongodump/):
```
 > sudo systemctl list-timers '*wekan*.timer'
NEXT                         LEFT     LAST PASSED UNIT                  ACTIVATES
Wed 2020-04-01 00:00:00 UTC  11h left n/a  n/a    backup-wekan-db.timer backup-wekan-db.service
Wed 2020-04-01 00:00:00 UTC  11h left n/a  n/a    dump-wekan-db.timer   dump-wekan-db.service
```
The backup jobs can be run by hand:
```
 > sudo systemctl start dump-wekan-db.service
 > sudo journalctl -f -o cat -u dump-wekan-db.service
2021-03-04T19:19:36.429+0000	writing wekan.orgUser to
2021-03-04T19:19:36.436+0000	done dumping wekan.orgUser (0 documents)
2021-03-04T19:19:36.437+0000	writing wekan.meteor_oauth_pendingCredentials to
2021-03-04T19:19:36.438+0000	done dumping wekan.org (0 documents)
2021-03-04T19:19:36.438+0000	writing wekan.meteor_accounts_loginServiceConfiguration to
2021-03-04T19:19:36.441+0000	done dumping wekan.meteor_accounts_loginServiceConfiguration (0 documents)
2021-03-04T19:19:36.441+0000	done dumping wekan.meteor_oauth_pendingCredentials (0 documents)
2021-03-04T19:19:36.611+0000	done dumping wekan.cfs_gridfs.attachments.chunks (454 documents)
dump-wekan-db.service: Succeeded.
Finished MondoDB backup script.
```
The dumps end up in `
```
 > ls -l /docker/wekan-db/backup/wekan | head -n5
total 211588
-rw-r--r-- 1 dockremap dockremap       155 Mar  4 19:19 AccountsLockout.Connections.bson
-rw-r--r-- 1 dockremap dockremap       105 Mar  4 19:19 AccountsLockout.Connections.metadata.json
-rw-r--r-- 1 dockremap dockremap       314 Mar  4 19:19 accountSettings.bson
-rw-r--r-- 1 dockremap dockremap       177 Mar  4 19:19 accountSettings.metadata.json
```
Afterwards [Restic](https://github.com/status-im/infra-role-restic-backups) is responsible for archiving those.
