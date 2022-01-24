# Description

This role configures [DayByDayCRM](https://github.com/Bottelet/DaybydayCRM) - an open-source customer relationship management platform.

# Configuration

The most basic config looks like this:
```yaml
daybyday_crm_domain: 'crm.example.org'
# Main admin user
daybyday_crm_admin_user_name: 'admin'
daybyday_crm_admin_user_pass: 'super-secret-password'
daybyday_crm_admin_user_email: 'admin@example.org'
```

# Management

All containers are created and managed using [Docker Compose](https://docs.docker.com/compose/):
```
 > docker-compose ps
       Name                      Command                       State                                 Ports                      
--------------------------------------------------------------------------------------------------------------------------------
daybyday-crm-app      docker-php-entrypoint php- ...   Up (healthy)            433/tcp, 80/tcp, 0.0.0.0:9000->9000/tcp          
daybyday-crm-cache    redis-server                     Up (healthy)            0.0.0.0:6379->6379/tcp                           
daybyday-crm-chrome   /usr/local/bin/supervisord ...   Up (health: starting)   4444/tcp, 0.0.0.0:9515->9515/tcp                 
daybyday-crm-db       docker-entrypoint.sh mysqld      Up (healthy)            0.0.0.0:3306->3306/tcp, 33060/tcp                
daybyday-crm-es       /usr/local/bin/docker-entr ...   Up (healthy)            0.0.0.0:9200->9200/tcp, 9300/tcp                 
daybyday-crm-proxy    docker-php-entrypoint ngin ...   Up (healthy)            433/tcp, 80/tcp, 9000/tcp, 0.0.0.0:9080->9080/tcp
```

# Details

The Docker image is build from our own [`Dockerfile`](./files/Dockerfile) with some fixes and a patch for protocol issues and pushed to our Docker Hub repository:

https://hub.docker.com/r/statusteam/daybyday-crm

Original issue: https://github.com/status-im/infra-office/issues/8
