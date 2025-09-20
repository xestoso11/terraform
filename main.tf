terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc03"

    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure     = true
  pm_parallel         = 2
}

# ---------- CREACIÓN DE MASTERS ----------
resource "proxmox_vm_qemu" "masters" {
  count       = var.masters_count
  name        = "k8s-master-${count.index + 1}"
  target_node = var.target_node
  clone       = var.template_name
  full_clone  = true
  onboot      = true
  agent       = 1
  tags        = "k8s,master,terraform,ubuntu,linux"

  memory  = var.master_memory
  scsihw  = "virtio-scsi-pci"

  cpu {
    sockets = 1
    cores   = var.master_cores
  }

  disk {
    slot    = "scsi0"
    size    = var.master_disk_size
    type    = "disk"
    storage = var.storage
  }
  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.storage
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  ipconfig0  = "ip=${var.ip_masters[count.index]},gw=${var.gateway}"
  sshkeys    = var.ssh_public_key
  ciuser     = var.uservm
  cipassword = var.passvm
}

# ---------- CREACIÓN DE WORKERS ----------
resource "proxmox_vm_qemu" "workers" {
  count       = var.workers_count
  name        = "k8s-worker-${count.index + 1}"
  target_node = var.target_node
  clone       = var.template_name
  full_clone  = true
  onboot      = true
  agent       = 1
  tags        = "k8s,worker,terraform,ubuntu,linux"

  memory  = var.worker_memory
  scsihw  = "virtio-scsi-pci"

  cpu {
    sockets = 1
    cores   = var.master_cores
  }

  disk {
    slot    = "scsi0"
    size    = var.worker_disk_size
    type    = "disk"
    storage = var.storagewk
  }
  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.storage
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  ipconfig0  = "ip=${var.ip_workers[count.index]},gw=${var.gateway}"
  sshkeys    = var.ssh_public_key
  ciuser     = var.uservm
  cipassword = var.passvm
}
