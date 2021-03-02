#!/bin/bash
#
# versione 	1.0
# data 		18/02/2021
# autore	MSeverin
# co-autore	DZuliani
#
#########################################################################################
# VARIABILI
#########################################################################################
ONLY_TITLE="GCONV"
BTITLE="$ONLY_TITLE 1.0 by MSeverin"
PATH_OUT="$HOME/Desktop"
PATH_FILE="$HOME/github/gconv/test.csv"
FILE_NAME="out_file"
EPSG_IN="4326"
EPSG_OUT="32633"
TYPE="s/f"
SEP=","
QUE1="no"
QUE2="si"
QUE3="no"
QUE4="1"

#########################################################################################
# VARIABILI DI FORMATTAZIONE
#########################################################################################
sottolineato=$(tput smul)     # attiva il sottolineato
nonsottolineato=$(tput rmul)  # disattiva il sottolineato
grassetto=$(tput bold)        # attiva il grassetto
inverso=$(tput rev)           # attiva la modalità inversa
normale=$(tput sgr0)          # annulla tutti gli effetti e torna al default
txtrosso=$(tput setaf 1)      # carattere rosso
txtverde=$(tput setaf 2)      # carattere verde
txtgiallo=$(tput setaf 3)     # carattere giallo
txtblu=$(tput setaf 4)        # carattere blu
txtporpora=$(tput setaf 5)    # carattere porpora
txtciano=$(tput setaf 6)      # carattere ciano (azzurro)
txtbianco=$(tput setaf 7)     # carattere bianco
txtsforosso=$(tput setab 1)   # sfondo carattere rosso
txtsfoverde=$(tput setab 2)   # sfondo carattere verde
txtsfogiallo=$(tput setab 3)  # sfondo carattere giallo
txtsfoblu=$(tput setab 4)     # sfondo carattere blu
txtsfoporpora=$(tput setab 5) # sfondo carattere porpora
txtsfociano=$(tput setab 6)   # sfondo carattere ciano (azzurro)
txtsfobianco=$(tput setab 7)  # sfondo carattere bianco


#########################################################################################
# FUNZIONI DI DIALOGO RICORSIVE
#########################################################################################
PATH_FILE,QUE1,SEP,EPSG_GEOGR,EPSG_IN,FILE_NAME,TYPE (){
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il path con il file da convertire:${normale} (default $PATH_FILE) "
	if [[ $REPLY ]]; then
		PATH_FILE=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"

	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Vuoi vedere le prime 5 righe del file? (si/no)${normale} (default $QUE1) "
		if [[ $REPLY ]]; then
			QUE1=$REPLY
		fi
	echo "    ${grassetto}${txtverde}$QUE1${normale}"
		if [ $QUE1 = "si" ]; then
			cat $PATH_FILE | gawk 'NR>=1 && NR<=5 {print $0}' | gawk -F $SEP '{printf ("%5d,",$1); print $2","$3","$4}'
			echo ""
		else [ $QUE1 != "no" ];
		fi

	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il separatore:${normale} (default $SEP) "
	if [[ $REPLY ]]; then
		SEP=$REPLY
	fi
	echo "    ${grassetto}${txtverde}il separatore è $SEP${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in entrata:${normale} (default $EPSG_IN): "
	if [[ $REPLY ]]; then
		EPSG_IN=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$EPSG_IN${normale}"
}
PATH_FILE,QUE1,SEP,EPSG_GEOGR,EPSG_OUT,FILE_NAME,TYPE (){
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il path con il file da convertire:${normale} (default $PATH_FILE) "
	if [[ $REPLY ]]; then
		PATH_FILE=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Vuoi vedere le prime 5 righe del file? (si/no)${normale} (default $QUE1) "
		if [[ $REPLY ]]; then
			QUE1=$REPLY
		fi
	echo "    ${grassetto}${txtverde}$QUE1${normale}"
		if [ $QUE1 = "si" ]; then
			cat $PATH_FILE | gawk 'NR>=1 && NR<=5 {print $0}' | gawk -F $SEP '{printf ("%5d,",$1); print $2","$3","$4}'
			echo ""
		else [ $QUE1 != "no" ];
		fi
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il separatore:${normale} (default $SEP) "
	if [[ $REPLY ]]; then
		SEP=$REPLY
	fi
	echo "    ${grassetto}${txtverde}il separatore è $SEP${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in uscita:${normale} (default $EPSG_OUT) "
	if [[ $REPLY ]]; then
		EPSG_OUT=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$EPSG_OUT${normale}"
}
PATH_FILE,QUE1,SEP,EPSG_GEOGR,EPSG_IN,EPSG_OUT,FILE_NAME,TYPE (){
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il path con il file da convertire:${normale} (default $PATH_FILE) "
	if [[ $REPLY ]]; then
		PATH_FILE=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$PATH_FILE${normale}"

	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Vuoi vedere le prime 5 righe del file? (si/no)${normale} (default $QUE1) "
		if [[ $REPLY ]]; then
			QUE1=$REPLY
		fi
	echo "    ${grassetto}${txtverde}$QUE1${normale}"
		if [ $QUE1 = "si" ]; then
			cat $PATH_FILE | gawk 'NR>=1 && NR<=5 {print $0}' | gawk -F $SEP '{printf ("%5d,",$1); print $2","$3","$4}'
			echo ""
		else [ $QUE1 != "no" ];
		fi

	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il separatore:${normale} (default $SEP) "
	if [[ $REPLY ]]; then
		SEP=$REPLY
	fi
	echo "    ${grassetto}${txtverde}il separatore è $SEP${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in entrata:${normale} (default $EPSG_IN) "
	if [[ $REPLY ]]; then
		EPSG_IN=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$EPSG_IN${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in uscita:${normale} (default $EPSG_OUT) "
	if [[ $REPLY ]]; then
		EPSG_OUT=$REPLY
	fi
	echo "    ${grassetto}${txtverde}$EPSG_OUT${normale}"
}

#########################################################################################
clear

HEIGHT=12
WIDTH=35
CHOICE_HEIGHT=12
BACKTITLE="$BTITLE"
TITLE="Menù Principale"
MENU="Scegli un'opzione:"

OPTIONS=(

	1 "Da singolo punto"
	2 "Da file *.csv"
	3 "DD>DMS/DMS>DD"
	4 "Esci"

	)

	choice=$(dialog --clear \
                	--backtitle "$BACKTITLE" \
                	--title "$TITLE" \
                	--menu "$MENU" \
                	$HEIGHT $WIDTH $CHOICE_HEIGHT \
                	"${OPTIONS[@]}" \
                	2>&1 >/dev/tty)

	case $choice in

1)	clear
echo ""
echo -e "${txtsfoblu}${grassetto}$ONLY_TITLE${normale} > ${txtverde}${grassetto}Da singolo punto${normale}"
echo -e "${normale}Questo tool permette la conversione di un singolo punto inserendone le coordinate."
echo -e "${normale}Usa il ${grassetto}${txtrosso}tab${normale} come separatore dei campi."
echo ""
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in entrata:${normale} (default $EPSG_IN) "
	if [[ $REPLY ]]; then
		EPSG_IN=$REPLY
	fi
echo "    ${grassetto}${txtverde}$EPSG_IN${normale}"
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci EPSG del file in uscita:${normale} (default $EPSG_OUT) "
	if [[ $REPLY ]]; then
		EPSG_OUT=$REPLY
	fi
echo "    ${grassetto}${txtverde}$EPSG_OUT${normale}"
		if [[ $EPSG_IN = 4328 ]]; then
				# conversione da geocentriche a ...
					# conversione da geocentriche a geografiche
						if [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
							echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
							echo ""
							read VAR0
					 		echo $VAR0 \
								| cs2cs -f '%.8f' +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
								| gawk '{printf("%10.8f\t%10.8f\t%5.3f\n", $2, $1, $3)}'
						else
							# conversione da geocentriche a piane
							echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
							echo ""
							read VAR0
							echo $VAR0 \
 								| cs2cs -r +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
								| gawk '{printf("%10.3f\t%10.3f\t%5.3f\n", $1, $2, $3)}'
						fi
		elif [[ $EPSG_IN = 4326 ]] || [[ $EPSG_IN = 3857 ]]; then
						# conversione da geografiche a ...
						# conversione da geografiche a geocentriche
						if [[ $EPSG_OUT = 4328 ]]; then
							echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
							echo ""
							read VAR0
					 		echo $VAR0 \
								| cs2cs -r +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
								| gawk '{printf("%10.3f\t%10.3f\t%5.3f\n", $1, $2, $3)}'
						else
						#  conversione da geografiche a piane
						echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
						echo ""
						read VAR0
						echo $VAR0 \
								| cs2cs -r +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
								| gawk '{printf("%10.3f\t%10.3f\t%5.3f\n", $1, $2, $3)}'
						fi
		else
					# conversione da piane a ...
					if [[ $EPSG_OUT = 4328 ]]; then
					# comando di conversione da piane a geocentriche
					echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
					echo ""
					read VAR0
					echo $VAR0 \
							| cs2cs -r +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
							| gawk '{printf("%10.3f\t%10.3f\t%5.3f\n", $1, $2, $3)}'
					elif [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
					# comando di conversione da piane a geografiche
					echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
					echo ""
					read VAR0
					echo $VAR0 \
							| cs2cs -f '%.8f' +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
							| gawk '{printf("%10.8f\t%10.8f\t%5.3f\n", $2, $1, $3)}'
					else
					# comando di conversione da piane a piane
					echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
					echo ""
					read VAR0
					echo $VAR0 \
							| cs2cs -r +init=epsg:$EPSG_IN +to +init=epsg:$EPSG_OUT \
							| gawk '{printf("%10.3f\t%10.3f\t%5.3f\n", $1, $2, $3)}'
					fi
		fi
echo ""
echo -n "Premi un tasto per tornare al menù principale... "
echo ""
read
	gconv.sh
;;

2)	clear
echo ""
echo -e "${txtsfoblu}${grassetto}$ONLY_TITLE${normale} > ${txtverde}${grassetto}Da file *.csv${normale}"
echo -e "${normale}Questo tool permette la conversione di coordinate a partire da un file *.csv"
echo -e "${normale}Si può inserire un file *.csv di coordinate Piane, Geografiche o Geocentriche e viceversa."
echo ""
	PATH_FILE,QUE1,SEP,EPSG_GEOGR,EPSG_IN,EPSG_OUT,FILE_NAME,TYPE
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Vuoi vedere le prime 5 righe del file in uscita? (si/no)${normale} (default $QUE3) "
		if [[ $REPLY ]]; then
			QUE3=$REPLY
		fi
echo "    ${grassetto}${txtverde}$QUE3${normale}"
			if [[ $QUE3 = "si" ]]; then
						if [[ $EPSG_IN = 4328 ]]; then
							# conversione da geocentriche a ...
									# conversione da geocentriche a geografiche
										if [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
												head -n 5 $PATH_FILE \
												| gawk -F$SEP \
													'{printf ("%d ",$1); system ("echo "$2" "$3" "$4" \
													| cs2cs -f '%.8f' +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
												| gawk '{printf ("%5d\t",$1); printf("%10.8f\t%10.8f\t%8.3f\n", $3, $2, $4)}'
										else
												# conversione da geocentriche a piane
												head -n 5 $PATH_FILE \
												| gawk -F$SEP \
													'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
													| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
												| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}'
										fi
						elif [[ $EPSG_IN = 4326 ]] || [[ $EPSG_IN = 3857 ]]; then
										# conversione da geografiche a ...
											# conversione da geografiche a geocentriche
												if [[ $EPSG_OUT = 4328 ]]; then
														head -n 5 $PATH_FILE \
														| gawk -F$SEP \
															'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
															| cs2cs +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
														| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}'
												else
													#  conversione da geografiche a piane
													head -n 5 $PATH_FILE \
													| gawk -F$SEP \
														'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
														| cs2cs +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
													| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}'
												fi
						else
									# conversione da piane a ...
									if [[ $EPSG_OUT = 4328 ]]; then
									# comando di conversione da piane a geocentriche
									head -n 5 $PATH_FILE \
									| gawk -F$SEP \
										'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
										| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
									| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}'
									elif [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
									# comando di conversione da piane a geografiche
									head -n 5 $PATH_FILE \
									| gawk -F$SEP \
										'{printf ("%d ",$1); system ("echo "$2" "$3" "$4" \
										| cs2cs -f '%.8f' +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
									| gawk '{printf ("%5d\t",$1); printf("%10.8f\t%10.8f\t%8.3f\n", $3, $2, $4)}'
									else
									# comando di conversione da piane a piane
									head -n 5 $PATH_FILE \
									| gawk -F$SEP \
										'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
										| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
									| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}'
									fi
						fi
		else [[ $QUE3 != "no" ]];
		fi
	echo ""
	read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Vuoi salvarlo in un file? (si/no)${normale} (default $QUE2) "
				if [[ $REPLY ]]; then
					QUE2=$REPLY
				fi
				echo "    ${grassetto}${txtverde}$QUE2${normale}"
						if [ $QUE2 = "si" ]; then
							read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il path di uscita:${normale} (default $PATH_OUT) "
							if [[ $REPLY ]]; then
								PATH_OUT=$REPLY
							fi
							echo "    ${grassetto}${txtverde}$PATH_OUT${normale}"
							read -p "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci il nome del file in uscita:${normale} (default $FILE_NAME) "
							if [[ $REPLY ]]; then
								FILE_NAME=$REPLY
							fi
							echo "    ${grassetto}${txtverde}$FILE_NAME${normale}"
							if [[ $EPSG_IN = 4328 ]]; then
								# conversione da geocentriche a ...
										# conversione da geocentriche a geografiche
											if [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
													cat $PATH_FILE \
													| gawk -F$SEP \
														'{printf ("%d ",$1); system ("echo "$2" "$3" "$4" \
														| cs2cs -f '%.8f' +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
													| gawk '{printf ("%5d\t",$1); printf("%10.8f\t%10.8f\t%8.3f\n", $3, $2, $4)}' \
													| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
											else
													# conversione da geocentriche a piane
													cat $PATH_FILE \
													| gawk -F$SEP \
														'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
														| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
													| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}' \
													| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
											fi
							elif [[ $EPSG_IN = 4326 ]] || [[ $EPSG_IN = 3857 ]]; then
											# conversione da geografiche a ...
												# conversione da geografiche a geocentriche
													if [[ $EPSG_OUT = 4328 ]]; then
															cat $PATH_FILE \
															| gawk -F$SEP \
																'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
																| cs2cs +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
															| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}' \
															| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
													else
														#  conversione da geografiche a piane
														cat $PATH_FILE \
														| gawk -F$SEP \
															'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
															| cs2cs +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
														| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}' \
														| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
													fi
							else
										# conversione da piane a ...
										if [[ $EPSG_OUT = 4328 ]]; then
										# comando di conversione da piane a geocentriche
										cat $PATH_FILE \
										| gawk -F$SEP \
											'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
											| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
										| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}' \
										| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
										elif [[ $EPSG_OUT = 4326 ]] || [[ $EPSG_OUT = 3857 ]]; then
										# comando di conversione da piane a geografiche
										cat $PATH_FILE \
										| gawk -F$SEP \
											'{printf ("%d ",$1); system ("echo "$2" "$3" "$4" \
											| cs2cs -f '%.8f' +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
										| gawk '{printf ("%5d\t",$1); printf("%10.8f\t%10.8f\t%8.3f\n", $3, $2, $4)}' \
										| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
										else
										# comando di conversione da piane a piane
										cat $PATH_FILE \
										| gawk -F$SEP \
											'{printf ("%d ",$1); system ("echo "$3" "$2" "$4" \
											| cs2cs -r +init=epsg:"'"$EPSG_IN"'" +to +init=epsg:"'"$EPSG_OUT"'"")}' \
										| gawk '{printf ("%5d\t",$1); printf("%10.3f\t%10.3f\t%8.3f\n", $2, $3, $4)}' \
										| gawk '{print $1","$2","$3","$4}' > $PATH_OUT/$FILE_NAME.csv
										fi
							fi
							echo ""
							echo -n "Premi un tasto per tornare al menù principale... "
							echo ""
							read
								gconv.sh
						else
							echo ""
							echo -n "Premi un tasto per tornare al menù principale... "
							read
								gconv.sh
						fi
;;

3)	clear
echo ""
echo -e "${txtsfoblu}${grassetto}$ONLY_TITLE${normale} > ${txtverde}${grassetto}DD>DMS/DMS>DD${normale}"
echo -e "${normale}Questo tool permette la conversione di coordinate geografiche WGS84 da gradi"
echo -e "${normale}sessagesimali a gradi sessadecimali e viceversa."
echo -e "${normale}Usa il ${grassetto}${txtrosso}tab${normale} come separatore dei campi."
echo ""
read -p "${grassetto}${txtverde}-->${normale} Vuoi convertire da DD>DMS o da DMS>DD? (1-2) (default $QUE4): "
	if [[ $REPLY ]]; then
		QUE4=$REPLY
	fi
	# echo $QUE4
		if [ $QUE4 = "1" ]; then
			#LAT,LON,HEI
			echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
			echo ""
			read VAR0
			echo $VAR0 \
			| cs2cs +proj=latlong +datum=WGS84 +to +proj=latlong +datum=WGS84
		else
			echo -e "${grassetto}${txtverde}-->${normale} ${grassetto}${txtbianco}Inserisci le coordinate:${normale} "
			echo ""
			read VAR0
			echo $VAR0 \
			| cs2cs -f "%.8f" +proj=latlong +datum=WGS84 +to +proj=latlong +datum=WGS84 \
			#| gawk '{printf ("%d\t"); printf("%10.8f\t%10.8f\t%8.3f\n", $1, $2, $3)}'
		fi
echo ""
echo -n "Premi un tasto per tornare al menù principale... "
echo ""
read
	gconv.sh
;;

4)		exit
;;
esac
