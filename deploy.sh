#!/bin/bash
cd ~/Monorepo-BMS
git pull
export PATH=/home/ubuntu/.nvm/versions/node/v22.15.0/bin:$PATH
pnpm install
pnpm run build
pm2 restart web
pm2 restart http-server
pm2 restart ws-server
