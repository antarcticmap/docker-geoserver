# Docker geoserver

## Quick start

```
docker pull antarcticmap/geoserver:2.18.0
docker run --name geoserver -d -p 0.0.0.0:8080:8080 antarcticmap/geoserver:2.18.0
```

Address: `http://127.0.0.1:8080`
Username/Password: `admin` / `geoserver`

To remove the contianer:
```bash
docker stop geoserver
docker rm geoserver
```

## the `.env`

```bash
GEOSERVER_DATA_PATH=  # geoserver data dir
DATA_PATH= # other data, if you need
```

## Build

```bash
docker-compose build --no-cache
```

## Start the GeoServer

```bash
docker-compose up -d
```

## Access

* `http://127.0.0.1:8080`
* default username and password: `admin` / `geoserver`