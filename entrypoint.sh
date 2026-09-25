#!/bin/sh
nginx
exec google-maps-scraper -web -addr :8081 -data-folder /gmapsdata
