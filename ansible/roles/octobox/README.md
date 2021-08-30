# Description

This role configures [Octobox](https://github.com/octobox/octobox), an open-source GitHub notifications manager.

# Configuration

Octobox uses a PostgreSQL database for handing state of notifications for different users. While this data is useful it is not critical and can be mostly recovered from GitHub itself. For that reason no backup setup exists currently.

# Usage

Available at https://gh.status.im/ and authenticated via GitHub OAuth2.

# Management

Service is created and managed with Docker Compose:
```
admin@node-01.do-ams3.todo.misc:/docker/octobox % docker-compose ps
    Name                   Command              State           Ports         
------------------------------------------------------------------------------
octobox-app     bin/docker-start                Up      0.0.0.0:3000->3000/tcp
octobox-cache   redis-server                    Up      6379/tcp              
octobox-db      docker-entrypoint.sh postgres   Up      5432/tcp
```

# Details

For more details see:

* https://github.com/octobox/octobox/blob/master/docs/INSTALLATION.md
* https://raw.githubusercontent.com/octobox/octobox/master/docker-compose.yml
