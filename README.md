# Description

This repo configures infrastructure for cloud office services.

# Endpoints

| Description             | Address                       |
|-------------------------|-------------------------------|
| Keycloak Authentication | https://keycloak.status.im/   |
| NextCloud               | https://cloud.status.im/      |
| Gitea Git Frontend      | https://repos.status.im/      |
| HackMD Notes            | https://notes.status.im/      |
| Octobox GitHub Inbox    | https://gh.status.im/         |
| Wekan Kanban Board      | https://boards.status.im/     |
| URL Shortener           | https://link.status.im/       |
| URL Shortener Admin     | https://admin-link.status.im/ |

# Services

* [gitea](ansible/roles/gitea) - [Gitea](https://gitea.io/) Git Web Frontent
* [hackmd](ansible/roles/hackmd) - HackMD instance for our use
* [keycloak](ansible/roles/keycloak) - Identity and Access Management
* [nextcloud](ansible/roles/nextcloud) - Productivity platform
* [octobox](ansible/roles/octobox) - Octobox GitHub notifications helper
* [shlink](ansible/roles/shlink) - Shlink URL shortener service
* [wekan](ansible/roles/wekan) - Wekan board instance for task management

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/articles/infra_repo_usage.md) doc.
