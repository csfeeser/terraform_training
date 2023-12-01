variable "cool_peeps" {
  default = ["Bobby", "Joe", "Rod", "Steve", "Tirumal", "Tony_D.", "Tony_S."]
}

resource "local_file" "dem_files_tho" {
  for_each = toset(var.cool_peeps)
  content  = templatefile("${path.module}/facts.tpl", { peep_name = each.value })
  filename = "${path.module}/peep_files/${each.value}_fact.txt"
}
