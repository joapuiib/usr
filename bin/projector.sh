#!/bin/bash

AULA=$1
PROJ="hA$AULA-p"

EnviaPrj () {
# $1 = comanda $2 = Text a mostrar
#echo -e "spawn telnet h$(hostname | cut -c 2-5)-p 4352 \\n expect \"PJLINK 0\\r\" \\n send \"\\n$1\\n\" \\n \'" | expect | zenity --progress --pulsate --auto-kill --auto-close --no-cancel --text="$2"
    echo -e "spawn telnet $PROJ 4352 \\n expect \"PJLINK 0\\r\" \\n send \"\\n$1\\n\" \\n \'" | expect
    notify-send "Control Projector" "$2"
}

#Si no hi ha accés al projector, error
if ! ping -c1 -w1 $PROJ &>/dev/null ; then
    zenity --error --width=150 --title="Control de Projector" --text="No hi ha accés al projector"
    exit
fi

#Si ens passen com a paràmetre $2 PON-POF-PAU-PHD-PVG no trec menu
if [ ! -z "$2" ] && [[ "PON-POF-PAU-PHD-PVG" =~ $2 ]]; then
    OPC="$2"
else
    OPC=$(zenity --list --title=" Remote Control Projector" --width="200" --height="230" --text="Tria:" --print-column=1 --hide-column=1 --column="Llum intermitent = Projector no preparat!" --column="Accio"  "PON" "Power ON" "POF" "Power OFF" "PAU" "Congela/Descongela" "PHD" "Input HDMI" "PVG" "Input VGA" "DUPLI" "Projector=Monitor" "DOSPA" "Projector_a_la_dreta_del_Monitor" "INCRU" "Projector_incrustat_al_Monitor")
fi

case $OPC in
    PON)
        EnviaPrj "%1POWR 1" "Engegant Projector..."
        ;;  
    POF)
        EnviaPrj "%1POWR 0" "Suspenent Projector..."
        ;;  
    PAU)
        sleep 1
        echo '020F0000028A009D' | xxd -r -p | nc -w 1 $PROJ 7142
        sleep 1
        notify-send "Control Projector" "Projector en pausa? \n\n (Comprova-ho)"
        ;;
    PHD)
        EnviaPrj "%1INPT 31" "Activant HDMI..."
        ;;  
    PVG)
        EnviaPrj "%1INPT 11" "Activant VGA..."
        ;;  
    DUPLI)
        ;;
    DOSPA)
        ;;
    INCRU)
        ;;
esac



