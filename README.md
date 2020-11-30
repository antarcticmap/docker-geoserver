# Docker geoserver

## Quickstart

### Requirements:

- Docker installed (install docker-compose if it is not included in your docker client)
- Clone this project to your workspace

### 1. Preparing data:

1. Unarchive the `geoserver_data.tar.gz` to `geoserver_data`

```bash
tar -xzvf ./geoserver_data.tar.gz
```

2. Download the `https://antarctic.freeyeti.net/data/download/antarctic.tar.bz2` (~458MB) and unarchive to `./geodata/antarctic`

```bash
mkdir ./geodata
cd ./geodata
wget https://antarctic.freeyeti.net/data/download/antarctic.tar.bz2
tar -jxvf ./antarctic.tar.bz2
```

### 2. To start GeoServer:

```bash
docker-compose pull
docker-compose up -d --no-build
```

### 3. Accessing:

- `http://127.0.0.1:8080`
- default username and password: `admin` / `geoserver`

## Data Source:

- Polar view: https://www.polarview.aq/antarctic
- LIMA: https://lima.usgs.gov/access.php
- REMA: https://www.pgc.umn.edu/data/rema/
- BAS: https://www.bas.ac.uk/

## To remove the container:

```bash
docker-compose down
```

## the `.env`

```bash
GEOSERVER_DATA_PATH=  # geoserver data dir, including workspaces, styles, etc.
DATA_PATH= # Mapping data
```

## Build

```bash
docker-compose build --no-cache
```

## Other usages

```bash
docker pull antarcticmap/geoserver:2.18.0
docker run --name geoserver -d -p 0.0.0.0:8080:8080 antarcticmap/geoserver:2.18.0
```
