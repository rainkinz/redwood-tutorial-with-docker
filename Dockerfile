#
# Base
#
FROM node:18 as base

RUN yarn cache clean

RUN mkdir /app
WORKDIR /app

COPY package*.json .

COPY yarn.lock .
COPY .yarn .yarn
COPY .yarnrc.yml .yarnrc.yml

COPY ./api/package*.json ./api/
COPY ./web/package*.json ./web/

RUN yarn install

COPY . .

#
# Build
#
FROM base as api-build

ENTRYPOINT [ "/bin/sh", "-c", "yarn rw build api" ]

FROM base as web-build

ENTRYPOINT [ "/bin/sh", "-c", "yarn rw build web" ]

#
# Test
#
FROM base as test

ENTRYPOINT [ "/bin/sh", "-c", "yarn rw test --no-watch" ]

#
# Serve
#
FROM base as api-serve

CMD yarn rw build api && yarn rw serve api


#
# Serve
#
FROM base as web-serve

ENV API_HOST http://api-serve:8911

CMD yarn rw build web && yarn rw serve web --apiHost ${API_HOST}
