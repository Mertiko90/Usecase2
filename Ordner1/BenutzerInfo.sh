#!/bin/bash

cat <<'EOF'
 _________        .---"""      """---.              
:______.-':      :  .--------------.  :             
| ______  |      | :                : |             
|:______B:|      | |                | |             
|:______B:|      | |                | |             
|:______B:|      | |  LOGS          | |             
|         |      | |  INFORMATION   | |             
|:_____:  |      | |                | |             
|    ==   |      | :                : |             
|       O |      :  '--------------'  :             
|       o |      :'---...______...---'              
|       o |-._.-i___/'             \._              
|'-.____o_|   '-.   '-...______...-'  `-._          
:_________:      `.____________________   `-.___.-. 
                 .'.eeeeeeeeeeeeeeeeee.'.      :___:
    fsc        .'.eeeeeeeeeeeeeeeeeeeeee.'.         
              :____________________________:
EOF

echo "----------------------------------------
-----------------------------------------------
------------------------------------------------"

#1️⃣Über VS Code per SSH wurden 6 Benutzer erstellt, die Gruppe heißt UbuntuUsers.

#sudo adduser daniel
#sudo adduser florian
#sudo adduser tom
#sudo adduser jeff
#sudo adduser michi
#sudo adduser andi

#sudo groupadd UbuntuUsers

#sudo usermod -aG UbuntuUsers mert-yesilbas
#sudo usermod -aG UbuntuUsers daniel
#sudo usermod -aG UbuntuUsers florian
#sudo usermod -aG UbuntuUsers tom
#sudo usermod -aG UbuntuUsers jeff
#sudo usermod -aG UbuntuUsers michi
#sudo usermod -aG UbuntuUsers andi

#Zeigt die Benutzer der UbuntuUsers-Gruppe im Terminal an.
echo *********** UbuntuUsers Benutzer ***********
getent group UbuntuUsers
echo

#2️⃣Aktive Benutzer und ihre Informationen
echo "*********** Aktive Benutzer auf Ubuntu ($(date)) ***********"
echo ""

# w -h listet die aktuell aktiven Benutzer auf und liefert Informationen zu Terminal, IP, Anmeldezeit, Inaktivitätsdauer (IDLE) und laufenden Anwendungen.#
w -h | while read user tty ip login idle rest

# TTY-Sitzung (Desktop): Die IP-Spalte ist leer oder "-", SSH-Sitzung: kein tty vorhanden, daher wurde die folgende Logik implementiert, um Verschiebungen zu vermeiden.
do
        #Wenn die IP "-" ist, handelt es sich um eine TTY-Sitzung.
    if [[ "$ip" == "-" ]]; then
        ip="-"
        login=$login
        idle=$idle
        what=$rest
    else
        #SSH-Sitzung
        ip=$tty
        tty="-"
        login=$ip
        idle=$login
        what=$rest
    fi

    echo "Benutzer: $user"
    echo "Terminal: $tty"
    echo "IP Adresse: $ip"
    echo "Login-Zeit: $login"
    echo "IDLE-Zeit: $idle"
    echo "Aktive Anwendung: $what"
    echo "----------------------------------------"
done



