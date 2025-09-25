mkdir -p /var/www/letsencrypt/.well-known/acme-challenge

docker run -it --rm \
  -v /etc/ssl/certs:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  certbot/certbot certonly \
  --webroot \
  --webroot-path=/var/www/letsencrypt \
  -d <domain>


docker run -it --rm \
  -v /etc/ssl/certs:/etc/letsencrypt \
  -v /var/www/letsencrypt:/var/www/letsencrypt \
  certbot/certbot certonly \
  --manual \
  --preferred-challenges dns \
  --email rpetrov@moymir.ru \
  --server https://acme-v02.api.letsencrypt.org/directory \
  -d "*.hsr24.ru" \
  -d "hsr24.ru"
  
  backend.postgre_rr.hsr24.ru
  rpetrov@moymir.ru

docker run -it --rm \
  certbot/certbot certonly \
  --manual \
  --preferred-challenges dns \
  --email rpetrov@moymir.ru \
  --server https://acme-v02.api.letsencrypt.org/directory \
  -d "*.hsr24.ru" \
  -d "hsr24.ru"


  docker run -it --rm \
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/www/certbot:/var/www/certbot" \
    certbot/certbot renew \
    --webroot \
    --webroot-path=/var/www/certbot
