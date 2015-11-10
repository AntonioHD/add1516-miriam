# 1. Introducción
En esta práctica vamos a trabajar con el servicio SSH, este servicio es un protocolo, y sirve para acceder a máquinas remotas a través de una red. 
Para esta práctica necesitaremos las siguientes 3 MVs:

- Un servidor GNU/Linux OpenSUSE, con IP estática (172.18.8.53).
- Un cliente GNU/Linux OpenSUSE, con IP estática (172.18.8.54).
- Un cliente Windows7, con IP estática (172.18.8.13).

# 2. Configurar máquinas
Comenzamos preparando las diferentes interfaces de red en las máquinas. Para configurar la red en OpenSuse usaremos el interfaz gráfico 'yast':
## 2.1. Servidor SSH
Introducimos la IP de nuestro server:

![imagen](files/01.png)

Nuestro nombre de host y de equipo, también DNS:

![imagen](files/02.png)

Por último, nuestra puerta de enlace:

![imagen](files/03.png)

Ejecutamos los siguientes comandos para verificar que hemos configurado los nombres bien:

![imagen](files/04.png)

Los siguiente sería crear 4 usuarios en el servidor, utilizaremos nuestro apellido:

![imagen](files/05.png)

Añadir en /etc/hosts los equipos ssh-client1 y ssh-client2-08 para que puedan comunicarse:

![imagen](files/06.png)

Para comprobar nuevamente los cambios realizados, introducimos los siguientes comandos:

![imagen](files/07.png)

![imagen](files/08.png)

Para comprobar, realizamos un ping entre las tres máquinas y comprobamos la conexión:

![imagen](files/pingserver.png)

## 2.2. Cliente Opensuse

Configurar el cliente1 con los siguientes valores:

Nombre de equipo ssh-client1, dominio mendez. Configuramos IP.

![imagen](files/client1.png)

![imagen](files/client12.png)

![imagen](files/client13.png)

También añadimos el servidor y el cliente windows al fichero /etc/hosts.

![imagen](files/client14.png)

Por último, hacemos ping entre las máquinas para comprobar la conexión.

![imagen](files/pingclient1.png)

# 2.3. Cliente Windows

En el cliente Windows vamos a descargar PuTTy como cliente ssh. Y configuramos la interfaz de red de la siguiente manera:

![imagen](files/client21.png)

También debemos añadir las otras dos máquinas: cliente linux y servidor al fichero 'hosts'.

![imagen](files/cilent22.png)

Debemos realizar ping hacia las dos máquinas que añadimos al fichero anterior, para comprobar:

![imagen](files/pingwindows.png)

# 3. Instalación servicio SSH

![imagen](files/09.png)

## 3.1. Comprobación

![imagen](files/system.png)

## 3.2. Conexión SSH desde cliente

Debemos comprobar en el servidor la configuración del cortafuegos, y añadir en servicios autorizados el ssh.

![imagen](files/12.png)

Conexión SSH desde cada cliente usando el usuario rodriguez1, desde ssh-client1:

![imagen](files/client15.png)

Conexión SSH desde ssh-client2 Windows:

![imagen](files/client23.png)

![imagen](files/client24.png)

## 3.3. Cambiando claves del servidor

# 4. Personalización prompt Bash

# 5. Autenticación mediante claves públicas



