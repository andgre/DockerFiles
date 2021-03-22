provider "google" {
  credentials = file("Project-e59a94f4f298.json")
  project     = "tough-racer-302813"
  region      = "europe-north1"
}

resource "google_compute_instance" "dev" {
  name         = "instance-dev-001"
  machine_type = "e2-medium"
  zone         = "europe-north1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata = {
    ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  provisioner "remote-exec" {
    inline = [
      "apt update",
    ]
  }
  connection {
    host        = google_compute_instance.dev.network_interface.0.access_config.0.nat_ip
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/id_rsa")
    timeout     = "30s"
  }
}

resource "google_compute_instance" "prod" {
  name = "instance-prod-001"
  machine_type = "e2-medium"
  zone = "europe-north1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  metadata = {
    ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  provisioner "remote-exec" {
    inline = [
      "apt update",
    ]
  }
  connection {
    host = google_compute_instance.prod.network_interface.0.access_config.0.nat_ip
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout = "90s"
  }
}
resource "null_resource" "localexec" {
  provisioner "local-exec" {
    command = "ansible-playbook -v playbook.yml --extra-vars 'dev_ip=${google_compute_instance.dev.network_interface.0.access_config.0.nat_ip} prod_ip=${google_compute_instance.prod.network_interface.0.access_config.0.nat_ip}'"
  }
}
output "prod_ip_addr" {
  value = google_compute_instance.prod.network_interface.0.access_config.0.nat_ip
}


