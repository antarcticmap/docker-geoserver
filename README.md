# Docker geoserver

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