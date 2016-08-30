FROM wwong38519/rpi-node6x:latest

COPY package.json /usr/src/app/

WORKDIR /usr/src/app/

RUN npm install

COPY . /usr/src/app/

EXPOSE 8080

CMD ["npm", "run", "start"]
