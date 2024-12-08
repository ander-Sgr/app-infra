# Infraestructura de la Aplicación

Este documento describe cómo generar la infraestructura utilizando Terraform, tanto en el entorno de desarrollo (dev) como en el entorno de producción (prod). También se explica cómo realizar la conexión SSH a través del bastión y la copia de la clave a las instancias de la red privada.

## Arquitectura en AWS

![Arquitectura en AWS](docs/images/AWS%20Arquitectura.drawio.png)

## Requisitos Previos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- Acceso a las credenciales de la nube.
- Clave SSH configurada.

## Variables de Entorno

Asegúrate de definir las variables de entorno necesarias para cada entorno (dev y prod). Puedes utilizar un archivo `.tfvars` para cada entorno:

- `envs/dev/dev.tfvars`
- `envs/prod/prod.tfvars`

Ejemplo de variables:

```hcl
# dev.tfvars
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
```

```hcl
# prod.tfvars
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
```

## Generar Infraestructura

### Entorno de Desarrollo

1. Inicializa el directorio de trabajo de Terraform:

    ```sh
    terraform init
    ```

2. Aplica la configuración de Terraform para el entorno de desarrollo:

    ```sh
    terraform apply -var-file="dev.tfvars"
    ```

### Entorno de Producción

1. Inicializa el directorio de trabajo de Terraform:

    ```sh
    terraform init
    ```

2. Aplica la configuración de Terraform para el entorno de producción:

    ```sh
    terraform apply -var-file="prod.tfvars"
    ```

## Conexión SSH a través del Bastión

Para conectarte a una instancia en la red privada a través del bastión, sigue estos pasos:

1. Conéctate al bastión:

    ```sh
    ssh -i /path/to/your/private/key user@bastion-ip
    ```

2. Desde el bastión, conéctate a la instancia en la red privada:

    ```sh
    ssh -i /path/to/your/private/key user@private-instance-ip
    ```

## Copia de Clave a las Instancias de la Red Privada

Para copiar la clave SSH a las instancias en la red privada, puedes usar el comando `scp` a través del bastión:

1. Copia la clave desde tu máquina local al bastión:

    ```sh
    scp -i /path/to/your/private/key /path/to/your/private/key user@bastion-ip:/tmp/
    ```

2. Conéctate al bastión:

    ```sh
    ssh -i /path/to/your/private/key user@bastion-ip
    ```

3. Desde el bastión, copia la clave a la instancia en la red privada:

    ```sh
    scp -i /tmp/private/key /tmp/private/key user@private-instance-ip:/home/user/.ssh/
    ```

Con esto podrías conecarte a la instancias de la red privada. Por defecto ya se instala docker en las instancias de la red privada.