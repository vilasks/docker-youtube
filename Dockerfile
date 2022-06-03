FROM alpine:node as mainnode
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx as ser
EXPOSE 80
COPY --from=mainnode  /var/app/build /usr/share/nginx/html

