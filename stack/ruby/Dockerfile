FROM ruby:3-alpine

WORKDIR /app

COPY solution.rb /usr/bin/solution.rb
RUN  chmod  +x   /usr/bin/solution.rb

CMD [ "solution.rb", "hash.txt" ]
