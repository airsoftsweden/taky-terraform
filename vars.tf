variable "do_token" {
  type        = string
  sensitive   = true
}

variable "ssh_key" {
  default = "~/.ssh/id_rsa"
  type = string
}

variable "gh_token" {
  default = "NONE"
  type = string
  sensitive = true
}

variable "cert_pass" {
  default = "atakatak"
  type = string
}

variable "ssh_fingerprint" {
  type = string  
}

variable "namecheap_username" {
  type = string
}

variable "namecheap_api_user" {
  type = string
}

variable "namecheap_api_key" {
  type = string
}

variable "telegram_token" {
  type = string
}

variable "map_endpoint" {
  type = string
}

variable "email" {
  type = string  
}

variable "servers" {
  description = "Create Servers with these names"
  type = list(string)
  default = ["red", "green", "blue"]
}

