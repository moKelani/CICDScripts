#!/bin/bash
PRODUCT_NAME=<YOUR_PRODUCT_NAME>
API_TOKEN=<YOUR_TESTFLIGHT_API_TOKEN>
TEAM_TOKEN=<YOUR_TESTFLIGHT_TEAM_TOKEN>
NOTIFY="True"
NOTES="Build uploaded via the upload API"

if [ "$1" ]
then
   NOTES="$1"
fi

if [ ! -f "${PRODUCT_NAME}.ipa" ]
then
   echo "${PRODUCT_NAME}.ipa not found!"
else
   echo "Uploading to TestFlight..."
   /usr/bin/curl "http://testflightapp.com/api/builds.json" \
        -F file=@"${PRODUCT_NAME}.ipa" \
	-F api_token="${API_TOKEN}" \
	-F team_token="${TEAM_TOKEN}" \
	-F notify="${NOTIFY}" \
	-F replace="True" \
	-F notes="${NOTES}"
   /usr/bin/open "https://testflightapp.com/dashboard/builds/"
fi