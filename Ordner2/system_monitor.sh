# Funktion: Prozesse anzeigen
show_processes() {
    echo "----- TOP 5 Processes hier -----"
    ps aux --sort=-%mem | head -6
}

# Funktion: check festplatte
check_diskspace() {
    counter=1
    
    echo "USER ----- PID -------"
    for line in $(ps aux --sort=-%cpu | head -6 | tail -5 | sed 's/ /§/g'); do
    echo -e "${GREEN}${counter}${NC} $(echo "$line" | sed 's/§/ /g')"
    counter=$((counter + 1))


    done
    echo
}

# Funktion: Netzwerk technik
netzwerk_test() {
    echo "----- Netzwerkverbindung getestet -----"
    ping -c 1 github.com google.com
}


#Main Menu
main_menu() {
    while true; do
        clear
        echo "--------------System Menü--------------"
        echo "1) Prozesse anzeigen"
        echo "2) Festplatte prüfen"
        echo "3) Netzwerk testen"
        echo "q) Beenden"
        echo -n "Give me number please: "
        read -r choice

        case "$choice" in
            1)
                show_processes
                ;;
            2)
                check_diskspace
                ;;
            3)
                netzwerk_test
                ;;
            q|Q)
                echo "Programm wird beendet."
                break
                ;;
            *)
                echo "Ungültige Eingabe. Bitte 1, 2, 3 oder q wählen."
                ;;
        esac
        # Kleines Standby, um die Ausgabe auf dem Bildschirm zu sehen
        read -r -p "You can continue with Enter..." dummy
    done
}


main_menu

