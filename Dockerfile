FROM golang:1.15

WORKDIR /app

COPY . .

RUN go build .

EXPOSE 80

CMD ["./hello-golang"]
