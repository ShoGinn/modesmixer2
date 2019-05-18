# modesmixer2
Docker container for ADS-B - This is the modesmixer2 component

This is part of a suite of applications that can be used if you have a dump1090 compatible device including:
* Any RTLSDR USB device
* Any network AVR or BEAST device
* Any serial AVR or BEAST device

Developer Webpage: http://xdeco.org/?page_id=48

# Container Requirements

This is a multi architecture build that supports arm (armhf/arm64) and amd64

# Container Setup

### Defaults
* Port 8080/tcp is exposed (web ui)



#### Example docker run

```
docker run -d \
--restart unless-stopped \
--name='modesmixer2' \
shoginn/modesmixer2:latest-amd64 \
--inConnectId dump1090:30005:DUMP1090 \
--inConnectId flightaware:30105:MLAT \
--location XXX:XXX \
--google-key XXXX
```
# Status
| branch | Status |
|--------|--------|
| master | [![Build Status](https://travis-ci.org/ShoGinn/modesmixer2.svg?branch=master)](https://travis-ci.org/ShoGinn/modesmixer2) |

| Arch | Size/Layers | Commit |
|------|-------------|--------|
[![](https://images.microbadger.com/badges/version/shoginn/modesmixer2:latest-arm.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/modesmixer2:latest-arm.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/modesmixer2:latest-arm.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/modesmixer2:latest-arm64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/modesmixer2:latest-arm64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/modesmixer2:latest-arm64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-arm64 "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shoginn/modesmixer2:latest-amd64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-amd64 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/shoginn/modesmixer2:latest-amd64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-amd64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/shoginn/modesmixer2:latest-amd64.svg)](https://microbadger.com/images/shoginn/modesmixer2:latest-amd64 "Get your own commit badge on microbadger.com")

