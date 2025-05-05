#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

export PATH=/home/ubuntu/.nvm/versions/node/v22.15.0/bin:$PATH

# Pull latest code
cd ~/Monorepo-BMS
git pull origin main
pnpm install
pnpm run build || exit 1

# Build Web App
cd ~/Monorepo-BMS/apps/web

# Start or restart web process
if pm2 describe web >/dev/null 2>&1; then
  pm2 restart web
else
  pm2 start pnpm --name web -- run start
fi

# Start or restart http-server
cd ~/Monorepo-BMS/apps/http-server
if pm2 describe http-server >/dev/null 2>&1; then
  pm2 restart http-server
else
  pm2 start pnpm --name http-server -- run start
fi

# Start or restart ws-server
cd ~/Monorepo-BMS/apps/ws-server
if pm2 describe ws-server >/dev/null 2>&1; then
  pm2 restart ws-server
else
  pm2 start pnpm --name ws-server -- run start
fi

# Optionally save PM2 state to make it restartable on reboot
pm2 save
