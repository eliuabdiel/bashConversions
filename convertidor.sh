#!/bin/bash
ToDecimal(){
	numero=0
	parametros=`expr "$1" : '.*'`
        for ((i=0; i <= parametros; i++))
        do
          	let posicion=i+1
                valor="$(echo $1 | tail -c $posicion)"
                valor="$(echo $valor | head -c 1)"
                if [ $i -ne 0 ]
                then
			valor=${valor^^}
			case $valor in
			A) valor=10;;
			B) valor=11;;
			C) valor=12;;
			D) valor=13;;
			E) valor=14;;
			F) valor=15;;
			esac
                        let exceso=$i-1
                        let exponente=$2**$exceso
                        let contador=valor*$exponente
                        echo $valor "x "$2 " ^^"$exceso "=" $valor " x "$exponente "="$contador
                        let numero+=contador
			echo "Sumatoria = "$numero
                fi
        done
}
DecimalTo(){
	modulo=""
	echo "Este es el valor de modulo: "$modulo
        numero=$1
	echo "Este es el valor del numero: "$numero
        while [ $numero != 0 ]; do
                let mod=numero%$2
                let numero=numero/$2
                case $mod in
       	        10) mod="A";;
                11) mod="B";;
                12) mod="C";;
                13) mod="D";;
                14) mod="E";;
                15) mod="F";;
		*);;
                esac
                modulo="${mod}$modulo"
        done
}
decision=0
while [ $decision != 9 ]; do
	echo "1.- Convertir de Binario a Decimal"
	echo "2.- Convertir de Octal a Decimal"
	echo "3.- Convertir de Hexadecimal a Decimal"
	echo "4.- Convertir de Decimal a Binario"
	echo "5.- Convertir de Decimal a Octal"
	echo "6.- Convertir de Decimal a Hexadecimal"
	echo "7.- Convertir de Binario a Hexadecimal"
	echo "8.- Convertir de Hexadecimal a Binario"
	echo "9.- Salir"
	read decision
	case $decision in
	1) echo "Captura el numero Binario"
		read number
		ToDecimal $number 2
		echo "EL numero en Decimal es: "$numero;;
	2) echo "Captura el numero Octal"
		read number
		ToDecimal $number 8
		echo "El numero en Decimal es: "$numero;;
	3) echo "Captura el numero Hexadecimal"
		read number
		ToDecimal $number 16
		echo "EL numero en Decimal es: "$numero;;
	4) echo "Captura el numero Decimal"
		read number
		DecimalTo $number 2
		echo "El numero Binario es: "$modulo;;
	5) echo "Captura el numero Decimal"
		read number
		DecimalTo $number 8
		echo "El numero Octal es: "$modulo;;
	6) echo "Captura el numero Decimal"
		read number
		DecimalTo $number 16
		echo "El numero Hexadecimal es: "$modulo;;
	7) echo "Captura el numero Binario"
		read number
		ToDecimal $number 2
		DecimalTo $numero 16
		echo "El numero en Hexadecimal es: "$modulo;;
	8) echo "Captura el numero Hexadecimal"
		read number
		ToDecimal $number 16
		DecimalTo $numero 2
		echo "El numero Binario es: "$modulo;;
	9) break;;
	*) echo "Favor de seleccionar las opciones el menu";;
	esac
done
