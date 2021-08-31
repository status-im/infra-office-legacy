# Description

This role deploys [Keycloak](https://www.keycloak.org/), an Open Source Identity and access management platform.

It provides a Single-Sign On functionality for multiple services including Google or GitHub. For more details see the [About](https://www.keycloak.org/about) page.

# Configuration

```yaml
keycloak_domain: 'keycloak.example.org'
keycloak_admin_username: 'admin'
keycloak_admin_password: 'super-secret-admin-password'
keycloak_log_level: 'WARN'
```

# Management

The service is managed using Docker Compose:
```
admin@node-01.do-ams3.keycloak.office:/docker/keycloak % docker-compose ps
    Name                  Command               State                            Ports                          
----------------------------------------------------------------------------------------------------------------
keycloak-app   /opt/jboss/tools/docker-en ...   Up      0.0.0.0:8080->8080/tcp, 8443/tcp, 0.0.0.0:9990->9990/tcp
keycloak-db    docker-entrypoint.sh -p 5432     Up      0.0.0.0:5432->5432/tcp
```

# Backups

A systemd timer runs daily a script that uses `pg_dump` to save the database:
```
admin@node-01.do-ams3.keycloak.office:~ % sudo systemctl status dump-keycloak-db
● dump-keycloak-db.service - Dump Keycloak PostgreSQL database.
     Loaded: loaded (/etc/systemd/system/dump-keycloak-db.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Tue 2021-08-31 09:45:01 UTC; 1min 24s ago
TriggeredBy: ● dump-keycloak-db.timer
       Docs: https://github.com/status-im/infra-role-systemd-timer
   Main PID: 189995 (code=exited, status=0/SUCCESS)

Aug 31 09:44:59 node-01.do-ams3.keycloak.office systemd[1]: Starting Dump Keycloak PostgreSQL database....
Aug 31 09:45:01 node-01.do-ams3.keycloak.office systemd[1]: dump-keycloak-db.service: Succeeded.
Aug 31 09:45:01 node-01.do-ams3.keycloak.office systemd[1]: Finished Dump Keycloak PostgreSQL database..
```
