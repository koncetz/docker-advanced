FROM nginx:1.15.6

RUN rm /etc/nginx/conf.d/default.conf
COPY ./apps/nginx.conf /etc/nginx/nginx.conf
