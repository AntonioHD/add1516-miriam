#1. Clientes ligeros con LTSP
Esta práctica consiste en configurar un LTSP, Linux Terminal Server Project,que son un conjunto de servidores que proporcionan la capacidad de ejecutar Linux en ordenadores de pocas prestaciones de velocidad o de bajo coste. Con esto se permite reutilizar equipos que se encuentran obsoletos.

#2. Máquina Servidor
Empezamos con la máquina servidor, donde tendremos que configurar la imagen que los clientes usaran para el sistema operativo.
 

##2.1 Preparar Server
El servidor tendrá dos interfaces o adaptadores de red, uno apuntando hacia los clientes ligeros y otro hacia la conexión a internet, ya que tendrá que dar IPs a dichos clientes.
A continuación vemos la configuración de ambas interfaces. Adaptador 1 en modo puente, corresponde con la interfaz eth0.
![imagen](./1.png)  
Adaptador 2 en modo red interna.
![imagen](./2.png)  
Una vez encendida la máquina virtual procedemos a configurar las conexiones de red.
La siguiente imagen muestra como configuré la conexión puente, con una IP dentro del rango de la red de clase para acceder a internet.

![imagen](./3.png)

##2.2 Configurar Server
Lo siguiente es ejecutar ciertos comandos para comprobar la salida de todos ellos.  
En esta primera imagen ejecutamos *ip a* para ver las interfaces.  
![imagen](./4.png)  
![imagen](./5.png)
![imagen](./6.png)  
Creamos tres usuarios.  
![imagen](./7.png)
##2.3 Instalar servicio LTSP
Pasamos a instalar el servicio LTSP. Ejecutamos el comando *apt-get install openssh-server* el ssh sirve para acceder a las máquinas remotas.  
Una vez instalado el servicio ssh, tenemos que editar el archivo */etc/ssh/sshd_config*, para implementar que se ejecute con contraseña de root.

![imagen](./8.png)  
Añadimos la línea *PermitRootLogin yes*.  
![imagen](./9.png)  
Para terminar de instalar el servicio LTSP, ejecutamos *apt-get install ltsp-server-standalone*
![imagen](./10.png)  
Lo siguiente será crear una imagen del sistema operativo partiendo del real *ltsp-build-client*, 
esta imagen se cargará en la memoria de los clientes y actuará de sistema.  
En teoría ya la imagen está creada y las conexiones de red correctas. Debemos comprobar por último que tanto el servicio dhcp como el ftp están operativos.
Lo primero que hice yo fue ejecutar estos dos comandos y comprobar que ambos procesos funcionaban:  
![imagen](./14.png)  
A continuación inicié el cliente, primero configuré la máquina virtual de manera que buscará por la red para arrancar el sistema.  
![imagen](./11.png)  
Una vez iniciada este es el error que me salia:  
![imagen](./13cliente.png)  
No encontraba la imagen en la ruta que estaba configurada por defecto, así que tuve que editar el archivo */etc/ltsp/dhcpd.conf*,
 en este documento primero descomenté la linea *next-server*, y luego modifiqué las rutas para que en vez de que buscara aquí:
 ![imagen](./12revisar.png)  
 Buscara aquí:  
 ![imagen](./16.png)  
 No conseguí que iniciará cambiando las rutas de esa manera, al final la solución fue cambiar *i386* por *amd64*, en las rutas del mismo documento. Una vez hecho esto conseguí que el cliente arrancara.
#3. Máquinas clientes
Para terminar dejo un vídeo demostrando que conseguí acceder al cliente.

![enlace](https://www.youtube.com/watch?v=08sfby7WX_w)
