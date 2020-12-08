provider "vsphere" {
  user           = "administrator@vsphere.local"
  password       = "passwd"
  vsphere_server = "192.168.0.7"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}
