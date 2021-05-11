#!/bin/bash

DISCORD_WEBHOOK_URL=""

curl -X POST --data "{\"content\": \"$1\" }" --header "Content-Type:application/json" "$DISCORD_WEBHOOK_URL"