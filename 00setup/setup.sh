#!/bin/bash

servers=("209.38.201.69")
USER_NAME="devops"

# Validate PUB_KEY
if [[ -z "$PUB_KEY" ]]; then
  echo "❌ PUB_KEY is empty. Run:"
  echo "export PUB_KEY=\"\$(cat ~/.ssh/id_rsa.pub)\""
  exit 1
fi

for server in "${servers[@]}"
do
  echo "------------------------"
  echo "🚀 Setting up $USER_NAME on $server"

  # Step 1: Create user + base setup
  ssh root@$server << EOF

set -e

# Create user if not exists
id -u $USER_NAME &>/dev/null || adduser --disabled-password --gecos "" $USER_NAME

# Add to sudo group
usermod -aG sudo $USER_NAME

# Create SSH directory
mkdir -p /home/$USER_NAME/.ssh
chmod 700 /home/$USER_NAME/.ssh

EOF

  # Step 2: Push SSH key safely (NO QUOTING ISSUES)
  echo "$PUB_KEY" | ssh root@$server "cat >> /home/$USER_NAME/.ssh/authorized_keys"

  # Step 3: Fix permissions + sudo safely
  ssh root@$server << EOF

# Set correct permissions
chmod 600 /home/$USER_NAME/.ssh/authorized_keys
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/.ssh
chmod 755 /home/$USER_NAME

# Safe sudo config (DO NOT TOUCH /etc/sudoers directly)
echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER_NAME
chmod 440 /etc/sudoers.d/$USER_NAME

echo "✅ Setup completed on $server"

EOF

done