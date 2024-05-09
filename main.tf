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

