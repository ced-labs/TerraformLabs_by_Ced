## 🚀 Descripción
Mantener consistencia entre los entornos productivos y los entornos previos, es una necesidad que cualquier organización tiene, con este proyecto, es posible usar las cualidades de Terraform para crear backups consistentes y veloces en GCP.

## 🎖️ Diccionario
    - PO = Proyecto de Origen = production
    - PDs = Proyecto de Destino = preproduction

- ## Pasos que se realizan siguiendo la lógica de TF
    - En PD:
        - Eliminar el disco previo
    - En PO:
        - Reemplazar snapshot de los discos y compartirla a PD
    - En PDs:
        - Crear los discos en base a los snapshots
        - Montar disco nuevo

- ## MVs
    - srv01

- ## Discos
    - srv01-data

- ## Snapshots resultantes
    - srv01-data

## 👀 Anotaciones
    - Cualquier disco que se quiera añadir en esta automatización debe:
        - Declararse en el código
        - Realizar el import al tfstate, ejemplo: (terraform import module.XXX.google_compute_disk.disk_from_snapshot_xxxx_to_env xxx-yyyyyy/region/disk_name_gcp)
    - Si no se quisiera continuar con esta forma de BKP, se debe primero eliminar (tf state rm) cualquier disco del estado de Terraform y después destruir el proyecto. Esto se hace para que Terraform elimine los snapshot (si los hubiera) o las schedule pero no los discos en si.