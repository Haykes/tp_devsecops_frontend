# Étape 1: Construction de l'application
FROM node:16 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Étape 2: Serveur Nginx pour servir les fichiers statiques
FROM nginx:alpine
COPY --from=build /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
