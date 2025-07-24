variable "proxmox_api_url" {
  default = "https://proxmox:8006/api2/json"
}

variable "proxmox_token_id" {}

variable "proxmox_token_secret" {}

variable "template_name" {
  default = "template"
}

variable "target_node" {
  default = "proxmox"
}

# Recursos para masters
variable "masters_count" {
  type = number
  default = 3
}

variable "master_cores" {
  type = number
  default = 4
}

variable "master_memory" {
  type = number
  default = 4096
}

variable "master_disk_size" {
  default = "32G"
}

# Recursos para workers
variable "workers_count" {
  type = number
  default = 2
}

variable "worker_cores" {
  type = number
  default = 8
}

variable "worker_memory" {
  type = number
  default = 8192
}

variable "worker_disk_size" {
  default = "50G"
}

variable "storage" {
  default = "storage_name"
}

variable "storagewk" {
  default = "storage_namewk"
}

variable "network_bridge" {
  default = "vmbr0"
}

variable "uservm" {
  default = "user"
}

variable "passvm" {
  description = "Pass user vm para inyectar en cloud-init"
  default = "password"
}

variable "ssh_public_key" {
  description = "Llave pública para inyectar en cloud-init"
}

variable "ip_masters" {
  type    = list(string)
  default = ["11.11.11.11/24"]
}

variable "ip_workers" {
  type    = list(string)
  default = ["11.11.11.11/24"]
}

variable "gateway" {
  type    = string
  default = "11.11.11.1"
}
 
