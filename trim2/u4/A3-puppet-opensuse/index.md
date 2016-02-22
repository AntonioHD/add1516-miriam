#1. Introducción

Existen varias herramientas para realizar instalaciones desde un punto central, como Chef, Ansible, CFEngine, etc. En este ejemplo, vamos a usar Puppet. Puppet es una herramienta diseñada para administrar la configuración de sistemas Unix-like y de Microsoft Windows de forma declarativa. El usuario describe los recursos del sistema y sus estados, ya sea utilizando el lenguaje declarativo de Puppet o un DSL (lenguaje específico del dominio) de Ruby.

##1.1. Configuración

**Nota:** cada MV debe tener configurada en su /etc/hosts al resto, para poder hacer ping entre ellas usando los nombres.

a) MV1 - master: Dará las órdenes de instalación/configuración a los clientes (OpenSuse).

![imagen](1.png)

Comprobamos que las configuraciones son correctas ejecutando los comandos siguientes:

![imagen](2.png)

![imagen](3.png)

![imagen](4.png)

b) MV2 - client1: recibe órdenes del master (OpenSuse).

Comprobamos configuraciones:

![imagen](cli1.png)

![imagen](cli2.png)

![imagen](cli3.png)

c) MV3 - client2: recibe órdenes del master (Windows 7).

Comprobamos configuraciones: 

![imagen](w1.png)

![imagen](w2.png)

![imagen](w3.png)

#2. Primera versión del fichero pp

Instalamos Puppet Master en la MV master08 y lo iniciamos, preparamos los directorios sobre los que vamos a trabajar:

![imagen](5.png)

##2.1. Readme.txt

Creamos el archivo 'Readme.txt' con el siguiente contenido:

![imagen](6.png)

##2.2. Site.pp

Este es el fichero principal de configuración de órdenes para los agentes puppet. Este es su contenido, el cual significa que por defecto todas las máquinas conectadas al master realizarán dicha configuración especificada en 'hostlinux1':

![imagen](7.png)

##2.3. Hostlinux1.pp

Vamos a separar las diferentes configuraciones en distintos ficheros para organizarnos y los vamos a guardar en la ruta /etc/puppet/manifiests/classes/hostlinux1.pp

![imagen](8.png)

Comprobamos los permisos adecuados y reiniciamos el servicio:

![imagen](9.png) 

![imagen](10.png)

Consultamos log por si hay errores:

![imagen](11.png)

#3. Instalación y configuración del cliente1

Instalamos Agente Puppet en el cliente, el cliente debe saber quien es su master por lo tanto añadimos a /etc/puppet/puppet.conf la siguiente línea:

![imagen](cli4.png)

Comprobamos servicios:

![imagen](cli6.png)

#4. Certificados

Antes de que el master acepte al cliente1 como cliente, se deben intercambiar los certificados entre ambas máquinas.

##4.1. Aceptar certificado

Vamos al master y consultamos las peticiones pendientes de unión al master:

![imagen](12.png)

Aceptamos el nuevo cliente desde el master:

![imagen](13.png)

##4.2. Comprobación final

Vamos al cliente1 y reiniciamos la máquina o servicio Puppet. Comprobamos que se han ejecutado las nuevas configuraciones:

![imagen](cli8.png)

#5. Segunda versión del fichero pp

Ya hemos probado una configuración sencilla en PuppetMaster, ahora pasamos a una un poco más compleja:

![imagen](14.png)

Modificamos 'Site.pp':

![imagen](15.png)

Comprobamos en el cliente que la configuración se ha implementado y se ha creado el usuario:

![imagen](cli9.png)

#6. Cliente puppet Windows

Vamos a atender también a un agente Windows.

#6.1. Modificaciones en el Master

En el master vamos a crear una configuración puppet para las máquinas windows, dentro del fichero 'hostwindows3.pp' con el siguiente contenido:

![imagen](16.png)

Modificamos el fichero 'Site.pp' del master para que tenga en cuenta la configuración dle cliente Linux y la de Windows:

![imagen](17.png)

Reiniciamos el servicio PuppetMaster. Comprobamos que se ha creado el fichero, he tenido que cambiar la ruta y ponerlo en el escritorio por conflictos de permisos, no me dejaba crearlo en el disco C:.

![imagen](w7.png)

##6.2. Modificaciones en el cliente2

Vamos a instalar el AgentePuppet en Windows, debemos instalar la misma versión que en el master, reiniciamos. Debemos aceptar el certificado en el master:

![imagen](18.png)

![imagen](19.png)

Iniciamos la consola Puppet como administrador y ejecutamos el comando:

![imagen](w4.png)

Varios comandos intentando crear el certificado:

![imagen](w5.png)

![imagen](w6.png)

Configuramos en el master el fichero 'hostwindows3.pp' para el cliente Windows:

![imagen](20.png)

Intentando ejecutar la nueva configuración me sale el mismo error, 'Acceso Denegado':

**Hablando con los compañeros hemos llegado a la conclusión de que el problema de permisos es por la máquina, estoy utilizando una clonación de Windows 7 con licencia que nos proporcionó Jose. Intentaré instalar Windows 7 desde 0 y realizar las configuraciones.**

![imagen](w8.png)

