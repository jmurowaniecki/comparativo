FROM node:21-alpine

WORKDIR /app

COPY solution.js /usr/bin/solution.js
RUN  chmod  +x   /usr/bin/solution.js

CMD [ "solution.js", "hash.txt" ]
