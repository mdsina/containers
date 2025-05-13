target "docker-metadata-action" {}

variable "VERSION" {
  // renovate: datasource=repology depName=alpine_3_21/postgresql17-client versioning=loose
  default = "17.5-r0"
}

variable "SOURCE" {
  default = "https://github.com/postgres/postgres"
}

group "default" {
  targets = ["image-local"]
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
