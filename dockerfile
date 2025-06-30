# Stage 1
FROM alpine:latest AS build
RUN apk add --update hugo
WORKDIR /app
COPY . .
RUN hugo


# Stage 2
FROM nginx:1.25-alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/public .
EXPOSE 80/tcp
