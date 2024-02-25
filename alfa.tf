variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "eu-west-1"
}

resource "null_resource" "null_resource_provisioner" {
  provisioner "local-exec" {
    command = "echo null resources are now provisioned"

  }
}
