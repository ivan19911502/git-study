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
  filename = "/home/ivan111/Terraform/git-study/ip_addresses.txt"

  depends_on = [
    local_file.ip
  ]

}





resource "local_file" "surname" {
  content = var.surname_name
  filename = "/home/ivan111/Terraform/git-study/personal_info.txt"
  
  depends_on = [
    local_file.surname
  ]
}





resource "local_file" "unique" {
  content = var.unique_ids[0]
  filename = "/home/ivan111/Terraform/git-study/unique_ids.txt"
  
  depends_on = [
    local_file.unique
  ]
}

