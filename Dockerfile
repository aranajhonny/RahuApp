FROM mhart/alpine-node:6
LABEL name "RahuApp"
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN npm install -g serve @angular/cli
RUN npm install 
RUN ng build --prod --build-optimizer --aot 
RUN cp ./dist/index.html ./dist/404.html
EXPOSE 4200
CMD ["serve -p 4200 ./dist"]
