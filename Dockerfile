# -----
# Dockerfile for a container running Hugo and
# pulling its content from a Git repository passed
# by the envirironment variable SITE_REPOSITORY
# and the branch passed by SITE_BRANCH. It's
# master by default.
# -----

# -----
# Stage 1: Build latest Hugo.
# -----

FROM golang:latest as builder

RUN go install github.com/gohugoio/hugo@latest

# -----
# Stage 2: Runtime.
# -----

FROM alpine:latest
LABEL maintainer = "Frank Mueller <frank.mueller@themue.dev>"

RUN apk add --no-cache ca-certificates
RUN apk add --no-cache git
RUN apk add --no-cache nginx

RUN mkdir -p /run/nginx
RUN mkdir -p /hugo/src
WORKDIR /hugo

COPY default.conf /etc/nginx/conf.d/
COPY --from=builder /go/bin/hugo .
COPY start.sh .
COPY pull.sh .

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/sh", "/hugo/start.sh"]

# -----
# EOF
# -----

