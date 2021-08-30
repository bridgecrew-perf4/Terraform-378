# VMware VMs configuration #

vm-count = "1"

vm-name = "gwdev212-226"

vm-template-name = "CentOS7_Default"
vm-cpu = "2"
vm-ram = "8092"
vm-disk = "150"
vm-firmware = "bios"

vm-guest-id = "centos7_64Guest"

# VMware vSphere configuration #

# VMware vCenter IP/FQDN
#vsphere-vcenter = ""

# VMware vSphere username used to deploy the infrastructure
#vsphere-user = ""

# VMware vSphere password used to deploy the infrastructure
#vsphere-password = ""

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "Datacenter"

# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "cluster01"

# vSphere Datastore used to deploy VMs 
vm-datastore = "datastore250"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"
