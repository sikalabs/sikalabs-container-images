[SikaLabs](https://sikalabs.com) | [Ondrej Sika (sika.io)](https://sika.io) | [__Skoleni Gitlab CI__](https://ondrej-sika.cz/skoleni/gitlab-ci/) 🚀💻

# sikalabs/ci image

Docker image for my Gitlab CI jobs.

## Toolchain

- [slu](https://github.com/sikalabs/slu) (SikaLabs UTils)
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
- moreutils (ts)
- statica

## Build

Build `sikalabs/ci`

```
make build
```

## Publish

Push `sikalabs/ci` and alias (`ondrejsika/ci`)

```
make push
```
