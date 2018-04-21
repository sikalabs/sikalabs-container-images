# ondrejsika/ci

    Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/ondrejsika-ci-docker

Docker image for my Gitlab CI jobs.


## Toolchain

- git
- docker client
- ssh client, sshpass
- curl, wget


## Build

```
docker build -t ondrejsika/ci .
```

## Publish

```
docker push ondrejsika/ci
```

