## Base image to use
FROM nginx

## Copy code modified index file into new container replacing default one.  
COPY index.html /usr/share/nginx/html/index.html