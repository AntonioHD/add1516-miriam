#!/usr/bin/ruby
#encoding: utf-8

usuario= `whoami`
user = usuario.chop

if user != "root"
	puts 'Usuario no es root'
	exit
end

software = `cat software-list.txt`
packages = software.split("\n")

packages.each do |package|
	data=package.split(":")
	
	check= `dpkg --get-selections | grep -w #{data[0]}`
	
	if data[1] == "remove" || data[1]=="r"
		if check == ""
			puts "El paquete #{data[0]} no se puede eliminar, no está instalado"
		else
			system("apt-get remove -y #{data[0]}")
			puts "El paquete #{data[0]} se ha desinstalado"
		end
		
	elsif data[1] == "install" || data[1]=="i"
		if check == ""
			system("apt-get install -y #{data[0]}")
			puts "El paquete #{datos[0]} se ha instalado"
		else
			puts "El paquete #{data[0]} ya está instalado"
		end
	end
end
