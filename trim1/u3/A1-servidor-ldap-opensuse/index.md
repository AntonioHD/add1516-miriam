#1. Servidor LDAP - OpenSUSE

En esta práctica vamos a trabajar con LDAP, es un protocolo de tipo cliente-servidor para acceder a un servicio de directorio, esto es, acceder a bases de información de usuarios de una red mediante protocolos TCP/IP. En este caso trabajaremos con distribuciones Linux, concretamente OpenSUSE.

##1.1. Preparativos

Capturar salida de los comandos siguientes en el servidor:

![imagen](images/15.png)

![imagen](images/16.png)

En /etc/hosts añadiremos las siguientes líneas:

![imagen](images/8.png)

##1.2. Instalación del Servidor LDAP

A continuación, vamos a instalar el servidor LDAP, para ello es necesario abrir Yast y buscar un paquete llamado 'yast2-auth-server'. Una vez instalado pasaremos a configurarlo.

![imagen](images/2.png)

![imagen](images/3.png)

![imagen](images/4.png)

![imagen](images/5.png)

![imagen](images/6.png)

![imagen](images/7.png)

![imagen](images/9.png)

![imagen](images/16.png)

##1.3. Crear usuarios y grupos en LDAP

![imagen](images/10.png)

![imagen](images/11.png)

![imagen](images/12.png)

![imagen](images/13.png)

![imagen](images/14.png)

##1.4. Autenticación

![imagen](images/17.png)

![imagen](images/18.png)


#2. Otro equipo



##2.1. Preparativos



##2.2. Configuración
