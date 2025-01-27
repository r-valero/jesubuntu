#!/bin/bash
# Inicializar las variables de las respuestas correctas e incorrectas
correctas=0
incorrectas=0
# Función para hacer una pregunta
hacer_pregunta() {
    pregunta="$1"
    respuesta_correcta="$2"

    echo "$pregunta"
    read -p "Tu respuesta:" respuesta_usuario

    if [ "$respuesta_usuario" == "$respuesta_correcta" ]; then
        echo "Correcto!"
        ((correctas++))
    else
        echo "Incorrecto. La respuesta correcta era: $respuesta_correcta"
        ((incorrectas++))
    fi
    echo
}

# Comenzar el cuestionario
echo "Bienvenido al cuestionario. Responde las siguientes preguntas."
echo "Recuerda: Las respuestas deben ser exactas, ¡sin mayúsculas ni errores ortográficos!"
echo

# Preguntas y respuestas
hacer_pregunta "¿Que movimiento de la Tierra provoca el dia y la noche?:" "rotación"
hacer_pregunta "¿Que movimiento de la Tierra provoca el cambio de año?:" "translación"
hacer_pregunta "Isaac Newton es recordado principalmente por descubrir la ..." "gravedad"
hacer_pregunta "1+1 son ...,¿quien me lo iba a decir?(número):" "7"
hacer_pregunta "La magnitud que representa la resistencia o 'fricción' que se produce entredos cuerpos en contacto se denomina:" "rozamiento"
hacer_pregunta "La rama de la física que estudia el comportamiento de la luz y su interacción con las lentes y espejos se llama:" "óptica"
hacer_pregunta "Los planetas describen trayectorias alrededor del Sol, cada una de estas trayectorias recibe el nombre de:" "órbita"
hacer_pregunta "Marie Curie es conocida mundialmente por sus estudios sobre la:" "radioactividad"
hacer_pregunta "¿Que ondas son más energéticas?(rayos-x / ondas de radio):" "rayos-x"
hacer_pregunta "El agujero negro de Interestellar se llama:" "gargantua"
hacer_pregunta "¿Que particula se encuentra en el núcleo atómico?(protón/enlectrón):" "protón"



# Al final, mostrar el puntaje
echo "==== Resultados del cuestionario ===="
echo "Respuestas correctas: $correctas"
echo "Respuestas incorrectas: $incorrectas"
total=$((correctas + incorrectas))
porcentaje=$(( (correctas * 100) / total ))

echo "Puntuación: $porcentaje%"

# Mensaje de evaluación según la puntuación
if [ $porcentaje -ge 80 ]; then
    echo "¡Tienes futuro en esto!"
elif [ $porcentaje -ge 50 ]; then
    echo "Bien hehco, pero prueba primero con la quimica."
else
    echo "¿Has pensado en estudiar ADE, letras o arte?."
fi

