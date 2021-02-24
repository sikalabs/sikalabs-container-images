# sikalabs/ci image

    Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/sikalabs/sikalabs-ci-image

Docker image for my Gitlab CI jobs.

## Toolchain

- git
- docker client, docker compose, docker machine
- ssh client, sshpass
- sshx (alias for `sshpass -e ssh -o StrictHostKeyChecking=no $@`)
- curl, wget
- zip, unzip
- sudo
- mcli (Minio client)
- kubectl, helm
- terraform, consul, vault

## Build

```
DOCKER_BUILDKIT=1 docker build -t ondrejsika/ci .
```

## Publish

```
docker push ondrejsika/ci
```
