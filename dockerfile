FROM node:18-alpine

RUN ["npm", "install", "-g", "pnpm"]

WORKDIR /app
COPY .npmrc .
COPY package.json .
COPY pnpm-lock.yaml .
RUN ["pnpm", "install"]

COPY . .
RUN ["pnpm", "build"]

EXPOSE 3000
ENTRYPOINT ["pnpm", "start"]
