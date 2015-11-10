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
