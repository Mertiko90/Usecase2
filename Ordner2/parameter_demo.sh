#!/bin/bash

# Globale Variable
PROGRAMM_NAME="Mein Bash Labor"

# Funktion mit Parametern
begruesse_nutzer() {
    local name=$1
    local alter=$2
    local stadt=${3:-"Unbekannte Stadt"}  # Standardwert falls nicht angegeben
    echo "====== Begrüßung ======"
    echo "Hallo $name!"
    echo "Du bist $alter Jahre alt"
    echo "Du kommst aus: $stadt"
    echo "Willkommen zu: $PROGRAMM_NAME"
    echo
}

# Funktion mit Rückgabewert
berechne_quadrat() {
    local zahl=$1
    local ergebnis=$((zahl * zahl))
    echo $ergebnis  # Rückgabe über echo
}

# Funktion prüfen ob Zahl gerade ist
ist_gerade() {
    local zahl=$1
    if (( zahl % 2 == 0 )); then
        return 0  # gerade
    else
        return 1  # ungerade
    fi
}

# Funktion BMI berechnen
berechne_bmi() {
    local gewicht=$1
    local groesse=$2
    local bmi=$(echo "scale=2; $gewicht / ($groesse * $groesse)" | bc)
    echo $bmi
}



# Test der Funktionen
begruesse_nutzer "Max" "25" "Berlin"
begruesse_nutzer "Anna" "30"

quadrat=$(berechne_quadrat 5)
echo "Das Quadrat von 5 ist: $quadrat"

# Test der neuen Funktion ist_gerade
zahl=7
ist_gerade $zahl
if [ $? -eq 0 ]; then
    echo "Die Zahl $zahl ist gerade"
else
    echo "Die Zahl $zahl ist ungerade"
fi

# Test der BMI-Funktion
gewicht=70
groesse=1.75
bmi=$(berechne_bmi $gewicht $groesse)
echo "BMI für $gewicht kg und $groesse m ist: $bmi"