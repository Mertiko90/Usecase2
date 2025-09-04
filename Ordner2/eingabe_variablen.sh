#!/bash#!/bin/bash
echo
"=== Variablen aus Benutzereingabe ==="
# Eingabe# Einfache Eingabe
echo
"Name?""Wie ist Ihr Name?"
read
benutzername
echoecho
"Sie?""Wie alt sind Sie?"
readread
benutzeralter
echoecho
"Sie?""Aus welcher Stadt kommen Sie?"
readread
benutzerstadt
# Zeile# Eingabe mit Prompt in einer Zeile
readread
-p
"""Was ist Ihr Lieblingshobby? "
hobby
# Passwörter)# Eingabe ohne Echo (für Passwörter)
readread
-s -p
"""Geben Sie ein Passwort ein: "
passwort
echoecho
# Eingabe# Neue Zeile nach der versteckten Eingabe
# ausgeben# Alle Informationen ausgeben
echoecho
echoecho
"=== ===""=== Ihre Daten ==="
echoecho
"Name:
$benutzername$benutzername
""
echoecho
"Alter:
$benutzeralter$benutzeralter
Jahre"
echoecho
"Stadt:
$benutzerstadt$benutzerstadt
""
echoecho
"Hobby:
$hobby$hobby
""
echoecho
"Passwort hat
${${
##
passwort}
Zeichen"
# Passworts# Länge des Passworts
# speichern# Variable für spätere Verwendung speichern
vollernamevollername
==
""
$benutzername$benutzername
aus
$benutzerstadt$benutzerstadt
""
echoecho
"Vollständiger Name:
$vollername$vollername
""
Erweiterungsaufgaben:
1.
Fragen Sie nach 5 verschiedenen Informationen
2.
Erstellen Sie einen "Steckbrief" mit allen Daten
3.
Implementieren Sie eine Eingabevalidierung für das Alter