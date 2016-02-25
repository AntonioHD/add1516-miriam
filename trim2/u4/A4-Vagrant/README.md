#1. Introducción

En esta práctica vamos a trabajar con Vagrant, es una herramienta para la creación y configuración de entornos de desarrollo virtualizados.

#2. Primeros pasos

##2.1. Instalar

Para instalar vagrant hay varias formas, nosotros vamos a usar un paquete preparado para descargar del servidor Leela.

##2.2. Proyecto

Creamos un directorio para nuestro proyecto vagrant y ejecutamos el siguiente comando para iniciar la configuración de la máquina:

![imagen](images/1.png)

##2.3. Imagen, caja o box

Ahora necesitamos obtener una imagen de un sistema operativo, hemos descargado la nuestra desde la dirección siguiente: 'vagrant box add micajaXX_ubuntu_precise32 http://files.vagrantup.com/precise32.box'.
Podemos listar las cajas disponibles en nuestro sistema con 'vagrant box list'. Para poder usar una caja determinada en nuestro proyecto, modificamos el fichero 'Vagrantfile' de la carpeta del proyecto.

![imagen](images/2.png)

##2.4. Iniciar la máquina

Vamos a iniciar la máquina virtual creada con Vagrant:

![imagen](images/3.png)

Ejecutando 'vagrant ssh' podemos conectarnos con nuestra máquina virtual:

![imagen](images/4.png)

Comprobamos en VirtualBox como la máquina está creada y funcionando:

![imagen](images/5.png)

Una vez creada la máquina y funcionando se crea el siguiente directorio:

![imagen](images/6.png)

#3. Configuración

##3.1. Carpetas sincronizadas

La carpeta del proyecto que contiene el Vagrantfile comparte los archivos entre el sistema anfitrión y el virtualizado, esto nos permite compartir archivos fácilmente entre los ambientes. Cualquier archivo que coloquemos en este directorio será accesible desde cualquiera de los 2 extremos.

![imagen](images/66.png)

##3.2. Redireccionamiento de los puertos

Uno de los casos más comunes cuando tenemos una máquina virtual es la situación que estamos trabajando con proyectos enfocados a la web, y para acceder a las páginas no es lo más cómodo tener que meternos por terminal al ambiente virtual y llamarlas desde ahí, aquí entra en juego el enrutamiento de puertos.
Modificamos el fichero Vagrantfile, de modo que el puerto 4567 del sistema anfitrión será enrutado al puerto 80 del ambiente virtualizado.
**Más adelante comprobaremos que el redireccionamiento funciona, cuando tengamos instalado el servidor local.**

![imagen](images/7.png)

#4. Suministro
 
##4.1. Suminustro mediante script

Suministraremos al ambiente virtual con un pequeño script que instale Apache. Creamos el script 'install_apache.sh', dentro del proyecto:

![imagen](images/8.png)

Modificamos el 'Vagrantfile' y agregamos la siguiente línea de configuración:

![imagen](images/9.png)

![imagen](images/10.png)

![imagen](images/11.png)

![imagen](images/12.png)

![imagen](images/13.png)

![imagen](images/14.png)

![imagen](images/15.png)

![imagen](images/16.png)

#3. Instalación y configuración del cliente1

Instalamos Agente Puppet en el cliente, el cliente debe saber quien es su master por lo tanto añadimos a /etc/puppet/puppet.conf la siguiente línea:

![imagen](cli4.png)

Comprobamos servicios:

![imagen](cli6.png)
