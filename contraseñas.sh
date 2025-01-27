#!/bin/bash
archivo="contraseñas.txt"
while true; do
	echo "========================"
	echo "1.Generar una contraseña"
	echo "2.Salir"
	read -p "Elige una opción: " opcion
	echo "========================"

	case $opcion in

		1)
		#Pedir longitud de la contreseña al usuario
		read -p "Introduce la longitud de la contraseña (8-32): " longitud

		if [[ ! $longitud =~ ^[0-9]+$ ]] || [[ $longitud -lt 8 ]] || [[ $longitud -gt 32 ]]; then
		echo "Error.Introduce un número del 1 al 32"
		continue
		fi

		read -p "¿Introducir mayúsculas?(si/no)" mayusculas
		read -p "¿Introducir números?(si/no)" numeros
		read -p "¿Introducir carácteres especiales?" especiales

		#Validar que cumpla alguna de las opciones mencionadas
		#Mínimo 1 opción
		if [[ $mayusculas != "si" && $numeros != "si" && $especiales != "si" ]]; then
		echo "La contraseña debe contar con al menos un tipo de dígito"
		continue
		fi

		minusculas="qwertyuiopasdfghjklñzxcvbnm"
		caracteres=$minusculas

		if [[ $mayusculas == "si" ]]; then
		caracteres+="QWERTYUIOPÑLKJHGFDSAZXCVBNM"
		fi

		if [[ $numeros == "si" ]]; then
		caracteres+="0123456789"
		fi

		if [[ $especiales == "si" ]]; then
		caracteres+="ª!·$%&/()=?¿*;:_\|@#~¬\]}{,.-ḉ+¡'<>"
		fi

		#Generamos la contraseña de manera aleatoria
		password=""
		for ((i=0; i<longitud; i++));do
		rand=$((RANDOM% ${#caracteres}))
		password+="${caracteres:$rand:1}"
		done

		echo "Tu contraseña generada es: $password"
		echo "$password" >> $archivo
		sleep 1
		;;
		2)
		echo "Saliendo del sistema"
		exit 0
		;;
		*)
		echo "Introduzca una opción válida (1/2)"

	esac
done
