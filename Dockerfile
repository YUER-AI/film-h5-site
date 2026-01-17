FROM node:22 AS builder
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build

FROM nginx

COPY --from=builder /app/dist /usr/share/nginx/html
