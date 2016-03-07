#!/usr/bin/ruby
#encoding: utf-8

require 'rainbow/ext/string'
Rainbow.enabled = true

def controlar_procesos(name, action)
	check = `ps -ef| grep #{name}| grep -v grep`
	
	if (action == "kill" or action == "k") and check != ""
		system("kill -9 #{name}")
		puts "_KILL_: Proceso #{name} eliminado".color(:red)
	elsif (action == "notify" or action == "n") and check != ""
		puts "NOTICE: Proceso #{name} en ejecución".color(:green) 
	end
end

usuario = `whoami`
user = usuario.chop

if user != "root"
	puts 'Usuario no es root'.color(:orange)
	exit
end

fichero = `cat processes-black-list.txt`
lineas = fichero.split("\n")

#lineas.each do |linea|
#	datos = linea.split(":")
#	controlar_procesos(datos[0], datos[1])
#end



while (File.exist?"state.running") do
	lineas.each do |linea|
		datos = linea.split(":")
		controlar_procesos(datos[0], datos[1])
	end
	sleep(5)
end
