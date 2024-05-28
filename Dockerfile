# Utilisez l'image Node.js officielle
FROM node:20

# Définissez le répertoire de travail
WORKDIR /app

# Copiez le fichier package.json et package-lock.json
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez le reste des fichiers de l'application
COPY . .

# Construisez l'application React
RUN npm run build

# Exposez le port 5000 (ou tout autre port que vous souhaitez utiliser)
EXPOSE 3000

# Installez http-server pour servir les fichiers construits
RUN npm install -g http-server

# Démarrez l'application
CMD ["http-server", "build"]
