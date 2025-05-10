FROM node:18-alpine

# Set environment variable for production
ENV NODE_ENV=production

# Expose the port you want to use (8080 for example)
EXPOSE 8080/tcp

# Add metadata labels
LABEL maintainer="TitaniumNetwork Ultraviolet Team"
LABEL summary="Ultraviolet Proxy Image"
LABEL description="Example application of Ultraviolet which can be deployed in production."

# Set working directory to /app
WORKDIR /app

# Install required build tools and Git
RUN apk add --no-cache python3 make g++ git

# Copy package.json and package-lock.json first (this helps leverage Docker caching for dependencies)
COPY ["package.json", "package-lock.json", "./"]

# Install production dependencies (without dev dependencies)
RUN npm install --omit=dev

# Copy the rest of the application code
COPY . .

\
ENTRYPOINT ["node"]
CMD ["src/index.js"]
