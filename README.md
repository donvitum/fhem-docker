# FHEM Installation based on Docker

## Contains containerized installs

- FHEM basic (based on DEBIAN 8 / Jessie)
- Homebridge (for Apple / Siri - based on DEBIAN 8 / Jessie)
- HA-Bridge (for Alexa etc. - based on DEBIAN 8 / Jessie)
- SmartVisu (NGINX Web Server, PHP5 - based on DEBIAN 8 / Jessie)
- mySQL-Logging (based on mysql57 Docker image)
- reverse proxy (based on Apache2 - based on DEBIAN 8 / Jessie)

## Requirements

- Docker
- Docker-Compose

## Install

```
git clone https://github.com/eszych/fhem-docker.git
cd fhem-docker
docker-compose up --build -d
```

## Defaults

- FHEM-WEB: 8083 (8084 and 8085 have been deleted)
- mySQL-User: fhemuser
- mySQL-Password: 2jRHnEi3WuNSQAcX7
- Homekit-Pairing-Code: 012-34-567
- HA-Bridge, SmartVisu, TabletUI are default installations - no customization

## Updating FHEM

Since each container has a volume mounted from the filesystem, updates are persistent
and backups are a bit easier - but also bigger...

## Future Plans

- Integrate Let's Encrypt for the reverse proxy 
- Integrate MQTT, Influx and Grafana

Suggestion etc. on how to do this are welcome!
