#Define Linux ubuntu machine for GCP


resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(abspath(var.ssh_key))}"
    startup-script = <<EOT
        #!/bin/bash
        set -e

        # Set the user password
        echo "tariq:${var.ssh_password}" | chpasswd

        # Remove tariq from google-sudoers if present
        deluser tariq google-sudoers || true

        # Create custom sudoers file that requires password
        echo "tariq ALL=(ALL) ALL" > /etc/sudoers.d/tariq-requires-password
        chmod 440 /etc/sudoers.d/tariq-requires-password
      
      EOT
  }

  tags = var.tags
}
