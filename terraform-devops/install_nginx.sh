#!/bin/bash

# Update system
apt update -y

# Install nginx
apt install nginx -y

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Create a beautiful HTML page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Akash DevOps Server</title>
<style>
body {
    margin: 0;
    font-family: Arial;
    background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
    color: white;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.box {
    text-align: center;
    background: rgba(255,255,255,0.1);
    padding: 40px;
    border-radius: 15px;
}
h1 { font-size: 40px; }
p { font-size: 18px; color: #ddd; }
.badge {
    margin-top: 20px;
    display: inline-block;
    padding: 10px 25px;
    background: #00c853;
    color: black;
    border-radius: 30px;
    font-weight: bold;
}
</style>
</head>
<body>
<div class="box">
<h1>🚀 Akash DevOps Server</h1>
<p>Nginx running on AWS EC2 using Terraform</p>
<div class="badge">Terraform • AWS • Nginx</div>
</div>
</body>
</html>
EOF

# Restart nginx
systemctl restart nginx

echo "Nginx installed and website deployed successfully"
