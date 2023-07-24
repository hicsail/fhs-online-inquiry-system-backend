FROM node:18-alpine

WORKDIR /backend

COPY package*.json ./
COPY prisma ./prisma/
COPY tsconfig.json ./
COPY . .

RUN npm install
RUN npm run build
RUN npx prisma generate

EXPOSE 3000

CMD npm run start:prod