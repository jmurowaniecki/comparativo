FROM bash:latest

WORKDIR /app

COPY solution.sh /usr/bin/solution.sh
RUN  chmod  +x   /usr/bin/solution.sh

CMD [ "solution.sh", "hash.txt" ]