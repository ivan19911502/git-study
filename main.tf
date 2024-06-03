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

resource "time_static" "time" {
}


resource "local_file" "time1" {
  content = time_static.time.id
  filename = "time1.txt"
}


resource "local_file" "time2" {
  content = time_static.time.id
  filename = "time2.txt"
}

resource "local_file" "time3" {
  content = time_static.time.id
  filename = "time3.txt"
}