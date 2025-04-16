# Use official Nginx image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files into nginx html folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Use default nginx startup command
CMD ["nginx", "-g", "daemon off;"]
