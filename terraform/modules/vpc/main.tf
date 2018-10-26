resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  description = "Allow SSH frm anywhere"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${var.source_range}"]
}

resource "google_compute_firewall" "reddit-app" {
  name        = "reddit-app"
  description = "Allow 9292 from anywhere"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["${var.source_range}"]
  target_tags   = ["reddit-app"]
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
