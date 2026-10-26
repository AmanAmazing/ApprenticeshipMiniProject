# Dockerfile to host the files as a web server 
# Should be using nginx with the html and js files moved over to the default nginx location /usr/share/nginx/html
FROM nginx:stable-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html index.js /usr/share/nginx/html/
EXPOSE 80
