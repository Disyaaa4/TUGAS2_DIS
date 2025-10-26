FROM node:18-alpine AS builder
WORKDIR /app

RUN npm install -g expo-cli

COPY package*.json ./

RUN npm install --legacy-peer-deps
RUN npx expo install react-native-web@~0.19.6 react-dom@18.2.0 @expo/webpack-config@^19.0.0 --force

COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/web-build /usr/share/nginx/html
