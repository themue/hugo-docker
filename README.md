# Hugo Docker

Simple way to run Hugo generating pages served by a nginxin a Docker container.
The content is pulled periodically out of a GitHub repository. Hugo then rebuilds
the site.

## Building

```
git clone https://github.com/themue/hugo-docker.git
cd hugo-docker
docker build -t hugo-docker .
```

## Running

```
docker run -d -p 8080:80 -e SITE_REPOSITORY=<yoursite-repository> --name <yoursite> hugo-docker
```

Here `<yoursite-repository>` leads to your the repository containing
the configuration and content of your site, e.g. at GitHub.
