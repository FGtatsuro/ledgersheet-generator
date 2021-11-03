FROM node:latest

RUN mkdir -p /workdir/src /workdir/dist
COPY package.json package-lock.json /workdir
COPY .stylelintrc.json /workdir
COPY ./src /workdir/src

WORKDIR /workdir
RUN npm install

ENTRYPOINT ["npx"]
