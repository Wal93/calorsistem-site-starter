# Stage 1 - build
FROM golang:1.22 AS builder

WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download || true

COPY . .
WORKDIR /app/cmd/web
RUN go build -o /app/app

# Stage 2 - run
FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/app .

ENV PORT=3000
EXPOSE 3000

CMD ["./app"]
