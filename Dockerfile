FROM node:alpine

WORKDIR /usr/home/

RUN npm install -g pnpm 

COPY package*.json . 

RUN pnpm install 

COPY . . 

RUN npx prisma migrate dev -name init 
RUN npx prisma generate

EXPOSE 3000

CMD [ "pnpm","dev"]

