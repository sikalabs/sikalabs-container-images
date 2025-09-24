ARG TERRAFORM_IMAGE_VERSION=1.4

FROM sikalabs/slu:v0.89.0 AS download-provider
RUN apt-get update && apt-get install -y ca-certificates
RUN slu install-any-bin \
  --url https://github.com/mrparkers/terraform-provider-keycloak/releases/download/v4.2.0/terraform-provider-keycloak_4.2.0_linux_amd64.zip \
  --source terraform-provider-keycloak_v4.2.0 \
  --bin-dir / \
  --name terraform-provider-keycloak

FROM hashicorp/terraform:$TERRAFORM_IMAGE_VERSION
COPY --from=download-provider /terraform-provider-keycloak /terraform-providers/registry.terraform.io/mrparkers/keycloak/4.2.0/linux_amd64/terraform-provider-keycloak_v4.2.0
