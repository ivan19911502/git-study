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


variable "cloud_users_list" {
  type = list
  default = [
    "andrew", "ken", "faraz", "mutsumi", "peter", "steve", "braja"
  ]
}


variable "media" {
  type = list
  default = [ 
    "/media/tails.jpg",
    "/media/eggman.jpg",
    "/media/ultrasonic.jpg",
    "/media/knuckles.jpg",
    "/media/shadow.jpg",
  ]
}

variable "sf_subset" {
  type = string
  default = (
    "ryu, ken, akuma, seth, zangief, poison, gen, oni, thawk, fang, rashid, birdie, sagat, bison, cammy, chun-li, balrog, cody, rolento, ibuki"
  )
}


variable "sf_map" {
  type = map
  default = {
    "ryu" = "true", 
    "ken" = "true", 
    "akuma" = "true",
    "seth" = "true", 
    "zangief" = "true",
    "poison" = "true",
    "gen" = "true",
    "oni" = "true", 
    "thawk" = "true", 
    "fang" = "true",
    "rashid" = "true", 
    "birdie" = "true", 
    "sagat" = "true", 
    "bison" = "true", 
    "cammy" = "true",
    "chun-li" = "true", 
    "balrog" = "true", 
    "cody" = "true", 
    "rolento" = "true", 
    "ibuki" = "false"
  }
  description = "record"
}


variable "reversed_sf" {
  type = list(string)
  default = [
    "ryu", "ken", "akuma", "seth", "zangief",
    "poison", "gen", "oni", "thawk", "fang",
    "rashid", "birdie", "sagat", "bison", "cammy",
    "chun-li", "balrog", "cody", "rolento", "ibuki"
  ]
}