terraform {
  /*  cloud {
    organization = "danbryan-hashicorp-org1"
    workspaces {
      name = ""
    }
  } */
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "google" {
  #credentials = file("dbryan-gcp-creds.json")
  project     = "hc-a026aae342044cebb2cdb5a1af8"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "cvs-instance-03"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "cvs-network1"
  auto_create_subnetworks = "true"
}

resource "google_sql_database_instance" "main" {
  name             = "cvs-instance"
  database_version = "POSTGRES_15"
  region           = "us-central1"
  root_password    = var.root_password
  maintenance_version = "1.1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
    #user_labels = var.custom_labels
  }
}
