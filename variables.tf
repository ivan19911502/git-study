variable "list_ip_addresses" {
  type    = list(string)
  default = ["192.168.1.1, 192.168.1.2, 192.168.1.3"]
}


variable "surname_name" {
  type    = string
  default = "Ivan Ivanov"
}


variable "unique_ids" {
  type    = list(string)
  default = ["UID123, UID456, UID789"]
}
