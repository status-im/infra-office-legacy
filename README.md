# Description

This repo configures infrastructure for cloud office services.

# Endpoints

| Description             | Address                     |
|-------------------------|-----------------------------|
| Keycloak Authentication | https://keycloak.status.im/ |
| NextCloud               | https://cloud.status.im/    |

# Services

* [keycloak](./ansible/roles/keycloak) - Identity and Access Management
* [nextcloud](ansible/roles/nextcloud) - Productivity platform

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/articles/infra_repo_usage.md) doc.
