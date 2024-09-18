FROM golang:1.23-alpine AS builder

WORKDIR /app

RUN mkdir -p /etc/ssl/certs/
RUN mkdir -p /etc/ssl/private/


COPY crt /etc/ssl/certs/selfsigned.crt
COPY key /etc/ssl/private/selfsigned.key


COPY . .
COPY vendor ./vendor
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

EXPOSE 443

CMD ["./main"]
