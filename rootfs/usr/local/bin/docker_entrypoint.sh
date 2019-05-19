#!/bin/sh

set -o errexit          # Exit on most errors (see the manual)
#set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
#set -o pipefail         # Use last non-zero exit code in a pipeline
#set -o xtrace          # Trace the execution of the script (debug)


echo "Waiting for dump1090 to start up"
sleep 5s
ARGUMENTS=""
if [ -z "${INCONNECTS:-""}" ]; then
	echo "Using default feeders - dump1090"
	INCONNECTS="${DUMP1090_HOST:-dump1090}:${DUMP1090_PORT:-30005}:DUMP1090"
	ARGUMENTS="--inConnectID ${INCONNECTS}"
fi

if [ -z "${DUMP1090_LAT:-""}" ] || [ -z "${DUMP1090_LON:-""}" ]; then
	echo "Set your latitude and longitude variables to correctly display on map"
else
	LOCATION="${DUMP1090_LAT}:${DUMP1090_LON}"
	ARGUMENTS="${ARGUMENTS} --location ${LOCATION}"
fi

if [ -z "${GOOGLE_API:-""}" ]; then
	echo "Get a google API to use the maps properly"
else
	ARGUMENTS="${ARGUMENTS} --google-key ${GOOGLE_API}"
fi

exec /usr/local/bin/modesmixer2 \
  --web 8080 \
  ${ARGUMENTS} \
  ${@}