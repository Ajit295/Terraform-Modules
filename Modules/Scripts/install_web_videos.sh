apt-get update -y && apt-get upgrade -y
apt-get install -y nginx
mkdir /var/www/html/videos
echo "<h1> This is video server on $(hostname) </h1>" > /var/www/html/videos/Default.html