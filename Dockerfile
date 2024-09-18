FROM golang:1.23-alpine AS builder

WORKDIR /app


COPY . .
COPY vendor ./vendor
RUN CGO_ENABLED=0 GOOS=linux go build -o main .


EXPOSE 8080

CMD ["./main"]
