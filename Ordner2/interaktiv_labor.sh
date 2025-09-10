#!/bin/bash

# Globale Variablen
BENUTZER_NAME=""
PUNKTE=0

# Funktion: Hauptmenü anzeigen
zeige_menue() {
    clear
    echo "===================================================================="
    echo "BASH SCRIPTING LABOR"
    echo "===================================================================="
    echo "Benutzer: $BENUTZER_NAME"
    echo "Aktuelle Punkte: $PUNKTE"
    echo "--------------------------------------------------------------------"
    echo "1) Benutzer registrieren"
    echo "2) Taschenrechner"
    echo "3) Datei-Manager"
    echo "4) Quiz-Spiel"
    echo "5) System-Informationen"
    echo "6) Punkte zurücksetzen"
    echo "7) BMI Rechner"
    echo "8) Passwort-Generator"
    echo "9) Log-Info"
    echo "10) Backup"
    echo "0) Programm beenden"
    echo "===================================================================="
    echo -n "Ihre Wahl: "
}

# Funktion: Benutzer registrieren
registriere_benutzer() {
    echo
    echo "====== Benutzer-Registrierung ======"
    echo -n "Ihr Name: "
    read BENUTZER_NAME
    echo -n "Ihr Alter: "
    read alter
    echo -n "Ihre Stadt: "
    read stadt
    echo
    echo "Willkommen, $BENUTZER_NAME aus $stadt!"
    echo "Sie sind $alter Jahre alt."
    PUNKTE=$((PUNKTE + 10))
    echo "Sie haben 10 Punkte erhalten!"
    echo
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: Einfacher Taschenrechner
taschenrechner() {
    local zahl1 zahl2 operation ergebnis
    echo
    echo "====== Taschenrechner ======"
    echo -n "Erste Zahl: "
    read zahl1
    echo -n "Operation (+, -, *, /): "
    read operation
    echo -n "Zweite Zahl: "
    read zahl2

    case $operation in
        "+") ergebnis=$((zahl1 + zahl2)) ;;
        "-") ergebnis=$((zahl1 - zahl2)) ;;
        "*") ergebnis=$((zahl1 * zahl2)) ;;
        "/")
            if [ $zahl2 -eq 0 ]; then
                echo "Fehler: Division durch Null!"
                echo "Drücken Sie Enter zum Fortfahren..."
                read
                return 1
            fi
            ergebnis=$((zahl1 / zahl2))
            ;;
        *) echo "Ungültige Operation!"; read; return 1 ;;
    esac

    echo "Ergebnis: $zahl1 $operation $zahl2 = $ergebnis"
    PUNKTE=$((PUNKTE + 5))
    echo "Sie haben 5 Punkte erhalten!"
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: Datei-Manager
datei_manager() {
    local wahl
    while true; do
        echo
        echo "====== Datei-Manager ======"
        echo "Aktuelles Verzeichnis: $(pwd)"
        echo
        echo "1) Dateien auflisten"
        echo "2) Verzeichnis wechseln"
        echo "3) Datei erstellen"
        echo "4) Datei löschen"
        echo "5) Zurück zum Hauptmenü"
        echo -n "Ihre Wahl: "
        read wahl

        case $wahl in
            1) ls -la; PUNKTE=$((PUNKTE + 2)) ;;
            2)
                echo -n "Neues Verzeichnis: "
                read verzeichnis
                if cd "$verzeichnis" 2>/dev/null; then
                    echo "Verzeichnis gewechselt zu: $(pwd)"
                    PUNKTE=$((PUNKTE + 3))
                else
                    echo "Verzeichnis nicht gefunden!"
                fi
                ;;
            3)
                echo -n "Dateiname: "
                read dateiname
                touch "$dateiname"
                echo "Datei '$dateiname' erstellt."
                PUNKTE=$((PUNKTE + 5))
                ;;
            4)
                echo -n "Datei löschen: "
                read dateiname
                if [ -f "$dateiname" ]; then
                    rm "$dateiname"
                    echo "Datei '$dateiname' gelöscht."
                    PUNKTE=$((PUNKTE + 3))
                else
                    echo "Datei nicht gefunden!"
                fi
                ;;
            5) return ;;
            *) echo "Ungültige Wahl!" ;;
        esac
        echo "Drücken Sie Enter zum Fortfahren..."
        read
    done
}

# Funktion: Quiz-Spiel
quiz_spiel() {
    local antwort punkte_quiz=0
    echo
    echo "====== Bash Quiz ======"
    echo "Beantworten Sie die folgenden Fragen:"
    
    echo
    echo "1) Welcher Befehl zeigt das aktuelle Verzeichnis an?"
    echo " a) pwd  b) cd  c) ls  d) dir"
    echo -n "Ihre Antwort: "
    read antwort
    if [[ "$antwort" == "a" || "$antwort" == "pwd" ]]; then
        echo "Richtig! (+10 Punkte)"
        punkte_quiz=$((punkte_quiz + 10))
    else
        echo "Falsch! Richtige Antwort: a) pwd"
    fi

    echo
    echo "2) Wie definiert man eine Variable in Bash?"
    echo " a) var == wert  b) var==wert  c) set var wert  d) var:=wert"
    echo -n "Ihre Antwort: "
    read antwort
    if [[ "$antwort" == "b" || "$antwort" == "var==wert" ]]; then
        echo "Richtig! (+10 Punkte)"
        punkte_quiz=$((punkte_quiz + 10))
    else
        echo "Falsch! Richtige Antwort: b) var==wert"
    fi

    echo
    echo "3) Wie macht man eine Datei ausführbar?"
    echo " a) exec datei  b) run datei  c) chmod +x datei  d) make datei"
    echo -n "Ihre Antwort: "
    read antwort
    if [[ "$antwort" == "c" || "$antwort" == "chmod +x" ]]; then
        echo "Richtig! (+10 Punkte)"
        punkte_quiz=$((punkte_quiz + 10))
    else
        echo "Falsch! Richtige Antwort: c) chmod +x datei"
    fi

    echo
    echo "Quiz beendet! Sie haben $punkte_quiz von 30 Punkten erreicht."
    PUNKTE=$((PUNKTE + punkte_quiz))
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: Systeminformationen
system_info() {
    echo
    echo "====== Systeminformationen ======"
    echo "Hostname: $(hostname)"
    echo "Benutzer: $(whoami)"
    echo "Datum: $(date)"
    echo "Betriebssystem: $(uname -s)"
    echo "Kernel-Version: $(uname -r)"
    echo "Prozessor: $(uname -m)"
    echo "Speicher-Info:"
    free -h | head -n 2
    echo
    echo "Festplatten-Nutzung:"
    df -h | head -n 2
    PUNKTE=$((PUNKTE + 5))
    echo "Sie haben 5 Punkte erhalten!"
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: Punkte zurücksetzen
punkte_zuruecksetzen() {
    echo
    echo "Möchten Sie wirklich alle Punkte zurücksetzen? (j/n)"
    read antwort
    if [[ "$antwort" == "j" || "$antwort" == "J" ]]; then
        PUNKTE=0
        echo "Punkte wurden zurückgesetzt!"
    else
        echo "Abgebrochen."
    fi
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: BMI Rechner
berechne_bmi() {
    echo
    echo "====== BMI Rechner ======"
    echo -n "Gewicht in kg: "
    read gewicht
    echo -n "Größe in m: "
    read groesse
    bmi=$(echo "scale=2; $gewicht / ($groesse * $groesse)" | bc)
    echo "Ihr BMI ist: $bmi"
    PUNKTE=$((PUNKTE + 5))
    echo "Sie haben 5 Punkte erhalten!"
    echo "Drücken Sie Enter zum Fortfahren..."
    read
}

# Funktion: Passwort-Generator
generiere_passwort() {
    echo
    echo "====== Passwort-Generator ======"
    local laenge=${1:-12}
    tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c $laenge
    read
}

# Funktion: Log-Info
log_aktion() {
    echo
    echo "====== Benutzername Log-Info - Bitte schreiben Sie Ihre Terminal - cat labor_log.txt ======"
    local aktion="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $BENUTZER_NAME - $aktion" >> labor_log.txt
    read
}

# Funktion: Backup
backup_erstellen() {
    echo
    echo "====== Backup ======"
    local quelle=("interaktiv_labor.sh" "labor_log.txt")
    local ziel="backup_$(date '+%Y%m%d__%H%M%S').tar.gz"
    tar -czf "$ziel" "${quelle[@]}"
    echo "Backup erstellt: $ziel"
    read
}  

# Funktion: Prüft ob eine Eingabe eine gültige Zahl ist
ist__zahl() {
    local eingabe="$1"
    if [[ $eingabe =~ ^[0-9]+$ ]]; then
        return 0  # gültige Zahl
    else
        return 1  # keine Zahl
    fi
}

# Funktion: Liest sichere Zahleneingabe vom Benutzer
lies_zahl() {
    local prompt="$1"
    local zahl
    while true; do
        echo -n "$prompt"
        read zahl
        if isst__zahl "$zahl"; then
            echo $zahl
            return
        else
            echo "Fehler: Bitte geben Sie eine gültige Zahl ein!"
        fi
    done
}


## Hauptschleife
main() {
    local wahl
    while true; do
        zeige_menue
        read wahl
        case $wahl in
            1) registriere_benutzer ;;
            2) taschenrechner ;;
            3) datei_manager ;;
            4) quiz_spiel ;;
            5) system_info ;;
            6) punkte_zuruecksetzen ;;
            7) berechne_bmi ;;
            8) generiere_passwort;;
            9) log_aktion;;
            10) backup_erstellen;;
            0)
                echo
                echo "Auf Wiedersehen, $BENUTZER_NAME!"
                echo "Endpunktzahl: $PUNKTE Punkte"
                echo "Vielen Dank fürs Mitmachen!"
                exit 0
                ;;
            *) echo "Ungültige Wahl! Bitte 0-7 wählen."; read ;;
        esac
    done
}

main
