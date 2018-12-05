FROM glennswest/node-windows:10.14.0-windowsservercore-ltsc2019
MAINTAINER Glenn West <gwest@redhat.com>

# copy nodejs to nanoserver
RUN mkdir c:/app
WORKDIR c:/app
COPY package.json c:/app/package.json
RUN npm install
COPY . /app
COPY public/ /app

EXPOSE 8080

CMD [ "npm.cmd", "start" ]
