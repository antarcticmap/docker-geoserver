FROM ubuntu:18.04

# COPY ./proxy.conf /etc/apt/apt.conf.d/proxy.conf

RUN apt-get update -y && apt-get install -y \
	#
	# Tools
	vim wget unzip \
    #
    # JDK for spark client
    openjdk-8-jre default-jre --no-install-recommends

ARG VERSION=2.18.0

# https://master.dl.sourceforge.net/project/geoserver/GeoServer/2.18.0/geoserver-2.18.0-bin.zip
# https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/geoserver-$VERSION-bin.zip

# 
# Geoserver
RUN mkdir /geoserver \
	&& wget -q -O geoserver.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/geoserver-$VERSION-bin.zip \
	&& unzip -d /geoserver geoserver.zip \
	&& rm geoserver.zip

#
# Style plugins
#

# CSS plugin
RUN wget -q -O css-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-css-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ css-plugin.zip \
	&& rm css-plugin.zip

#
# Format plugins
#

# GDAL
RUN wget -q -O gdal-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-gdal-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ gdal-plugin.zip \
	&& rm gdal-plugin.zip

# GRIB
RUN wget -q -O grib-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-grib-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ grib-plugin.zip \
	&& rm grib-plugin.zip

# Image Pyramid
RUN wget -q -O pyramid-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-pyramid-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ pyramid-plugin.zip \
	&& rm pyramid-plugin.zip

# JPG 2000 Image
RUN wget -q -O jp2k-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-jp2k-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ jp2k-plugin.zip \
	&& rm jp2k-plugin.zip

# NetCDF
RUN wget -q -O netcdf-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-netcdf-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ netcdf-plugin.zip \
	&& rm netcdf-plugin.zip

#
# Output formats
#
#
# Vectortiles
RUN wget -q -O vectortiles-plugin.zip https://master.dl.sourceforge.net/project/geoserver/GeoServer/$VERSION/extensions/geoserver-$VERSION-vectortiles-plugin.zip \
	&& unzip -o -d /geoserver/webapps/geoserver/WEB-INF/lib/ vectortiles-plugin.zip \
	&& rm vectortiles-plugin.zip

# CROS
COPY ./web.xml /geoserver/webapps/geoserver/WEB-INF/web.xml

WORKDIR /geoserver

EXPOSE 8080

CMD ["./bin/startup.sh"]
