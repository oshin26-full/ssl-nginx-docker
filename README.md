SSL for Nginx in Docker (Let's Encrypt)

This setup allows you to run your website over HTTPS using Nginx in Docker and a free certificate from Let's Encrypt.

- Your domain is already pointing to this server's IP address (DNS settings)
- Ports 80 and 443 are accessible from the internet

How to use

bash
chmod +x setup.sh
./setup.sh

Important Notes

- Let’s Encrypt certificates are valid for only 90 days, so they need to be renewed periodically (you can schedule this automatically using cron)
- Replace the app in docker-compose.yml with the application you want to use
