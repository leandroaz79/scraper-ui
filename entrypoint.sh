#!/bin/sh
nginx
exec /app/app -web -addr :8081 -data-folder /gmapsdata
