#!/usr/bin/ruby
#encoding: utf-8

usuario= `whoami`
user = usuario.chop

if user != "root"
	puts 'Usuario no es root'
	exit
end

resultado = `cat userslist.txt`
users = resultado.split("\n")

users.each do |user|
	datos=user.split(":")
	
	if datos[2] == ""
		puts "El usuario #{datos[0]} no tiene correo"
	else
		if datos[4] == "add"
			system("useradd #{datos[0]}")
			puts "El usuario #{datos[0]} está creado"
		else if datos[4] == "delete"
			system("userdel #{datos[0]}")
			puts "El usuario #{datos[0]} se ha borrado"
		end
		end
	end

end

puts "Script terminado"

