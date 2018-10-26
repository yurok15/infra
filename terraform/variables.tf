variable public_key_path {
  description = "Path to the public key used for ssh access"
  default     = "/home/yuriy/.ssh/appuser.pub"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable source_range {
  description = "Source network"
  default     = "0.0.0.0/0"
}
