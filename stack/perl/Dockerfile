FROM perl:5-slim

WORKDIR /app

COPY solution.pl /usr/bin/solution.pl
RUN  chmod  +x   /usr/bin/solution.pl

CMD [ "solution.pl", "hash.txt" ]
