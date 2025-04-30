apt-get update -y && apt-get upgrade -y
apt-get install -y nginx
cd /var/www/html
sudo chmod 777 /var/www/html
echo "<h1> This is web server on $(hostname) </h1>" > /var/www/html/Default.html