#===========================#
# VMware vCenter connection #
#===========================#

variable "vsphere-user" {
type = string
description = "vCenter/vSphere 계정"
}

variable "vsphere-password" {
type = string
description = "vCenter/vSphere 패스워드"
}

variable "vsphere-vcenter" {
type = string
description = "vCenter/vSphere 서버 FQDN / IP"
}

variable "vsphere-unverified-ssl" {
type = string
description = "자체 서명 된 인증서를 사용하는 VMware vCenter (true / false)"
}

variable "vsphere-datacenter" {
type = string
description = "VMWare vSphere datacenter 이름"
}

variable "vsphere-cluster" {
type = string
description = "VMWare vSphere cluster 이름"
default = ""
}

variable "vsphere-template-folder" {
type = string
description = "Template folder 이름"
default = "Template"
}

#================================#
# VMware vSphere virtual machine #
#================================#

variable "vm-count" {
type = string
description = "생성 할 VM 갯수"
default     =  1
}

variable "vm-datastore" {
type = string
description = "VMWare vSphere datastore 이름"
}

variable "vm-network" {
type = string
description = "VMWare vSphere Network 이름"
}

variable "vm-cpu" {
type = string
description = "가상머신 CPU 개수"
default = "2"
}

variable "vm-ram" {
type = string
description = "가상머신 Memory 사이즈"
default = "2048"
}

variable "vm-disk" {
type = string
description = "가상머신 Disk 사이즈"
default = "30"
}

variable "vm-name" {
type = string
description = "가상머신 이름"
}

variable "vm-firmware" {
type = string
description = "가상머신 fireware set (efi / bios)"
default = "efi"
}

variable "vm-guest-id" {
type = string
description = "가상머신 OS명"
}

variable "vm-template-name" {
type = string
description = "가상머신을 배포할 템플릿 이름"
}