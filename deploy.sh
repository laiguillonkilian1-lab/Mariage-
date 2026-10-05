#!/bin/bash
# Usage: ./deploy.sh user@serveur
SERVER=$1
if [ -z "$SERVER" ]; then echo "Usage: ./deploy.sh user@serveur"; exit 1; fi
echo "Envoi vers $SERVER:/opt/mariage"
ssh $SERVER "mkdir -p /opt/mariage"
scp index.html Dockerfile nginx.conf docker-compose.yml $SERVER:/opt/mariage/
ssh $SERVER "cd /opt/mariage && docker compose up -d --build && echo 'En ligne sur port 8080'"
