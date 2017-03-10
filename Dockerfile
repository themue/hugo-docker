FROM debian:jessie
MAINTAINER Frank Mueller <frank@mweb.de>

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    mercurial \
    git-core

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin

RUN curl -s https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz | tar -v -C /usr/local -xz
RUN go get github.com/spf13/hugo
RUN mkdir -p /var/www/site
RUN git clone http://github.com/themue/themue.name.git /src

COPY start.sh /start.sh
COPY pull.sh /pull.sh

EXPOSE 1313

WORKDIR /src
ENTRYPOINT ["/bin/sh", "/start.sh"]
