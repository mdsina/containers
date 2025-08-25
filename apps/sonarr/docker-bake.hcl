target "docker-metadata-action" {}

variable "APP" {
  default = "sonarr"
}

variable "VERSION" {
  // renovate: datasource=custom.sonarr-develop depName=sonarr versioning=loose
  default = "5.0.0.6"
}

variable "SOURCE" {
  default = "https://github.com/mdsina/Sonarr"
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
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
