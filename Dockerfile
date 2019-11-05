## Base image to use.
# hadolint ignore=DL3006
FROM nginx
BADVAR====
## Copy code modified index file into new container replacing default one.  
COPY index.html /usr/share/nginx/html/index.html
