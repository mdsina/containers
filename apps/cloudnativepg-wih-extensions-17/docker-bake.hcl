target "docker-metadata-action" {}

variable "VERSION" {
  // renovate: datasource=docker depName=ghcr.io/cloudnative-pg/postgresql
  default = "17.4-202505050806-standard-bookworm"
}

group "default" {
  targets = ["image-local"]
}

variable "SOURCE" {
  default = "https://github.com/cloudnative-pg/postgres-containers"
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
