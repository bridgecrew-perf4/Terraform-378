# VMware VMs configuration #
vm-count = "1"
vm-name = "Terraform_Test"
vm-template-name = "CentOS8_Default"
vm-cpu = "1"
vm-ram = "2048"
vm-guest-id = "CentOS 8"

# VMware vSphere configuration 

## VMware vCenter IP/FQDN
vsphere-vcenter = "110.45.212.249"

# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@vm.vcenter"

# VMware vSphere password used to deploy the infrastructure
vsphere-password = ""

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "Datacenter"

# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "cluster01"

# vSphere Datastore used to deploy VMs 
vm-datastore = "datastore250"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"# Linux virtual machine domain name
#vm-domain = ""
