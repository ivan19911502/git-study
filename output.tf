output list_ip_addresses {
  value = local_file.ip.id
  description = "record"
}


output surname_name {
  value = local_file.surname.id
  description = "record"
}



output unique_ids {
  value = local_file.unique.id
  description = "record"
}

