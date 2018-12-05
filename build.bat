@echo off

echo Building docker image...
docker build -t glennswest/winpacman:2019 .
docker push glennswest/winpacman:2019


echo Done.
