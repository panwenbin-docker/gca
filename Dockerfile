FROM golang:1.14 as builder

ARG GOPROXY
ENV GORPOXY ${GOPROXY}

WORKDIR /builder

RUN git clone https://github.com/panwenbin/gca.git /builder \
  && go build main.go

FROM alpine:latest

COPY --from=builder /builder/main /app/gca

WORKDIR /app

CMD ["./gca"]

