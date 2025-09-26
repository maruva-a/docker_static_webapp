# Use lightweight Nginx image
FROM nginx:alpine

# Remove default Nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy all files from current folder (index.html, style.css)
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80


