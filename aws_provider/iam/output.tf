output "tf_image_id" {
  value = var.image_id
}

output "tf_availability_zone_names" {
  value = var.availability_zone_names
}

output "tf_ami_id_maps" {
  value = var.ami_id_maps
}

output "tf_first_availability_zone_names" {
  value = var.availability_zone_names[0]
}
