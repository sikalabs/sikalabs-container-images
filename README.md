<p align="center">
  <h1 align="center">sikalabs/sikalabs-container-images</h1>
  <p align="center">
    <a href="https://sikalabs.com"><img alt="SikaLabs" src="https://img.shields.io/badge/OPENSOURCE BY-SIKALABS-131480?style=for-the-badge"></a>
    <a href="https://sikalabs.com"><img alt="SikaLabs" src="https://img.shields.io/badge/-sikalabs.com-gray?style=for-the-badge"></a>
    <a href="mailto://opensource@sikalabs.com"><img alt="SikaLabs" src="https://img.shields.io/badge/-opensource@sikalabs.com-gray?style=for-the-badge"></a>
  </p>
</p>

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

Build `sikalabs/ci`

```
make build
```

## Publish

Push `sikalabs/ci` and alias (`ondrejsika/ci`)

```
make push
```
