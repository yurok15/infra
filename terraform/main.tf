provider "google" {
 project = "first-210712"
 region = "europe-west1"
}

resource "google_compute_instance" "app" {
 name = "reddit-app"
 machine_type = "g1-small"
 zone = "europe-west1-b"
 boot_disk {
  initialize_params {
  image = "reddit-base-1540391806"
  }
 }
 metadata {
  sshKeys = "appuser:${file("~/.ssh/appuser.pub")}"
 }
tags = ["reddit-app"]

network_interface {
 network = "default"
 access_config {}
 }

connection {
 type = "ssh"
 user = "appuser"
 agent = false
 private_key = "${file("~/.ssh/appuser")}"
}

provisioner "file" {
 source = "files/puma.service"
 destination = "/tmp/puma.service"
 }

provisioner "remote-exec" {
 script = "files/deploy.sh"
 }
}


resource "google_compute_firewall" "reddit-app" {
 name = "reddit-app"
 network = "default"
 allow {
  protocol = "tcp"
  ports = ["9292", "22"]
 }
 source_ranges = ["0.0.0.0/0"]
 target_tags = ["reddit-app"]
 }
