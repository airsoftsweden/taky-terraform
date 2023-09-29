resource "digitalocean_firewall" "atak-docker-do" {

  count = length(var.servers)
  name = "TF-TAKY-Allow-${var.servers[count.index]}"
  droplet_ids = [digitalocean_droplet.atak-docker-do[count.index].id]

  inbound_rule { # SSH 
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule { # Certbot HTTP Validation
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }

    inbound_rule { # Certbot HTTPS Validation
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule { # ATAK CoT SSL
    protocol         = "tcp"
    port_range       = "8089"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule { # ATAK DataPackage Server SSL
    protocol         = "tcp"
    port_range       = "8443"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule { # Taky-Map
    protocol = "tcp"
    port_range = "1881"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Taky-RTSP - RTMP Protocol
    protocol = "tcp"
    port_range = "1935"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Taky-RTSP - RTSP Protocol
    protocol = "tcp"
    port_range = "8554"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Taky-RTSP - HLS Protocol
    protocol = "tcp"
    port_range = "8888"
    source_addresses = [ "0.0.0.0/0" ]
  }
  
  inbound_rule { # Taky-RTSP - API endpoint
    protocol = "tcp"
    port_range = "9997"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Taky-RTSP-Sidercar
    protocol = "tcp"
    port_range = "1880"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Mumble
    protocol = "udp"
    port_range = "64738"
    source_addresses = [ "0.0.0.0/0" ]
  }

  inbound_rule { # Mumble
    protocol = "tcp"
    port_range = "64738"
    source_addresses = [ "0.0.0.0/0" ]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0"]
  }
}