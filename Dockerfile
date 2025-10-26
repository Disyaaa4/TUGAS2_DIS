# Gunakan image node sebagai base image untuk React Native
FROM node:18

# Set working directory dalam container
WORKDIR /app

# Salin file package dan install dependencies
COPY package*.json ./
RUN npm install

# Salin seluruh source code ke working directory
COPY . .

# Expose port yang digunakan (misalnya 8081 untuk Metro bundler)
EXPOSE 8081

# Perintah default untuk jalankan Metro bundler
CMD ["npx", "react-native", "start"]