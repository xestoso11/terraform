output "masters_info" {
  value = {
    for m in proxmox_vm_qemu.masters :
    m.name => m.ipconfig0
  }
}

output "workers_info" {
  value = {
    for w in proxmox_vm_qemu.workers :
    w.name => w.ipconfig0
  }
}
