#1. Introducción

Existen varias herramientas para realizar instalaciones desde un punto central, como Chef, Ansible, CFEngine, etc. En este ejemplo, vamos a usar Puppet. Puppet es una herramienta diseñada para administrar la configuración de sistemas Unix-like y de Microsoft Windows de forma declarativa. El usuario describe los recursos del sistema y sus estados, ya sea utilizando el lenguaje declarativo de Puppet o un DSL (lenguaje específico del dominio) de Ruby.

#1.1. Configuración

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



![imagen](w1.png)

![imagen](w2.png)

![imagen](w3.png)








