FROM node:18-alpine


ENV NODE_ENV=production


EXPOSE 8080/tcp


LABEL maintainer="TitaniumNetwork Ultraviolet Team"
LABEL summary="Ultraviolet Proxy Image"
LABEL description="Example application of Ultraviolet which can be deployed in production."


WORKDIR /app


COPY ["package.json", "package-lock.json", "./"]


RUN apk add --upgrade --no-cache python3 make g++


RUN npm install --omit=dev


COPY . .


ENTRYPOINT ["node"]
CMD ["src/index.js"]
