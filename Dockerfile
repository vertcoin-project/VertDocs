FROM kyma/docker-nginx
COPY site/ /var/www
CMD 'nginx'
