# Hugo Docker

Simple way to run Hugo generating pages served by a nginx in a Docker container.
The content is pulled periodically out of a GitHub repository. Hugo then rebuilds
the site.

The repository is passed by the variable `SITE_REPOSITORY`, the branch by
`SITE_BRANCH`. The default branch is `master`. This way alternative configurations
or work in progress can be tested in special containers.

## Building

```
git clone https://github.com/themue/hugo-docker.git
cd hugo-docker
sudo docker build -t hugo-docker .
```

## Running

```
sudo docker run -d -p 8080:80 -e SITE_REPOSITORY=<repository> -e SITE_BRANCH=<branch> --name <name> hugo-docker
```

Here `<yoursite-repository>` leads to your the repository containing
the configuration and content of your site, e.g. at GitHub.
