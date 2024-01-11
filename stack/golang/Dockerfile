FROM golang:alpine

WORKDIR /app

COPY go.mod      /app/go.mod
COPY solution.go /app/solution.go

RUN CGO_ENABLED=0 \
    GOOS=linux    \
    go build -o /app/solution

RUN cp /app/solution /usr/bin/solution
RUN chmod  +x        /usr/bin/solution

CMD [ "solution", "hash.txt" ]
