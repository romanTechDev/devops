docker run -it --rm \
  -v /etc/ssl/certs:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  certbot/certbot certonly \
  --webroot \
  --webroot-path=/var/www/letsencrypt \
  -d <domain>

mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

