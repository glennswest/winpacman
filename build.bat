@echo off

docker login hybrid.azurecr.io -u hybrid -p gw35L0FqSowSM25QFY3WdIcUJ+PZCOAR

echo Downloading node.msi...
@powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri "https://nodejs.org/dist/v6.9.1/node-v6.9.1-x64.msi" -OutFile "./node.msi"

echo Extracting node.msi...
msiexec /a node.msi /qn TARGETDIR="%CD%\nodejs"

echo Building docker image...
docker build -t glennswest/winpacman:latest .
docker push glennswest/winpacman:latest


echo Done.
