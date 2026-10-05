# Mariage Kilian & Justine - Déploiement serveur

## Fichiers
- index.html : l'app complète (à éditer pour mettre ton URL Google Sheet)
- Dockerfile + nginx.conf + docker-compose.yml

## Config Google Sheets (1 fois)
1. Ouvre index.html, cherche en haut:
   const GOOGLE_SHEET_URL = "";
2. Colle ton URL Apps Script /exec dedans

## Déploiement Docker (recommandé)

Sur ton serveur:
```bash
# envoie le dossier
scp -r mariage-deploy/* user@ton-serveur:/opt/mariage/

# sur le serveur
cd /opt/mariage
docker compose up -d --build
```
=> accessible sur http://ton-serveur:8080

## Avec Nginx déjà installé (sans Docker)
```bash
sudo cp index.html /var/www/mariage/index.html
# et pointe ton vhost vers /var/www/mariage
```

## Avec un nom de domaine + HTTPS (si tu as Traefik / Nginx Proxy Manager)
- Mets le container sur le réseau proxy
- Ajoute label ou vhost: mariage.ton-domaine.fr -> port 8080
- Active Let's Encrypt

## Mise à jour
Modifie index.html localement puis refais docker compose up -d --build
