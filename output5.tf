output cloud_users_list {
  value = var.cloud_users_list
  description = "record"
}

output media {
  value = element(var.media,1)
  description = "record"
}


output sf_map {
  value = lookup(var.sf_map,"fang")
  description = "record"
}

output reversed_sf {
  value = reverse(var.reversed_sf)
  description = "record"
}