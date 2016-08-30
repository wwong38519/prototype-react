## prototype-react

### Description

* Basic setup for ReactJS+ES5 development
* Gulp, Babel, Browserify
* Docker

#### Docker

* Build Docker Image
```
docker build -t react-container .
```
* Run the image as a container
* Map port 8080 from the container to port 80 of the host
```
docker run -it --rm \
  -p 80:8080 \
  react-container
```
* Run the image as a container
* Allow the container to call other hosts via the host
* Map host volume to container... and symlinked to pre-downloaded node_modules, for development purpose
```
docker run -it --rm \
  --add-host=docker:$(ip route show 0.0.0.0/0 | grep -Eo 'via \S+' | awk '{ print $2 }') \
  -p 80:8080 \
  -v /home/pi/projects/prototype-react:/usr/src/dev \
  react-container \
  /bin/bash -c 'cd /usr/src/dev/; ln -sf /usr/src/app/node_modules node_modules; npm run dev'
```
* Tap into running container
```
docker exec -it $(docker ps --filter 'ancestor=react-container' -q) /bin/bash
```
* Remove exited containers
```
docker rm -v $(docker ps -a -q -f status=exited)
```
* Remove dangling images
```
docker rmi $(docker images -f 'dangling=true' -q)
```

#### npm via gulp
* test: eslint and nothing more
```
npm run test
```
* build: build js(x), copy html files
```
npm run build
```
* http: start web server only
```
npm run http
```
* dev: watch and update js(x) and html files, start web server (development)
```
npm run dev
```
