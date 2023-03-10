terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    namecheap = {
      source = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "namecheap" {
  user_name = var.namecheap_username
  api_user = var.namecheap_api_user
  api_key = var.namecheap_api_key
}