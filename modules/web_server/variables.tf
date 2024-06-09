variable "filename" {
  type        = string
  description = "name file config"
}




variable "file_permission" {
  type = number
}

variable "server_ip" {
  type = string
  default = "192.168.100.100"
}

variable "server_port" {
  type = string
  default = "8080"
}

variable "server_name" {
  type = string
  default = "dev"
}

variable "content" {
  type = string
}