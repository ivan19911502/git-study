resource "local_file" "web_server_config" {
    filename = var.filename
    content = var.content
    file_permission = var.file_permission
  
}