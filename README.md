# Hugo Docker

Simple way to run Hugo in a Docker container. The content is pulled
periodically out of a GitHub repository. Hugo watches the source
directory for changes and rebuilds the site.

## Building

```
git clone https://github.com/themue/hugo-docker.git
cd hugo-docker
docker build -t hugo-docker .
```

## Running

```
docker run --rm -p 1313:1313 -e SITE_REPOSITORY=<yoursite-repository> --name <yoursite> .
```

Here `<yoursite-repository>` leads to your the repository containing
the configuration and content of your site, e.g. at GitHub.