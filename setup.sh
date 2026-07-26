!/bin/bash
echo "certificate SSL Let's Encrypt for Nginx Docker"
set -e

read -p "YOUR-DOMAIN.com: " DOMAIN
read -p "YOUR-EMAIL: " EMAIL

mkdir -p certbot/conf certbot/www

sed -i "s/YOUR-DOMAIN.com/$DOMAIN/g" nginx-ssl.conf

docker compose up -d

echo "certificate SSL lets's encrypt for nginx docker"
docker run --rm \
  -v "$(pwd)/certbot/conf:/etc/letsencrypt" \
  -v "$(pwd)/certbot/www:/var/www/certbot" \
  certbot/certbot certonly --webroot \
  -w /var/www/certbot \
  -d "$DOMAIN" \
  --email "$EMAIL" \
  --agree-tos --no-eff-email

docker compose restart webserver
