FROM python:3-alpine

WORKDIR /app

COPY solution.py /usr/bin/solution.py
RUN  chmod  +x   /usr/bin/solution.py

CMD [ "solution.py", "hash.txt" ]
