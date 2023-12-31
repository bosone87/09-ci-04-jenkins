terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

resource "yandex_compute_instance" "vm-1" {
  name        = var.vm1_name
  platform_id = var.vms_zone
  
  resources {
    cores         = var.vms_resources.vm-1.cores
    memory        = var.vms_resources.vm-1.memory
    core_fraction = var.vms_resources.vm-1.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.metadata
}

resource "yandex_compute_instance" "vm-2" {
  name        = var.vm2_name
  platform_id = var.vms_zone
  
  resources {
   cores         = var.vms_resources.vm-2.cores
   memory        = var.vms_resources.vm-2.memory
   core_fraction = var.vms_resources.vm-2.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.metadata
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
data "yandex_compute_image" "centos-7" {
  family = var.vms_family
}

resource "local_file" "hosts_cfg" {
  content = templatefile("./hosts.tftpl",
    {
      jenkins-master-01 = ["${yandex_compute_instance.vm-1}"],
      jenkins-agent-01  = ["${yandex_compute_instance.vm-2}"]
    }
    )
  filename = "../infrastructure/inventory/cicd/hosts"
}