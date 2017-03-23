#
# Dockerfile for a container running Hugo and
# pulling its content from a Git repository passed
# by the envirironment variable SITE_REPOSITORY.
#

FROM debian:jessie
LABEL vendor = "Frank Mueller <frank@mweb.de>"

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    git-core \
    mercurial

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin

RUN curl -s https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz | tar -v -C /usr/local -xz
RUN go get github.com/spf13/hugo

COPY start.sh /start.sh
COPY pull.sh /pull.sh

CMD ["/bin/sh", "/start.sh"]

EXPOSE 1313

#
# EOF
#
