#
# Dockerfile for a container running Hugo and
# pulling its content from a Git repository passed
# by the envirironment variable SITE_REPOSITORY.
#

FROM debian:jessie
LABEL vendor = "Frank Mueller <frank@mweb.de>"

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		curl \
		git-core \
		mercurial \
		nginx \
		gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# Forward request and error logs to docker log collector.
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

RUN curl -s https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz | tar -v -C /usr/local -xz
RUN go get github.com/spf13/hugo

COPY start.sh /start.sh
COPY pull.sh /pull.sh

EXPOSE 80

ENTRYPOINT ["/bin/sh", "/start.sh"]

#
# EOF
#
