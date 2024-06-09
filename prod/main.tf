module "prod_web_server_config" {
  source = "/Users/jcuke/git/git-study/modules/web_server"
  filename = var.filename
  file_permission = var.file_permission
  content = "${var.server_ip} ${var.server_name} ${var.server_port}"
}