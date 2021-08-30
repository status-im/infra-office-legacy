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
admin@node-01.do-ams3.camunda.bi:/docker/keycloak % docker-compose ps
    Name                  Command               State                            Ports                          
----------------------------------------------------------------------------------------------------------------
keycloak-app   /opt/jboss/tools/docker-en ...   Up      0.0.0.0:8080->8080/tcp, 8443/tcp, 0.0.0.0:9990->9990/tcp
keycloak-db    docker-entrypoint.sh -p 5432     Up      0.0.0.0:5432->5432/tcp
```
