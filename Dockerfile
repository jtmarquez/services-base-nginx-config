FROM nginx:latest
COPY ./nginx/server.conf /etc/nginx/conf.d/server.conf
#COPY ./nginx/certificates.conf /etc/nginx/certs