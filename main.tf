resource "random_password" "user_password" {
  length = 10
  lower = false
}

resource "random_password" "admin_password" {
  length = 14
  lower = false
}


resource "local_file" "password" {
  content = random_password.user_password.result
  filename = "/home/ivan111/Terraform/user_password.txt"
}


resource "local_file" "password1" {
  content = random_password.admin_password.result
  filename = "/home/ivan111/Terraform/admin_password.txt"
}



terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}





resource "local_file" "ip" {
  content = var.list_ip_addresses[0]
  filename = "/home/ivan111/Terraform/ip_addresses.txt"
}





resource "local_file" "surname" {
  content = var.surname_name
  filename = "/home/ivan111/Terraform/personal_info.txt"
}





resource "local_file" "unique" {
  content = var.unique_ids[0]
  filename = "/home/ivan111/Terraform/unique_ids.txt"
}

