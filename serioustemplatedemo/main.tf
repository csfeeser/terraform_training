variable "domains" {
  default = ["example.com", "anotherexample.com"]
}

resource "local_file" "config_maker" {
  for_each = toset(var.domains)
                          //${path.module} == the directory our terraform code is in!
  content  = templatefile("${path.module}/apache_config.tpl", { domain = each.value })
  filename = "${path.module}/output/${each.value}_apache_config.conf"
}

