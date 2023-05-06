#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<center><h1>EC2 Web App: $(hostname -f)</h1></center>" > /var/www/html/index.html