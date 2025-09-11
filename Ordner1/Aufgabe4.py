# Leere Liste für Artikel
artikel_liste = []

def anzeigen():
    if not artikel_liste:
        print("Die Liste ist leer.")
    else:
        print("\nArtikel in der Liste:")
        for index, artikel in enumerate(artikel_liste, start=1):
            print(f"{index}. {artikel}")
    print(f"Anzahl der Artikel: {len(artikel_liste)}\n")

def hinzufuegen():
    neuer_artikel = input("Gib den Namen des Artikels ein, den du hinzufügen möchtest: ")
    if neuer_artikel:
        artikel_liste.append(neuer_artikel)
        print(f"{neuer_artikel} wurde hinzugefügt.\n")
    else:
        print("Kein Artikel eingegeben.\n")

def loeschen():
    if not artikel_liste:
        print("Die Liste ist leer. Nichts zu löschen.\n")
        return
    anzeigen()
    try:
        index = int(input("Gib die Nummer des Artikels ein, den du löschen möchtest: "))
        if 1 <= index <= len(artikel_liste):
            entfernt = artikel_liste.pop(index - 1)
            print(f"{entfernt} wurde gelöscht.\n")
        else:
            print("Ungültige Nummer.\n")
    except ValueError:
        print("Bitte eine gültige Zahl eingeben.\n")

def menu():
    while True:
        print("===== Menü =====")
        print("1. Hinzufügen")
        print("2. Anzeigen")
        print("3. Löschen")
        print("4. Beenden")
        wahl = input("Wähle eine Option (1-4): ")

        if wahl == "1":
            hinzufuegen()
        elif wahl == "2":
            anzeigen()
        elif wahl == "3":
            loeschen()
        elif wahl == "4":
            print("Programm wird beendet.")
            break
        else:
            print("Ungültige Wahl. Bitte 1-4 eingeben.\n")

# Programm starten
menu()
