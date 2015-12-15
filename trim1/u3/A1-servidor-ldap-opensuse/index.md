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

Seleccionamos servidor autónomo.

![imagen](images/3.png)

No habilitamos el TLS.

![imagen](images/4.png)

Configuramos la base de datos, dominio, contraseña.

![imagen](images/5.png)

No habilitamos Kerberos, ya que nos dará error más adelante si lo habilitamos.

![imagen](images/6.png)

A continuación, vemos la configuración general ya realizada.

![imagen](images/7.png)

Para comprobar que el servicio está iniciado ejecutamos el comando siguiente:

![imagen](images/9.png)

##1.3. Crear usuarios y grupos en LDAP

Entramos en 'Authentication client' para introducir nuestro dominio.

![imagen](images/10.png)

Para crear los usuarios y grupos lo haremos desde Yast, pero debemos definir un filtro para usuarios de LDAP.

![imagen](images/11.png)

Los creamos:

![imagen](images/12.png)

Creamos también los grupos:

![imagen](images/13.png)

Para visualizar el esquema de lo que hemos configurado, nos descargamos algún browser LDAP, en este caso hemos utilizado 'GQ'.

![imagen](images/14.png)

##1.4. Autenticación

Comprobamos que podemos entrar en la MV servidor usando los usuarios anteriormente definidos. Primero, debemos establecer 'ldap_uri' con nuestro dominio:

![imagen](images/17.png)

Se puede ver como siendo sudo podemos acceder al usuario sin introducir contraseña:

![imagen](images/18.png)

Igual con los otros usuarios:

![imagen](images/19.png)

Sin embargo, sin ser sudo no podemos acceder ni introduciendo la contraseña:

![imagen](images/20.png)

Con el comando 'finger' comprobamos que los home de los usuarios están creados.

![imagen](images/21.png)

Con los siguientes comandos haremos comprobaciones sobre los usuarios de LDAP.

![imagen](images/22.png)

![imagen](images/23.png)

![imagen](images/24.png)

#2. Otro equipo

Ahora que tenemos una máquina con la información cargada en LDAP, vamos a tratar de hacer uso de ella desde una máquina distinta.

##2.1. Preparativos

Aquí dejo captura de las configuraciones realizadas en el slave:

![imagen](images/1c.png)

![imagen](images/2c.png)

![imagen](images/3c.png)

##2.2. Configuración
