# pull the official base image (Background o.s for container)
 FROM node:alpine as builder

# set working direction (directory for my project)
 WORKDIR /app

# Copy everything from local machine to our server, second dot refers to the directory on the container.
 COPY . .

# install npm dependencies
 RUN npm install
 
# lets build the application
 RUN npm run build
 

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html