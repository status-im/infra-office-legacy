# Description

This repo configures infrastructure for cloud office services.

# Endpoints

| Description              | Address                           |
|--------------------------|-----------------------------------|
| Gitea Git Frontend       | https://repos.status.im/          |
| HackMD Notes             | https://notes.status.im/          |
| Octobox GitHub Inbox     | https://gh.status.im/             |
| URL Shortener            | https://link.status.im/           |
| URL Shortener Admin      | https://admin-link.status.im/     |

# Services

* [daybyday-crm](ansible/roles/daybyday-crm) - [DayByDayCRM](https://github.com/Bottelet/DaybydayCRM) platform
* [gitea](ansible/roles/gitea) - [Gitea](https://gitea.io/) Git Web Frontent
* [hackmd](ansible/roles/hackmd) - HackMD instance for our use
* [octobox](ansible/roles/octobox) - Octobox GitHub notifications helper
* [shlink](ansible/roles/shlink) - Shlink URL shortener service

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/ansible_terraform.md) doc.
