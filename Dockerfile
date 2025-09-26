FRFROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy all files from current folder (except Dockerfile/docker-compose.yml)
COPY . /usr/share/nginx/html/

EXPOSE 80

