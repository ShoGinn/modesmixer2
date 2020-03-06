# modesmixer2

Docker container for ADS-B - This is the modesmixer2 component

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:

* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

Developer Webpage: [Xdeco.org](http://xdeco.org/?page_id=48)

## Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

## Container Setup

### Defaults

* DUMP1090_SERVER=dump1090 -- make sure your dump1090 container is named this and on the same network
* DUMP1090_PORT=30005 -- default port

* Port 8080/tcp is exposed (web ui)

### User Configured

This is for the google maps

* DUMP1090_LAT - Decimal format latitude of your ADSB Antenna
* DUMP1090_LON - Decimal format longitude of your ADSB Antenna

#### Example docker run

```bash
docker run -d \
--restart unless-stopped \
--name='modesmixer2' \
shoginn/modesmixer2:latest \
--inConnectId dump1090:30005:DUMP1090 \
--inConnectId flightaware:30105:MLAT \
--location XXX:XXX \
--google-key XXXX
```

## Status

| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.org/ShoGinn/modesmixer2.svg?branch=master)](https://travis-ci.org/ShoGinn/modesmixer2) |
