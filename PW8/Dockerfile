FROM nginx as builder
ARG BUILD_ID
LABEL stage=builder
LABEL build=$BUILD_ID

FROM nginx:latest

COPY ./index.html /usr/share/nginx/html/index.html