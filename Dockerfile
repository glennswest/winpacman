
FROM stefanscherer/node-windows:10.2.0-nanoserver-1803
MAINTAINER Glenn West <gwest@redhat.com>

# copy nodejs to nanoserver
RUN mkdir \app
WORKDIR /app

COPY package.json /app/package.json
RUN npm install
COPY . /app
COPY public/ /app

EXPOSE 8080

CMD [ "npm.cmd", "start" ]
