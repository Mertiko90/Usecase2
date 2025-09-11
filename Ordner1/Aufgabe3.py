import random

# Zufallszahl generieren zwischen 1 und 100
zufallszahl = random.randint(1, 100)

versuche = 0
print("Willkommen zum Zahlenraten! Versuche die Zahl zwischen 1 und 100 zu erraten.")

while True:
    tipp = input("Dein Tipp: ")
    
    # Prüfen, ob Eingabe eine Zahl ist
    if not tipp.isdigit():
        print("Bitte gib eine gültige Zahl ein.")
        continue
    
    tipp = int(tipp)
    versuche += 1
    
    if tipp < zufallszahl:
        print("Zu niedrig! Versuch es nochmal.")
    elif tipp > zufallszahl:
        print("Zu hoch! Versuch es nochmal.")
    else:
        print(f"Herzlichen Glückwunsch! Du hast die Zahl {zufallszahl} in {versuche} Versuchen erraten.")
        break
