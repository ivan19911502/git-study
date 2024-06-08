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


resource "local_file" "file1" {
  filename = "file1.txt"
  content  = data.local_file.source.content
}

resource "local_file" "file2" {
  filename = "file2.txt"
  content  = data.local_file.source.content
}

resource "local_file" "file3" {
  filename = "file3.txt"
  content  = data.local_file.source2.content
}

data "local_file" "source" {
  filename = "./source.txt"
}

data "local_file" "source2" {
  filename = "./source2.txt"
}