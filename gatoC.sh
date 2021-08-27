#!/bin/bash
NARANJA='\033[0;33m'
AZUL='\033[0;34m'
VERDE='\033[0;32m'
ROJO='\033[0;31m'
AMARILLO='\033[1;33m'
BLANCO='\033[1;37m'
CYAN='\033[0;36m'
ESC='\033[0m'
PURPURA='\033[0;35m'


pedir_casilla(){
	if [ $JUGADOR == 1 ] 
	then
		echo -e ""
		echo -e "${NARANJA}Jugador $JUGADOR, elige la casilla que deseas marcar: ${ESC}"
		read CASILLA
		if [ "$CASILLA" -gt "9" ]
		then
			echo "Casilla no valida"
			pedir_casilla
		else
			if [ "${GATO[CASILLA-1]}" == 0 ]
			then
				GATO[CASILLA-1]=1
				let TURNO=TURNO+1
				#echo "$TURNO"
				comprobacion_ganador
				final
			else 
				echo "La casilla ya esta ocupada"
				pedir_casilla
			fi
		fi
		
	fi
	
	if [ $JUGADOR == 2 ] 
	then
		echo -e ""
		echo -e "${AZUL} Jugador $JUGADOR, elige la casilla que deseas marcar: ${ESC}"
		read CASILLA
		if [ "$CASILLA" -gt "9" ]
		then
			echo "Casilla no valida"
			pedir_casilla
		else
			if [ "${GATO[CASILLA-1]}" == 0 ]
			then
				GATO[CASILLA-1]=2
				let TURNO=TURNO+1
				#echo "$TURNO"
				comprobacion_ganador
				final
			else 
				echo "La casilla ya esta ocupada"
				pedir_casilla
			fi
		fi
		
	fi
	
	

}
comprobacion_ganador(){
	if [ "${GATO[0]}" == 1 ] && [ "${GATO[1]}" == 1 ] && [ "${GATO[2]}" == 1 ] 
	then
		GANADOR=1
	fi

	if [ "${GATO[2]}" == 1 ] && [ "${GATO[5]}" == 1 ] && [ "${GATO[8]}" == 1 ] 
	then
		GANADOR=1
	fi
	
	if [ "${GATO[8]}" == 1 ] && [ "${GATO[7]}" == 1 ] && [ "${GATO[6]}" == 1 ] 
	then
		GANADOR=1
	fi

	if [ "${GATO[6]}" == 1 ] && [ "${GATO[3]}" == 1 ] && [ "${GATO[0]}" == 1 ] 
	then
		GANADOR=1
	fi

	if [ "${GATO[0]}" == 1 ] && [ "${GATO[4]}" == 1 ] && [ "${GATO[8]}" == 1 ] 
	then
		GANADOR=1
	fi
	
	if [ "${GATO[6]}" == 1 ] && [ "${GATO[4]}" == 1 ] && [ "${GATO[2]}" == 1 ] 
	then
		GANADOR=1
	fi
	
	if [ "${GATO[1]}" == 1 ] && [ "${GATO[4]}" == 1 ] && [ "${GATO[7]}" == 1 ] 
	then
		GANADOR=1
	fi
	
	if [ "${GATO[3]}" == 1 ] && [ "${GATO[4]}" == 1 ] && [ "${GATO[5]}" == 1 ] 
	then
		GANADOR=1
	fi
	
	
	
	if [ "${GATO[0]}" == 2 ] && [ "${GATO[1]}" == 2 ] && [ "${GATO[2]}" == 2 ] 
	then
		GANADOR=2
	fi
	
	if [ "${GATO[2]}" == 2 ] && [ "${GATO[5]}" == 2 ] && [ "${GATO[8]}" == 2 ] 
	then
		GANADOR=2
	fi
	
	if [ "${GATO[8]}" == 2 ] && [ "${GATO[7]}" == 2 ] && [ "${GATO[6]}" == 2 ] 
	then
		GANADOR=2
	fi
	
	if [ "${GATO[6]}" == 2 ] && [ "${GATO[3]}" == 2 ] && [ "${GATO[0]}" == 2 ] 
	then
		GANADOR=2
	fi

	if [ "${GATO[0]}" == 2 ] && [ "${GATO[4]}" == 2 ] && [ "${GATO[8]}" == 2 ] 
	then
		GANADOR=2
	fi

	if [ "${GATO[6]}" == 2 ] && [ "${GATO[4]}" == 2 ] && [ "${GATO[2]}" == 2 ] 
	then
		GANADOR=2
	fi

	if [ "${GATO[1]}" == 2 ] && [ "${GATO[4]}" == 2 ] && [ "${GATO[7]}" == 2 ] 
	then
		GANADOR=2
	fi

	if [ "${GATO[3]}" == 2 ] && [ "${GATO[4]}" == 2 ] && [ "${GATO[5]}" == 2 ] 
	then
		GANADOR=2
	fi
}
final(){
	if [ $TURNO == 9 ] && [ $GANADOR == 0 ]
	then
		clear
		imprimir
		echo -e ""
		echo -e "${ROJO}Empate${ESC}"
		FING=1
	fi
	
	if [ "$GANADOR" == "1" ]
	then
		clear
		imprimir
		echo -e ""
		echo -e "${VERDE}Gana el jugador 1${ESC}"
		FING=1
	fi
	
	if [ "$GANADOR" == "2" ]
	then
		clear
		imprimir
		echo -e ""
		echo -e "${VERDE}Gana el jugador 2${ESC}"
		FING=1
	fi
}
cuadrantes(){
	if [ "${GATO[0]}" == 0 ]
	then
		C1[0]='       |'
		C1[1]='       |'
		C1[2]='       |'
		C1[3]='       |'
		C1[4]='       |'
		C1[5]='       |'
		C1[6]='_______|'
	fi
	if [ "${GATO[0]}" == 1 ]
	then
		C1[0]='\033[0;33m #   # \033[0m|'
		C1[1]='\033[0;33m  # #  \033[0m|'
		C1[2]='\033[0;33m   #   \033[0m|'
		C1[3]='\033[0;33m  # #  \033[0m|'
		C1[4]='\033[0;33m  # #  \033[0m|'
		C1[5]='\033[0;33m #   # \033[0m|'
		C1[6]='_______|'
	fi
	
	if [ "${GATO[0]}" == 2 ]
	then
		C1[0]='\033[0;34m  ##   \033[0m|'
		C1[1]='\033[0;34m #  #  \033[0m|'
		C1[2]='\033[0;34m #  #  \033[0m|'
		C1[3]='\033[0;34m #  #  \033[0m|'
		C1[4]='\033[0;34m #  #  \033[0m|'
		C1[5]='\033[0;34m  ##   \033[0m|'
		C1[6]='_______|'
	fi
	
	#C1
	if [ "${GATO[1]}" == 0 ]
	then
		C2[0]='       |'
		C2[1]='       |'
		C2[2]='       |'
		C2[3]='       |'
		C2[4]='       |'
		C2[5]='       |'
		C2[6]='_______|'
	fi
	if [ "${GATO[1]}" == 1 ]
	then
		C2[0]='\033[0;33m #   # \033[0m|'
		C2[1]='\033[0;33m  # #  \033[0m|'
		C2[2]='\033[0;33m   #   \033[0m|'
		C2[3]='\033[0;33m  # #  \033[0m|'
		C2[4]='\033[0;33m  # #  \033[0m|'
		C2[5]='\033[0;33m #   # \033[0m|'
		C2[6]='_______|'
	fi
	
	if [ "${GATO[1]}" == 2 ]
	then
		C2[0]='\033[0;34m  ##   \033[0m|'
		C2[1]='\033[0;34m #  #  \033[0m|'
		C2[2]='\033[0;34m #  #  \033[0m|'
		C2[3]='\033[0;34m #  #  \033[0m|'
		C2[4]='\033[0;34m #  #  \033[0m|'
		C2[5]='\033[0;34m  ##   \033[0m|'
		C2[6]='_______|'
	fi
	#C2
	if [ "${GATO[2]}" == 0 ]
	then
		C3[0]='        '
		C3[1]='        '
		C3[2]='        '
		C3[3]='        '
		C3[4]='        '
		C3[5]='        '
		C3[6]='_______ '
	fi
	if [ "${GATO[2]}" == 1 ]
	then
		C3[0]='\033[0;33m #   #  \033[0m'
		C3[1]='\033[0;33m  # #   \033[0m'
		C3[2]='\033[0;33m   #    \033[0m'
		C3[3]='\033[0;33m  # #   \033[0m'
		C3[4]='\033[0;33m  # #   \033[0m'
		C3[5]='\033[0;33m #   #  \033[0m'
		C3[6]='_______ '
	fi
	
	if [ "${GATO[2]}" == 2 ]
	then
		C3[0]='\033[0;34m  ##    \033[0m'
		C3[1]='\033[0;34m #  #   \033[0m'
		C3[2]='\033[0;34m #  #   \033[0m'
		C3[3]='\033[0;34m #  #   \033[0m'
		C3[4]='\033[0;34m #  #   \033[0m'
		C3[5]='\033[0;34m  ##    \033[0m'
		C3[6]='_______ '
	fi
	#c4
	if [ "${GATO[3]}" == 0 ]
	then
		C4[0]='       |'
		C4[1]='       |'
		C4[2]='       |'
		C4[3]='       |'
		C4[4]='       |'
		C4[5]='       |'
		C4[6]='_______|'
	fi
	if [ "${GATO[3]}" == 1 ]
	then
		C4[0]='\033[0;33m #   # \033[0m|'
		C4[1]='\033[0;33m  # #  \033[0m|'
		C4[2]='\033[0;33m   #   \033[0m|'
		C4[3]='\033[0;33m  # #  \033[0m|'
		C4[4]='\033[0;33m  # #  \033[0m|'
		C4[5]='\033[0;33m #   # \033[0m|'
		C4[6]='_______|'
	fi
	
	if [ "${GATO[3]}" == 2 ]
	then
		C4[0]='\033[0;34m  ##   \033[0m|'
		C4[1]='\033[0;34m #  #  \033[0m|'
		C4[2]='\033[0;34m #  #  \033[0m|'
		C4[3]='\033[0;34m #  #  \033[0m|'
		C4[4]='\033[0;34m #  #  \033[0m|'
		C4[5]='\033[0;34m  ##   \033[0m|'
		C4[6]='_______|'
	fi
	#c5
	if [ "${GATO[4]}" == 0 ]
	then
		C5[0]='       |'
		C5[1]='       |'
		C5[2]='       |'
		C5[3]='       |'
		C5[4]='       |'
		C5[5]='       |'
		C5[6]='_______|'
	fi
	if [ "${GATO[4]}" == 1 ]
	then
		C5[0]='\033[0;33m #   # \033[0m|'
		C5[1]='\033[0;33m  # #  \033[0m|'
		C5[2]='\033[0;33m   #   \033[0m|'
		C5[3]='\033[0;33m  # #  \033[0m|'
		C5[4]='\033[0;33m  # #  \033[0m|'
		C5[5]='\033[0;33m #   # \033[0m|'
		C5[6]='_______|'
	fi
	
	if [ "${GATO[4]}" == 2 ]
	then
		C5[0]='\033[0;34m  ##   \033[0m|'
		C5[1]='\033[0;34m #  #  \033[0m|'
		C5[2]='\033[0;34m #  #  \033[0m|'
		C5[3]='\033[0;34m #  #  \033[0m|'
		C5[4]='\033[0;34m #  #  \033[0m|'
		C5[5]='\033[0;34m  ##   \033[0m|'
		C5[6]='_______|'
	fi
	
	#c6
	if [ "${GATO[5]}" == 0 ]
	then
		C6[0]='        '
		C6[1]='        '
		C6[2]='        '
		C6[3]='        '
		C6[4]='        '
		C6[5]='        '
		C6[6]='_______ '
	fi
	if [ "${GATO[5]}" == 1 ]
	then
		C6[0]='\033[0;33m #   #  \033[0m'
		C6[1]='\033[0;33m  # #   \033[0m'
		C6[2]='\033[0;33m   #    \033[0m'
		C6[3]='\033[0;33m  # #   \033[0m'
		C6[4]='\033[0;33m  # #   \033[0m'
		C6[5]='\033[0;33m #   #  \033[0m'
		C6[6]='_______ '
	fi
	
	if [ "${GATO[5]}" == 2 ]
	then
		C6[0]='\033[0;34m  ##    \033[0m'
		C6[1]='\033[0;34m #  #   \033[0m'
		C6[2]='\033[0;34m #  #   \033[0m'
		C6[3]='\033[0;34m #  #   \033[0m'
		C6[4]='\033[0;34m #  #   \033[0m'
		C6[5]='\033[0;34m  ##    \033[0m'
		C6[6]='_______ '
	fi
	
	#c7
	if [ "${GATO[6]}" == 0 ]
	then
		C7[0]='       |'
		C7[1]='       |'
		C7[2]='       |'
		C7[3]='       |'
		C7[4]='       |'
		C7[5]='       |'
		C7[6]='       |'
	fi
	if [ "${GATO[6]}" == 1 ]
	then
		C7[0]='\033[0;33m #   # \033[0m|'
		C7[1]='\033[0;33m  # #  \033[0m|'
		C7[2]='\033[0;33m   #   \033[0m|'
		C7[3]='\033[0;33m  # #  \033[0m|'
		C7[4]='\033[0;33m  # #  \033[0m|'
		C7[5]='\033[0;33m #   # \033[0m|'
		C7[6]='       |'
	fi
	
	if [ "${GATO[6]}" == 2 ]
	then
		C7[0]='\033[0;34m  ##   \033[0m|'
		C7[1]='\033[0;34m #  #  \033[0m|'
		C7[2]='\033[0;34m #  #  \033[0m|'
		C7[3]='\033[0;34m #  #  \033[0m|'
		C7[4]='\033[0;34m #  #  \033[0m|'
		C7[5]='\033[0;34m  ##   \033[0m|'
		C7[6]='       |'
	fi
	
	#c8
	if [ "${GATO[7]}" == 0 ]
	then
		C8[0]='       |'
		C8[1]='       |'
		C8[2]='       |'
		C8[3]='       |'
		C8[4]='       |'
		C8[5]='       |'
		C8[6]='       |'
	fi
	if [ "${GATO[7]}" == 1 ]
	then
		C8[0]='\033[0;33m #   # \033[0m|'
		C8[1]='\033[0;33m  # #  \033[0m|'
		C8[2]='\033[0;33m   #   \033[0m|'
		C8[3]='\033[0;33m  # #  \033[0m|'
		C8[4]='\033[0;33m  # #  \033[0m|'
		C8[5]='\033[0;33m #   # \033[0m|'
		C8[6]='       |'
	fi
	
	if [ "${GATO[7]}" == 2 ]
	then
		C8[0]='\033[0;34m  ##   \033[0m|'
		C8[1]='\033[0;34m #  #  \033[0m|'
		C8[2]='\033[0;34m #  #  \033[0m|'
		C8[3]='\033[0;34m #  #  \033[0m|'
		C8[4]='\033[0;34m #  #  \033[0m|'
		C8[5]='\033[0;34m  ##   \033[0m|'
		C8[6]='       |'
	fi
	
	#c9
	if [ "${GATO[8]}" == 0 ]
	then
		C9[0]='        '
		C9[1]='        '
		C9[2]='        '
		C9[3]='        '
		C9[4]='        '
		C9[5]='        '
		C9[6]='        '
	fi
	if [ "${GATO[8]}" == 1 ]
	then
		C9[0]='\033[0;33m #   #  \033[0m'
		C9[1]='\033[0;33m  # #   \033[0m'
		C9[2]='\033[0;33m   #    \033[0m'
		C9[3]='\033[0;33m  # #   \033[0m'
		C9[4]='\033[0;33m  # #   \033[0m'
		C9[5]='\033[0;33m #   #  \033[0m'
		C9[6]='        '
	fi
	
	if [ "${GATO[8]}" == 2 ]
	then
		C9[0]='\033[0;34m  ##   \033[0m'
		C9[1]='\033[0;34m #  #  \033[0m'
		C9[2]='\033[0;34m #  #  \033[0m'
		C9[3]='\033[0;34m #  #  \033[0m'
		C9[4]='\033[0;34m #  #  \033[0m'
		C9[5]='\033[0;34m  ##   \033[0m'
		C9[6]='       |'
	fi
	
}

imprimir(){
	cuadrantes
	AUX=0
	while [ $AUX -lt 7 ]
		do
			echo -e "           ${C1[AUX]}${C2[AUX]}${C3[AUX]}"
			let AUX=AUX+1
		done
	AUX=0
	while [ $AUX -lt 7 ]
		do
			echo -e "           ${C4[AUX]}${C5[AUX]}${C6[AUX]}"
			let AUX=AUX+1
		done
	AUX=0
	while [ $AUX -lt 7 ]
		do
			echo -e "           ${C7[AUX]}${C8[AUX]}${C9[AUX]}"
			let AUX=AUX+1
		done
}

while :
do
	clear
	echo -e "${VERDE}    _////         _/       _/// _//////    _//// ";
	echo -e "  _/    _//      _/ //          _//      _//    _// ";
	echo -e " _//            _/  _//         _//    _//        _// ";
	echo -e " _//           _//   _//        _//    _//        _// ";
	echo -e " _//   _////  _////// _//       _//    _//        _// ";
	echo -e "  _//    _/  _//       _//      _//      _//     _// ";
	echo -e "   _/////   _//         _//     _//        _//// \n\033[0m";
	echo -e "                       Elige una opcion\n"
	echo -e "${CYAN}                          1. Jugar"
	echo -e "                       2. Instrucciones"
	echo -e "                           3. Salir\033[0m"
	read OP
	case $OP in 
		1)
			FING=0
			GATO=(0 0 0 0 0 0 0 0 0)
			JUGADOR=1
			GANADOR=0
			TURNO=0
			clear
			while [ $FING == 0 ]
			do
				clear
				imprimir
				pedir_casilla
				
				if [ $JUGADOR == 1 ]
				then
					JUGADOR=2
				else
					if [ $JUGADOR == 2 ]
					then
						JUGADOR=1
					fi
				fi
				
			done

			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
			
		        
		;;
		2)
			clear
			echo -e "                     Instrucciones"
			echo -e "${AMARILLO} Juega con alguien e ingrea el cuadrante que quieras seleccionar."
			echo -e "         La numeración de los cuadrantes es la siguiente\n"
			echo -e "                           |   |   "
			echo -e "                         1 | 2 | 3 "
			echo -e "                        ___|___|___"
			echo -e "                           |   |   "
			echo -e "                         4 | 5 | 6 "
			echo -e "                        ___|___|___"
			echo -e "                           |   |   "
			echo -e "                         7 | 8 | 9 "
			echo -e "                           |   |   "
			echo -e "               \033[0m"
			echo ""
			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
			
			
		;;
		3)
			clear
			exit
		;;
		
		*)
			echo -e "${ROJO}Opcion invalida\n\033[0m"
			echo ""
			read -s -n 1 -p "Presiona alguna tecla para volver al inicio..."
		;;
		esac
done

