FROM node:16.15-alpine3.15 as builder

RUN apk update

COPY ./app /app

WORKDIR /app
RUN yarn install
RUN yarn run build

FROM node:16.15-alpine3.15 as product

RUN apk update

COPY --from=builder /app /app
WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["yarn", "run", "start"]