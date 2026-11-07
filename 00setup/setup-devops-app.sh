#!/bin/bash

# Exit on error (important)
set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

SERVER="209.38.201.69"

echo -e "${YELLOW}Connecting to $SERVER and setting up app...${NC}"

ssh devops@$SERVER << 'EOF'

echo "Creating app directory..."
mkdir -p /home/devops/app

echo "Creating styled index.html with CTA..."
cat << 'HTML' > /home/devops/app/index.html
<!DOCTYPE html>
<html>
<head>
  <title>DevOps App</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #0f172a;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    h1 {
      color: #22c55e;
      margin-bottom: 10px;
    }

    p {
      margin-bottom: 30px;
      color: #cbd5f5;
    }

    .cta {
      border: 2px solid #06b6d4;
      padding: 20px 40px;
      text-align: center;
      font-size: 20px;
      color: #06b6d4;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(6, 182, 212, 0.5);
    }

    a {
      color: #22c55e;
      text-decoration: none;
      font-weight: bold;
    }
  </style>
</head>
<body>

  <h1>DevOps App is Running </h1>
  <p>If you see this, service is working.</p>

  <div class="cta">
    SUBSCRIBE TO OUR CHANNEL <br/>
    <a href="https://youtube.com/@learnwithdevopsengineer" target="_blank">
      LearnWithDevOpsEngineer
    </a>
  </div>

</body>
</html>
HTML

echo "Creating systemd service..."
sudo bash -c 'cat > /etc/systemd/system/devops-app.service' << 'SERVICE'
[Unit]
Description=DevOps Demo App
After=network.target

[Service]
WorkingDirectory=/home/devops/app
ExecStart=/usr/bin/python3 -m http.server 5000
Restart=always
User=devops

[Install]
WantedBy=multi-user.target
SERVICE

echo "Reloading systemd..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

echo "Enabling service..."
sudo systemctl enable devops-app

echo "Restarting service..."
sudo systemctl restart devops-app

echo "Setup completed successfully."

EOF

echo -e "${GREEN}App setup completed on $SERVER${NC}"

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "${CYAN}   OPEN IN BROWSER: http://$SERVER:5000   ${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""