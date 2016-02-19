#1. Introducción

Existen varias herramientas para realizar instalaciones desde un punto central, como Chef, Ansible, CFEngine, etc. En este ejemplo, vamos a usar Puppet. Puppet es una herramienta diseñada para administrar la configuración de sistemas Unix-like y de Microsoft Windows de forma declarativa. El usuario describe los recursos del sistema y sus estados, ya sea utilizando el lenguaje declarativo de Puppet o un DSL (lenguaje específico del dominio) de Ruby.

#1.1. Configuración

**Nota:** cada MV debe tener configurada en su /etc/hosts al resto, para poder hacer ping entre ellas usando los nombres.

a) MV1 - master: Dará las órdenes de instalación/configuración a los clientes.

Comprobamos que las configuraciones son correctas ejecutando los comandos siguientes:

![imagen](images/1.png)

![imagen](images/2.png)

![imagen](images/3.png)

![imagen](images/4.png)

