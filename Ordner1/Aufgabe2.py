erste_zahl=float(input("Geben Sie bitti erste Zahl ein: "))
zweite_zahl=float(input("Geben Sie bitti zweite Zahl ein: "))

print("Welche Operation möchtest du durchführen?")
print("1  +")
print("2  -")
print("3  x")
print("4  /")

wahl = input("Deine Wahl 1/2/3/4: ")

if wahl == "1":
    print(f"Ergebnis: {erste_zahl + zweite_zahl}")
elif wahl == "2":
    print(f"Ergebnis: {erste_zahl - zweite_zahl}")
elif wahl == "3":
    print(f"Ergebnis: {erste_zahl * zweite_zahl}")
elif wahl == "4":
    if zweite_zahl != 0:
        print(f"Ergebnis: {erste_zahl / zweite_zahl}")
    else:
        print("Fehler: Division durch 0 ist nicht erlaubt!")
else:
    print("Ungültige Eingabe!")