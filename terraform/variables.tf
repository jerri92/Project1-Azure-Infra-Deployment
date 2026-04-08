variable "location" {
  type    = string
  default = "australiaeast"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    project     = "hub-spoke-network"
  }
}
