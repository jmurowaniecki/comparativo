FROM php:8-alpine

WORKDIR /app

COPY solution.php /usr/bin/solution.php
RUN  chmod  +x    /usr/bin/solution.php

CMD [ "solution.php", "hash.txt" ]
