#!/bin/bash
echo "=== Grundlagen der Variablen ==="

# Variablen definieren (Keine Leerzeichen um das = Zeichen!)
name="Mert Yesilbas"
alter=35
stadt="Bergneustadt"
beruf="Softwareentwickler"
hobby="Fußball spielen"
lieblingsfarbe="Grün"

# Variablen ausgeben
echo "Name: $name"
echo "Alter: $alter"
echo "Stadt: $stadt"
echo "Beruf: $beruf"
echo "Hobby: $hobby"
echo "Lieblingsfarbe: $lieblingsfarbe"

# Alternative Schreibweise mit geschweiften Klammern
echo "Vollständiger Text: ${name} ist ${alter} Jahre alt, wohnt in ${stadt}, arbeitet als ${beruf}, spielt gern ${hobby} und liebt die Farbe ${lieblingsfarbe}."

# Variable ändern
alter=36
echo "Neues Alter: $alter"

# Satz mit allen Variablen erneut ausgeben
echo "Aktualisierter Satz: ${name} ist jetzt ${alter} Jahre alt, wohnt in ${stadt}, arbeitet als ${beruf}, spielt gern ${hobby} und liebt die Farbe ${lieblingsfarbe}."
