# Terraform Proxmox Cluster

Este proyecto utiliza [Terraform](https://www.terraform.io/) para desplegar un clúster de máquinas virtuales (masters y workers) en [Proxmox](https://www.proxmox.com/), ideal para entornos de Kubernetes.

## Estructura

- `main.tf`: Recursos principales y configuración de Proxmox.
- `variables.tf`: Variables parametrizables para el despliegue.
- `outputs.tf`: Salidas con información de las VMs creadas.
- `.gitignore`: Archivos ignorados por git.
- `LICENSE`: Licencia Apache 2.0.

## Requisitos

- Terraform >= 1.0
- Proveedor [telmate/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest)
- Acceso a un servidor Proxmox con una plantilla de VM configurada.

## Uso

1. Clona el repositorio.
2. Configura las variables sensibles en un archivo `terraform.tfvars` (no lo subas al repositorio).
3. Inicializa Terraform:

   ```sh
   terraform init
   ```

4. Revisa el plan de despliegue:

   ```sh
   terraform plan
   ```

5. Aplica la infraestructura:

   ```sh
   terraform apply
   ```

## Variables principales

Consulta [`variables.tf`](variables.tf) para ver todas las variables disponibles y sus valores por defecto.

## Salidas

Al finalizar, obtendrás las IPs y nombres de las VMs creadas en los outputs:

- `masters_info`
- `workers_info`

## Recomendaciones y advertencias

**Importante:** Si despliegas todas las máquinas virtuales usando un solo disco duro (HDD), puedes experimentar problemas de rendimiento y posibles bloqueos, especialmente en entornos con múltiples VMs (masters y workers). Se recomienda utilizar discos SSD o distribuir las VMs en diferentes discos físicos para mejorar la estabilidad y el rendimiento del clúster.


## Licencia

Este proyecto está bajo la licencia Apache 2.0. Consulta [`LICENSE`](LICENSE) para más detalles.