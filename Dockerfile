FROM node:latest as build 
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build  
CMD npm run start
EXPOSE 4200 

FROM nginx:alpine 
COPY --from=build /app/dist/frontend/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
