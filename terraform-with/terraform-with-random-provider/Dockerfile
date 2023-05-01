ARG TERRAFORM_IMAGE_VERSION=1.4

FROM sikalabs/slu:v0.66.0 as download-provider
RUN apt-get update && apt-get install -y ca-certificates
RUN slu install-any-bin \
  --url https://releases.hashicorp.com/terraform-provider-random/3.5.1/terraform-provider-random_3.5.1_linux_amd64.zip \
  --source terraform-provider-random_v3.5.1_x5 \
  --bin-dir / \
  --name terraform-provider-random

FROM hashicorp/terraform:$TERRAFORM_IMAGE_VERSION
COPY --from=download-provider /terraform-provider-random /terraform-providers/registry.terraform.io/hashicorp/random/3.5.1/linux_amd64/terraform-provider-random_v3.4.3_x5
