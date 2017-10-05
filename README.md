# docker-circleci

Fill out docker-compose.yml

Launch docker-compose

`docker-compose up`

Open localhost in browser

Change server.js file text from "Hello Hamburg" to something else

Reload browser > nothing happend.

Cancel docker-compose and restart

Not it got applied.. but we want dynamic changes.. a file watcher is needed

Add file watcher while docker-compose is still running

`docker-compose exec web npm install --save-dev -nodemon`

See package.json: `nodemon` is added as dependency

Add nodemon to Docker Compose file

`command: node_modules/.bin/nodemon server.js`

Stop docker-compose and relaunch

Change something again in server.js and see how it gets dynamically changed in the webbrowser

Now we have a very fast developer feedback cycle!
