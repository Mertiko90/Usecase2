from collections import Counter

# Benutzer nach Text fragen
text = input("Bitte gib einen Text ein:\n")

# Wörter und Zeichen zählen
woerter = text.split()
anzahl_woerter = len(woerter)
anzahl_zeichen_mit_leerzeichen = len(text)
anzahl_zeichen_ohne_leerzeichen = len(text.replace(" ", ""))

# Längstes Wort finden
langstes_wort = max(woerter, key=len) if woerter else ""

# Häufigkeit jedes Wortes
wort_haeufigkeit = Counter(woerter)

# 3 häufigste Wörter
haeufigste_3 = wort_haeufigkeit.most_common(3)

# Ergebnisse anzeigen
print("\n--- Analyse des Textes ---")
print(f"Anzahl der Wörter: {anzahl_woerter}")
print(f"Anzahl der Zeichen (mit Leerzeichen): {anzahl_zeichen_mit_leerzeichen}")
print(f"Anzahl der Zeichen (ohne Leerzeichen): {anzahl_zeichen_ohne_leerzeichen}")
print(f"Längstes Wort: {langstes_wort}")
print("\nHäufigkeit jedes Wortes:")
for wort, count in wort_haeufigkeit.items():
    print(f"{wort}: {count}")

print("\nDie 3 häufigsten Wörter:")
for wort, count in haeufigste_3:
    print(f"{wort}: {count}")

