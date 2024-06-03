



resource "null_resource" "generate_file" {
  provisioner "local-exec" {
    command = "echo ${var.instance_size == "small" ? "1 срu" : "4 срu"} > instance_info.txt"
  }
}

