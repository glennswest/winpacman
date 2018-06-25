
FROM stefanscherer/node-windows:8-nanoserver
MAINTAINER Glenn West <gwest@redhat.com>

# copy nodejs to nanoserver
RUN mkdir \app
WORKDIR /app

COPY public/ /app/public
COPY package.json /app/package.json
RUN npm install
COPY index.js /app/index.js

EXPOSE 80

CMD [ "npm.cmd", "start" ]
