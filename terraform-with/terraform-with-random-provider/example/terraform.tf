provider "random" {}

resource "random_string" "example" {
  length  = 8
  special = false
}

output "example_string" {
  value = random_string.example.result
}
