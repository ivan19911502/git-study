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


resource "local_file" "backup_file" {
  filename   = "./backup.txt"
  content    = local_file.log_file.id
  depends_on = [local_file.log_file]
  lifecycle {
    prevent_destroy = true
  }
}

resource "local_file" "log_file" {
  filename = "./log.txt"

}

resource "local_file" "count_file" {
  count    = 3
  filename = "./file-${count.index + 1}"
  content  = local_file.log_file.id
}

resource "local_file" "each_file" {
  for_each = tomap(var.files)
  filename = "./${each.key}.txt"
  content  = each.value
}
