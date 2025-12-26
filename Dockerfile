FROM node:alpine

RUN apk add --no-cache curl

WORKDIR /usr/home/

RUN npm install -g pnpm 

COPY package*.json . 

RUN pnpm install 

COPY . . 

RUN npx prisma generate

EXPOSE 8000

CMD ["sh", "-c", "npx prisma migrate dev --name init && pnpm dev"]

