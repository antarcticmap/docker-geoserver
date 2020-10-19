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