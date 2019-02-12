#
# Dockerfile for a container running Hugo and
# pulling its content from a Git repository passed
# by the envirironment variable SITE_REPOSITORY
# and the branch passed by SITE_BRANCH. It's
# master by default.
#

FROM debian:stretch
LABEL vendor = "Frank Mueller <frank@mweb.de>"

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		curl \
		git-core \
		mercurial \
		nginx \
		gettext-base \
		procps \
	&& rm -rf /var/lib/apt/lists/*

# Forward request and error logs to docker log collector.
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN curl -s https://storage.googleapis.com/golang/go1.11.5.linux-amd64.tar.gz | tar -v -C /usr/local -xz
RUN go get github.com/spf13/hugo

COPY start.sh /start.sh
COPY pull.sh /pull.sh

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/sh", "/start.sh"]

#
# EOF
#
