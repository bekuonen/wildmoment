# Skill: Aktienbuchhaltung Betrieb

## Zweck

Dieser Skill führt die periodische Aktualisierung der Aktienbuchhaltung, des
Vermögenscockpits und der Hugo-Webseite durch.

Alle Arbeitsschritte sind nachvollziehbar zu dokumentieren. Sämtliche Berichte,
Statusdateien und Fehlerprotokolle werden in Obsidian abgelegt.

---

## Zeitzone

Alle Zeitangaben und Dateinamen verwenden **Europe/Zurich (CET/CEST)**.

---

## Verbindliche Ablagestruktur

```
90_Betrieb/
└── Aktienbuchhaltung/
    ├── Backups/
    ├── Status/
    ├── Tagesberichte/
    ├── Monatsberichte/
    └── Fehlerjournal/
```

---

## Statusdatei

Nach jedem erfolgreichen Lauf überschreiben:

```
90_Betrieb/Aktienbuchhaltung/Status/Aktienbuchhaltung_Status.md
```

Inhalt:

- Zeitpunkt des letzten erfolgreichen Laufs (ISO 8601, Europe/Zurich)
- Depotwert
- Anzahl Positionen
- Hugo-Build Status
- Git-Synchronisation Status
- Nächste Ausführung
- Letzte Warnung
- Letzter Fehler

---

## Tagesberichte

Für jeden Lauf wird ein neuer Bericht erstellt — bestehende Berichte werden
niemals verändert.

**Dateinamen:**

```
yyyy-mm-dd_hhmm_Aktienbuchhaltung_Update.md
yyyy-mm-dd_hhmm_Aktienbuchhaltung_Tagesabschluss.md
```

**Beispiele:**

```
2026-06-05_0945_Aktienbuchhaltung_Update.md
2026-06-05_2230_Aktienbuchhaltung_Tagesabschluss.md
```

**Ablage:**

```
90_Betrieb/Aktienbuchhaltung/Tagesberichte/
```

**Inhalt:**

- Datum und Uhrzeit (Europe/Zurich)
- Ausgeführte Schritte
- Anzahl verarbeiteter Transaktionen
- Depotwert
- Änderungen seit letztem Lauf
- Hugo-Build Ergebnis (übersprungen / erfolgreich / Fehler)
- Git-Ergebnis (kein Commit / committed / gepusht / Fehler)
- Warnungen
- Fehler
- Zusammenfassung

---

## Monatsberichte

Am letzten **Kalendertag** jedes Monats erstellen (unabhängig von Wochenenden
und Feiertagen).

**Dateiname:**

```
yyyy-mm_Monatsreport_Depot.md
```

**Beispiel:**

```
2026-06_Monatsreport_Depot.md
```

**Ablage:**

```
90_Betrieb/Aktienbuchhaltung/Monatsberichte/
```

**Inhalt:**

- Monatsperformance
- Jahresperformance
- Dividenden
- Käufe
- Verkäufe
- Asset Allocation
- Top Gewinner
- Top Verlierer
- Bemerkungen

---

## Backups

Vor jeder Datenänderung Backup erstellen.

**Namensschema:**

```
90_Betrieb/Aktienbuchhaltung/Backups/yyyy-mm-dd_hhmm_depot_backup.<ext>
```

**Regeln:**

- Backup niemals überschreiben
- Dateiname enthält immer Zeitstempel (Europe/Zurich)
- Backups müssen jederzeit eine vollständige Wiederherstellung ermöglichen

---

## Fehlerjournal

Fehler werden ausschliesslich **angehängt**, niemals überschrieben:

```
90_Betrieb/Aktienbuchhaltung/Fehlerjournal/Fehlerjournal.md
```

Jeder Eintrag enthält:

- Datum und Uhrzeit (Europe/Zurich)
- Betroffener Prozess
- Fehlerbeschreibung
- Ursache
- Auswirkungen
- Empfohlene Massnahme

---

## Gemeinsame Teilprozeduren

### publish()

Wird von beiden Ausführungen (09:45 und 22:30) aufgerufen.

1. Änderungserkennung: SHA-256-Checksummen der Depot- und Ausgabedateien
   vergleichen
2. Wenn keine Änderung: Hugo-Build überspringen, weiter mit Schritt 6
3. Hugo-Site bauen (in temporäres Verzeichnis)
4. Build prüfen: Ausgabedateien vorhanden und nicht leer?
   - Bei Fehler: temporäres Verzeichnis verwerfen → Rollback (siehe unten)
5. Ausgabeverzeichnis (`public/`) aus temporärem Verzeichnis übernehmen
6. Git-Status prüfen (`git status`)
7. Wenn keine Änderungen: kein Commit, kein Push
8. Git Commit erstellen
9. Git Push durchführen

**Rollback bei Hugo-Fehler (Schritt 4):** Temporäres Build-Verzeichnis
löschen. `public/` bleibt unverändert. Kein Git-Commit. Fehlerjournal
aktualisieren. Prozess stoppen.

### finalize()

Wird von beiden Ausführungen nach `publish()` aufgerufen.

1. Statusdatei aktualisieren
2. Tagesbericht erstellen

---

## Änderungserkennung

Vor jedem Hugo-Build prüfen:

```
sha256sum <depot-quelldatei>   → mit gespeichertem Wert vergleichen
sha256sum <kennzahlen-datei>   → mit gespeichertem Wert vergleichen
sha256sum <ausgabe-datei>      → mit gespeichertem Wert vergleichen
```

Checksummen werden in:

```
90_Betrieb/Aktienbuchhaltung/Status/checksums.txt
```

gespeichert und nach jedem Build aktualisiert.

Wenn alle Checksummen unverändert: Hugo-Build überspringen.

---

## Plausibilitätsprüfung

Mindestregeln (Ausführung 09:45, Schritt 5):

- Depotwert > 0
- Anzahl Positionen ≥ 1
- Keine doppelten ISIN-Einträge
- Transaktionsdaten nicht älter als 7 Tage
- Summe Kaufwerte stimmt mit Kontobewegungen überein (Differenz ≤ Toleranz 0.01)

Bei Verletzung einer Regel: Prozess sofort stoppen, Fehlerjournal aktualisieren.

---

## Ausführung 09:45

**Ziel:** Tägliche Aktualisierung der Finanzdaten und Veröffentlichung der
aktuellen Hugo-Webseite.

**Reihenfolge:**

1. Backup erstellen
2. Depotdaten importieren
3. Aktienbuchhaltung aktualisieren
4. Vermögenscockpit berechnen
5. Plausibilitätsprüfung durchführen (siehe Plausibilitätsprüfung)
6. Änderungen feststellen
7. `publish()` aufrufen
8. `finalize()` aufrufen (Bericht-Typ: `Update`)

---

## Ausführung 22:30

**Ziel:** Tagesabschluss, Kontrolle und Sicherung.

**Reihenfolge:**

1. Backup erstellen
2. Datenkonsistenz prüfen
3. Aktienbuchhaltung validieren
4. Vermögenscockpit neu berechnen
5. `publish()` aufrufen
6. `finalize()` aufrufen (Bericht-Typ: `Tagesabschluss`)

---

## Sicherheitsregeln

Der Skill darf niemals:

- historische Daten überschreiben
- Transaktionen löschen
- Daten stillschweigend korrigieren
- Fehler ignorieren
- Berichte nachträglich verändern

**Bei Fehlern:**

1. Prozess sofort stoppen
2. Fehlerjournal aktualisieren
3. Fehler im Statusbericht vermerken
4. Keine weiteren Verarbeitungsschritte ausführen

---

## Abschlussmeldung

Nach jedem Lauf ausgeben:

```
Status: Erfolgreich | Fehler
Aktualisiert:
- Aktienbuchhaltung
- Vermögenscockpit
- Hugo-Webseite
Bericht:
<Vollständiger Dateipfad>
Statusdatei:
<Vollständiger Dateipfad>
Nächste Ausführung:
<Datum und Uhrzeit, Europe/Zurich>
```

---

## Grundsatz

Funktion vor Perfektion.

Einfachheit vor Komplexität.

Nachvollziehbarkeit vor Automatisierung.

Jeder Lauf muss reproduzierbar, dokumentiert und revisionssicher sein.
