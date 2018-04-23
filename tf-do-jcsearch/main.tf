  # Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option

variable "DO_TOKEN" {}

variable "DME_AKEY" {}
variable "DME_SKEY" {}
variable "DME_DOMAINID" {}


variable "image" {
  default = "ubuntu-16-04-x64"
}

variable "region" {
  default = "sfo2"
}

variable "size" {
  default = "1gb"
}

variable "ssh_keys" {
  default = ["19717796"]
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.DO_TOKEN}"
}

resource "digitalocean_droplet" "node" {
  count  = 1
  image  = "${var.image}"
  name   = "node${count.index}"
  region = "${var.region}"
  size   = "${var.size}"
  ssh_keys = "${var.ssh_keys}"
}


output "node_ip_addresses" {
  value = ["${digitalocean_droplet.node.*.ipv4_address}"]
}


provider "dme" {

  akey       = "${var.DME_AKEY}"
  skey       = "${var.DME_SKEY}"
  usesandbox = false
}


# resource "dme_record" "node1" {
#   domainid    = "${var.DME_DOMAINID}"
#   name        = "${digitalocean_droplet.node1.name}"
#   type        = "A"
#   value       = "${digitalocean_droplet.node1.ipv4_address}"
#   ttl         = 100
# }







