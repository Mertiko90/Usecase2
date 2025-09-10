#!/bin/bash

# Persönliche Begrüßungsfunktion
hello_welt() {
    local name=$1
    echo "Hallo, $name! Willkommen zum Bash-Skript."
    echo "Heute ist: $(date +%d.%m.%Y)"
}

# Systeminformationen Funktion
# hostname - Systembefehl, gibt den Namen des Computers aus
# $USER - Umgebungsvariable, gibt den aktuell angemeldeten Benutzer aus
zeige_system_info() {
    echo "Hostname: $(hostname)"
    echo "Benutzername: $USER"
}

# Benutzer nach Namen fragen
echo "Bitte geben Sie Ihren Namen ein:"
read user_name

# Funktion aufrufen und Namen übergeben
hello_welt "$user_name"
zeige_system_info