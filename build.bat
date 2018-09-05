@echo off


echo Building docker image...
docker build -t glennswest/winpacman:1803 - < Dockerfile.1803
docker push glennswest/winpacman:latest


echo Done.
