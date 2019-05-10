### CADDY BUILDER

FROM golang:alpine3.9 as builder

ENV GO111MODULE=on

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

COPY main.go ./src/github.com/tjbearse/tjbearse.net/
WORKDIR ./src/github.com/tjbearse/tjbearse.net
RUN go mod init caddy
RUN go get github.com/mholt/caddy
RUN go install

### CADDY RUNNER

FROM alpine:3.8 as caddy

RUN apk add --no-cache openssh-client git

# install caddy
COPY --from=builder /go/bin/caddy /usr/bin/caddy

# validate install
RUN /usr/bin/caddy -version
RUN /usr/bin/caddy -plugins

EXPOSE 80 443 2015
VOLUME /root/.caddy /srv
WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=true"]

FROM caddy as dev

COPY Caddyfile /etc/Caddyfile
COPY Caddyfile.comm /etc/Caddyfile.comm

FROM caddy as prod

COPY Caddyfile.prod /etc/Caddyfile
COPY Caddyfile.comm /etc/Caddyfile.comm
