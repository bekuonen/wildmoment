# Aktienbuchhaltung V2 — Konkrete Entscheidungsgrundlage

---

## M1 – Transaktionsjournal

### Fachlicher Zweck
Die einzige unveränderliche Quelle der Wahrheit. Jede andere Zahl im System — Bestand, Einstandswert, Gewinn, Depotwert — wird daraus abgeleitet. Ohne ein vollständiges Journal gibt es keine Buchhaltung, nur Schätzungen.

### Minimaler Lösungsansatz
Eine einzige Tabelle. Ein Datensatz pro Ereignis. Unveränderlich nach dem Erfassen.

**Minimale Felder:**

| Feld | Typ | Pflicht | Bemerkung |
|---|---|---|---|
| Datum | Datum | ja | Handelsdatum (nicht Valuta) |
| ISIN | Text | ja | Eindeutiger Wertpapierbezeichner |
| Titel | Text | ja | Lesbarer Name (nur zur Anzeige) |
| Typ | Auswahl | ja | Kauf / Verkauf / Dividende / Einbuchung / Ausbuchung |
| Anzahl | Zahl | bei Kauf/Verkauf | Stückzahl |
| Kurs | Zahl | bei Kauf/Verkauf | Preis je Stück in Handelswährung |
| Betrag | Zahl | ja | Gesamtbetrag inkl. Gebühren, in Handelswährung |
| Währung | Text | ja | ISO-4217 (CHF, EUR, USD, …) |
| Gebühren | Zahl | nein | Optional, zur Einstandskorrektur |

**Nicht notwendig:** Broker, Depot-ID, interne Referenznummer, Notizen, Steuerrelevanz-Flag — alles Nice-to-have, das die Eingabe erschwert und selten genutzt wird.

### Risiken
- Falsch erfasste Transaktionen (Tippfehler bei Anzahl oder Kurs) verfälschen alle Folgeberechnungen — Validierung beim Erfassen ist deshalb wichtiger als überall sonst
- Dividenden in Fremdwährung brauchen eine Handelswährung — das muss beim Erfassen klar sein

### Vereinfachungsmöglichkeiten
- Gebühren weglassen und in den Kurs einrechnen (einfacher, minimal ungenauer)
- Titel weglassen wenn ISIN konsequent genutzt wird (aber schlecht lesbar)

### Empfehlung
**Unverändert übernehmen, Felder wie oben beschränken.**
Neun Felder sind das Minimum für eine korrekte Buchhaltung. Jedes zusätzliche Feld erhöht den Erfassungsaufwand dauerhaft.

---

## M2 – Bestandsberechnung

### Fachlicher Zweck
Zu jedem Zeitpunkt wissen, wie viele Stücke einer Position gehalten werden. Grundlage für Bewertung und Gewinnrechnung.

### Minimaler Lösungsansatz
Bestand = Summe aller Käufe minus Summe aller Verkäufe einer ISIN, berechnet aus dem Transaktionsjournal. Keine separate Bestandstabelle.

### Soll der Bestand zwischengespeichert werden?
**Nein.** Für einen Privatanleger mit typischerweise 10–50 Positionen und einigen hundert Transaktionen total ist die Neuberechnung in Millisekunden erledigt. Ein Cache erzeugt nur eine neue Fehlerquelle: Der Cache kann veralten, inkonsistent werden oder nach einer Korrektur im Journal nicht aktualisiert werden.

**Einzige Ausnahme:** Wenn die Berechnung nachweislich zu langsam ist (>1000 Transaktionen, komplexe Splits), dann und nur dann einen täglichen Snapshot rechtfertigen.

### Risiken
- Negativer Bestand (mehr verkauft als vorhanden) → Validierung beim Erfassen eines Verkaufs nötig
- Split-Ereignisse verändern die Stückzahl ohne Wertveränderung → als eigener Transaktionstyp «Split» mit Faktor erfassen

### Empfehlung
**Immer frisch berechnen, nichts cachen.** Einfachheit schlägt Performance bei diesem Datenvolumen.

---

## M3 – Einstandswertberechnung

### Fachlicher Zweck
Den durchschnittlichen Kaufpreis einer Position kennen, um realisierte und offene Gewinne korrekt berechnen zu können.

### FIFO oder Durchschnittsmethode?

**Durchschnittsmethode — eindeutige Empfehlung für einen Schweizer Privatanleger.**

Begründung:
- Die Schweiz erhebt **keine Kapitalertragsteuer** auf private Veräusserungsgewinne (Ausnahme: gewerbsmässiger Handel). FIFO ist steuerlich irrelevant.
- FIFO erfordert das Matching jedes Verkaufs mit konkreten Käufen in chronologischer Reihenfolge — deutlich komplexer zu implementieren und zu erklären.
- Die Durchschnittsmethode ist intuitiv: Man weiss zu jedem Zeitpunkt, was eine Position «im Schnitt» gekostet hat.

**Berechnung:**
```
Einstandspreis = Summe(Anzahl_i × Kurs_i + Gebühren_i) / Gesamtanzahl
                 (nur Käufe, gewichtet nach Stückzahl)
```

Bei einem Teilverkauf bleibt der Einstandspreis pro Stück unverändert — nur die Anzahl reduziert sich.

### Risiken
- Bei sehr kleinen Positionen entstehen Rundungsdifferenzen — akzeptabel
- Splits müssen den Einstandspreis korrekt anpassen (neuer Einstandspreis = alter Einstandspreis / Split-Faktor)

### Empfehlung
**Durchschnittsmethode, keine FIFO-Option.** Eine einheitliche Methode vermeidet Verwirrung und Vergleichbarkeitsprobleme.

---

## M4 – Realisierte Gewinne und Verluste

### Fachlicher Zweck
Nach einem Verkauf festhalten, was tatsächlich verdient oder verloren wurde. Für die Jahresbetrachtung und das Verständnis vergangener Entscheidungen.

### Welche Daten speichern, welche berechnen?

**Speichern:** Nur die Verkaufstransaktion (liegt bereits im Journal).

**Berechnen:**
```
Realisierter G/V = (Verkaufskurs - Einstandspreis) × Anzahl - Gebühren_Verkauf
```

Der realisierte G/V ist deterministisch aus Transaktionsjournal + Einstandspreismethode berechenbar. Es gibt keinen Grund, ihn separat zu speichern — das wäre eine berechnete Grösse in einer Datenhaltung, die aus dem Sync fallen kann.

**Einzige sinnvolle Aggregation:** Summe der realisierten G/V pro Steuerjahr — aber auch das wird berechnet, nicht gespeichert.

### Risiken
- Nachträgliche Korrekturen im Transaktionsjournal ändern automatisch alle G/V-Berechnungen — das ist gewollt (eine Quelle der Wahrheit), aber muss kommuniziert werden

### Empfehlung
**Nicht separat speichern — immer berechnen.** Sauberste Lösung.

---

## M5 – Offene Positionen

### Fachlicher Zweck
Den aktuellen Zustand des Depots sehen: Was halte ich, was ist es wert, wie steht es im Vergleich zum Kaufpreis?

### Welche Kennzahlen sind wirklich entscheidungsrelevant?

**Relevant:**
- Aktueller Wert in CHF (Bestand × aktueller Kurs × Wechselkurs)
- Einstandswert in CHF (Referenz)
- Offener G/V absolut in CHF
- Offener G/V in %
- Anteil am Gesamtdepot in %

**Häufig dargestellt, aber geringer Nutzen:**
- Tagesveränderung in % — erzeugt Aktionismus, kein Mehrwert für einen langfristigen Anleger
- Beta, Volatilität, Sharpe Ratio — für aktives Risikomanagement, nicht für einen Privatanleger mit Langfristfokus
- 52-Wochen-Hoch/Tief — eher für Trading relevant
- Dividendenrendite auf Basis Einstandskurs — interessant, aber nicht Kernkennzahl

### Empfehlung
**Auf fünf Kennzahlen beschränken:** Wert, Einstandswert, G/V absolut, G/V %, Depotanteil %. Alles andere ist optional und kann später ergänzt werden.

---

## M6 – Kursversorgung

### Fachlicher Zweck
Ohne aktuelle Kurse keine aktuelle Bewertung. Die Kursversorgung ist der einzige externe Prozess im System — alles andere ist intern.

### Empfehlung: Yahoo Finance

**Warum:**
- Kostenlos, kein API-Key für Grundfunktionen nötig
- Deckt nahezu alle international gehandelten Wertpapiere ab (inkl. SIX Swiss Exchange über Ticker-Suffix `.SW`)
- Python-Bibliothek `yfinance` ist stabil, gut dokumentiert und weit verbreitet
- Tagesschlusskurse und historische Daten verfügbar

**Wie:**
```python
import yfinance as yf
ticker = yf.Ticker("NESN.SW")
kurs = ticker.fast_info["last_price"]
```

**Alternativen:**

| Quelle | Kosten | Qualität | Eignung |
|---|---|---|---|
| Yahoo Finance | kostenlos | gut | Empfohlen |
| Alpha Vantage | kostenlos (25 calls/Tag) | gut | Backup |
| Twelve Data | kostenlos (800 calls/Tag) | gut | Backup |
| SIX | kostenpflichtig | sehr gut | Overkill |
| Scraping | kostenlos | fragil | Nicht empfohlen |

**Robustheit:** Yahoo Finance kann temporär ausfallen oder Kurse verzögert liefern. Deshalb: Kursversorgung immer mit Fehlerbehandlung, und wenn kein Kurs verfügbar → letzten bekannten Kurs verwenden und warnen, nicht abbrechen.

### Risiken
- Yahoo Finance ist ein inoffizielles API — keine SLA, kann sich ändern
- Ticker-Symbole müssen korrekt gepflegt werden (SIX: `.SW`, Xetra: `.DE`, etc.)

### Empfehlung
**Yahoo Finance als Primärquelle, Alpha Vantage als Fallback.** Wechselkurse über dasselbe API (`CHFEUR=X`, `CHFUSD=X`).

---

## M7 – Depotwertberechnung

### Fachlicher Zweck
Den aktuellen Gesamtwert des Depots in einer einheitlichen Referenzwährung (CHF) kennen. Grundlage für alle Performancekennzahlen.

### Welche Berechnungslogik ist ausreichend?

```
Depotwert (CHF) = Summe über alle Positionen von:
    Bestand × aktueller Kurs (in Handelswährung) × Wechselkurs (in CHF)
```

Das ist alles. Keine Mark-to-model-Bewertung, keine Abzinsung, keine Bewertungsanpassungen.

**Wechselkurse:** Tagesschlusskurs des Vortages ist ausreichend (oder aktueller Intraday-Kurs von Yahoo Finance). Keine Echtzeit-Anforderung.

### Welche Komplexität sollte vermieden werden?

- Keine Bewertung zu historischen Wechselkursen (nur für G/V-Berechnung in Fremdwährung relevant, optional)
- Keine Transaktionskosten-adjustierte Berechnung des Depotwertes (nur für Einstandswert relevant)
- Keine Total Return Berechnung inkl. Dividenden im Depotwert selbst (separat ausweisen)

### Empfehlung
**Einfache Summe mit aktuellem Kurs × Wechselkurs.** Reicht für alle Entscheidungen eines Privatanlegers.

---

## M8 – Tagesreport

### Fachlicher Zweck
Einmal täglich eine klare Zusammenfassung des Depotzustands, die in 30 Sekunden gelesen werden kann.

### Was gehört zwingend hinein?

```
Datum
Depotwert CHF          [aktuell]
Einstandswert CHF      [was wurde investiert]
Offener G/V CHF / %    [wie steht es]
Tagesveränderung CHF   [was hat sich heute getan]

Positionen:
  [ISIN / Titel] [Bestand] [Kurs] [Wert CHF] [G/V %]

Aktivitäten seit letztem Report:
  [Transaktionen der letzten 24h, falls vorhanden]
```

### Was ist überflüssig?

- Hugo-Build-Status, Git-Commit-Hashes — Betriebsinformation, nicht Anlegerinformation
- Checksummen, Prozessschritte, Laufzeiten — gehören ins Fehlerjournal, nicht in den Report
- Vergleich mit Index — optional, nicht Kern

### Wie sieht ein guter Tagesreport für einen Privatanleger aus?

Eine Seite. Drei Blöcke:
1. **Gesamtstatus** — Depotwert, G/V, Veränderung
2. **Positionen** — Tabelle, nach Wert absteigend sortiert
3. **Aktivitäten** — nur wenn etwas passiert ist

Kein Betriebslog. Keine technischen Details.

### Empfehlung
**Konsequent auf Anlegersicht ausrichten.** Technische Betriebsinformationen in eine separate Logdatei auslagern.

---

## M9 – Historisierung der Depotwerte

### Fachlicher Zweck
Die Vermögensentwicklung über Zeit verfolgen. Grundlage für Performance-Charts (1M, 3M, 1J, seit Beginn).

### Täglich, wöchentlich oder monatlich?

**Täglich — mit minimalem Aufwand.**

Ein täglicher Gesamtdepotwert in CHF: Das sind 365 Werte pro Jahr. Minimaler Speicherbedarf, maximaler Nutzen für Charts.

**Was gespeichert wird:**
```
Datum | Depotwert CHF
```

Das ist alles. Nicht je Position (das wäre 365 × Anzahl Positionen Werte/Jahr und kaum nützlicher). Nicht je Währung. Nur der Gesamtwert.

**Vergleich:**

| Frequenz | Aufwand | Nutzen | Empfehlung |
|---|---|---|---|
| Täglich (Gesamtwert) | minimal | hoch (Charts) | **Ja** |
| Täglich (je Position) | mittel | kaum höher | Nein |
| Wöchentlich | minimal | mittel (Charts grob) | Fallback |
| Monatlich | minimal | niedrig (nur Monatsreport) | Zu wenig |

### Empfehlung
**Täglich den Gesamtdepotwert in CHF speichern.** Einzeilig, einmal pro Tag, unveränderlich. Liefert alles für sinnvolle Performance-Darstellungen.

---

## M10 – Datenvalidierung

### Fachlicher Zweck
Verhindern, dass falsche Daten ins System gelangen und alle Folgeberechnungen verfälschen. Fehler beim Erfassen sind viel teurer als Fehler später.

### Welche Prüfungen sind zwingend?

| Prüfung | Warum zwingend |
|---|---|
| Bestand nach Verkauf ≥ 0 | Negativer Bestand ist buchhalterisch unmöglich |
| Kurs > 0 | Kurs von 0 verfälscht alle Wertberechnungen |
| Anzahl > 0 | Muss positiv sein |
| Datum nicht in der Zukunft | Zukunftstransaktionen sind Fehler |
| Typ ist gültiger Wert | Schutz vor Tippfehlern |
| ISIN nicht leer | Grundlage für alle Zuordnungen |

### Welche Prüfungen sind Nice-to-have?

| Prüfung | Kommentar |
|---|---|
| ISIN-Format (12 Zeichen, Ländercode) | Gut, aber ISIN-Fehler fallen spätestens bei Kursabfrage auf |
| Kurs plausibel (nicht 1000× vom Vortag abweichend) | Nützlich, aber komplex |
| Währung ist gültiger ISO-Code | Gut, aber selten falsch |
| Verkaufsdatum nach Kaufdatum | Logisch, aber aufwändig zu prüfen |

### Empfehlung
**Sechs zwingende Prüfungen implementieren, Rest weglassen.** Die aufwändigen Plausibilitätsprüfungen (Kursabweichung, Datumlogik) sind fehleranfälliger in der Implementierung als die Fehler, die sie verhindern sollen.

---

## M11 – Reproduzierbarkeit

### Fachlicher Zweck
Jede Kennzahl muss nachvollziehbar sein: Woher kommt dieser Wert? Welche Eingaben führen zu diesem Ergebnis?

### Wie sicherstellen, ohne unnötige Komplexität?

Die Reproduzierbarkeit ergibt sich **automatisch** aus dem Datenmodell, wenn:

1. Das Transaktionsjournal unveränderlich ist
2. Die Kurshistorie unveränderlich ist (jeder Kurs wird einmal gespeichert und nie überschrieben)
3. Alle Berechnungen deterministisch und zustandslos sind (kein Cache, keine Zwischenwerte)

Dann gilt: Dieselben Transaktionen + derselbe Kurs an demselben Datum → immer dasselbe Ergebnis.

**Konkret:** Wenn der Depotwert vom 15. März 2026 gefragt wird, nimmt man die Bestände aus dem Transaktionsjournal bis zu diesem Datum + die gespeicherten Schlusskurse vom 15. März. Das Ergebnis ist immer identisch.

**Kein Versionierungssystem nötig, kein Audit-Trail-Overhead** — die Unveränderlichkeit der Quelldaten ist der Audit-Trail.

### Empfehlung
**Keine zusätzlichen Massnahmen nötig** — Reproduzierbarkeit entsteht durch das Datenmodell selbst.

---

## M12 – Hugo-Publikation

### Fachlicher Zweck
Die Depotauswertung in lesbarer, visuell ansprechender Form zugänglich machen — ohne in die Datenhaltung eingreifen zu müssen.

### Was soll publiziert werden?

**Auf Hugo:**
- **Dashboard:** Depotwert, G/V, Tagesveränderung — das tägliche Cockpit
- **Positionsübersicht:** Alle Positionen als Tabelle (Wert, Anteil, G/V %)
- **Vermögensverlauf:** Chart des täglichen Gesamtdepotwerts (1M, 3M, 1J, seit Beginn)
- **Monatsbericht:** Wenn abgeschlossen, als statische Seite

**Nicht auf Hugo:**
- Transaktionsjournal (persönliche Finanzdaten — nicht für Publikation geeignet)
- Kursrohdaten und Wechselkurshistorie
- Fehlerjournal und technische Logs
- Konfigurationsdaten

### Informationsarchitektur

```
/ (Dashboard)
  → Depotwert heute / G/V gesamt / Tagesveränderung
  → Positionen (kompakte Tabelle)

/verlauf
  → Vermögensentwicklung (Chart, wählbarer Zeitraum)

/positionen
  → Detaillierte Positionstabelle mit allen Kennzahlen

/berichte
  → Monatsberichte (Liste, absteigend nach Datum)
  → /berichte/2026-06 (einzelner Monatsbericht)
```

### Empfehlung
**Hugo als reine Darstellungsschicht.** Die Datenhaltung bleibt in Airtable. Hugo bekommt täglich exportierte JSON/CSV-Dateien, die es statisch rendert. Kein direkter Datenbankzugriff von Hugo aus.

---

## Architekturfragen

### Frage 1 – Was ist die eigentliche Quelle der Wahrheit?

**Das Transaktionsjournal — einzig und allein.**

Nicht Positionen (abgeleitet), nicht Bewertungen (berechnet), nicht Kurse (Hilfsdaten). Das Transaktionsjournal ist die einzige Datenmenge, die manuell erfasst wird und nie verändert werden darf. Alles andere folgt daraus mit deterministischen Berechnungen.

Konsequenz: Wenn eine Transaktion falsch erfasst wurde, wird sie nicht korrigiert — sie wird durch eine Gegenbuchung neutralisiert (wie in der echten Buchhaltung).

---

### Frage 2 – Welche Daten sollen dauerhaft gespeichert werden?

Nur Daten, die **nicht rekonstruierbar** sind:

| Daten | Warum dauerhaft speichern |
|---|---|
| Transaktionsjournal | Primäreingabe, nicht ableitbar |
| Kurshistorie (Tagesschlusskurse) | Historische Kurse sind später nicht mehr verfügbar |
| Wechselkurshistorie | Wie Kurshistorie |
| Depotwert-Historie (Tages-Snapshot) | Komprimierte Form der täglichen Bewertung für Charts |

Nicht dauerhaft speichern: Berechnete Bestände, Einstandswerte, G/V-Werte, Depotanteile — all das ist immer rekonstruierbar.

---

### Frage 3 – Welche Daten sollen berechnet werden?

Alles, was aus gespeicherten Daten deterministisch folgt:

| Berechnung | Eingaben |
|---|---|
| Bestand je Position | Transaktionsjournal |
| Einstandspreis (Durchschnitt) | Transaktionsjournal (Käufe) |
| Realisierter G/V | Transaktionsjournal (Verkäufe) + Einstandspreis |
| Offener G/V | Bestand + aktueller Kurs + Einstandspreis |
| Depotwert CHF | Bestände + aktuelle Kurse + Wechselkurs |
| Depotanteil % | Positionswert / Gesamtdepotwert |
| Performance-Kennzahlen | Depotwert-Historie |

**Keine dieser Grössen wird gespeichert** — sie werden bei Bedarf berechnet.

---

### Frage 4 – Welche Tabellen in Airtable? (Minimalvariante)

**Fünf Tabellen:**

**1. Transaktionen** ← Quelle der Wahrheit
```
Datum | ISIN | Titel | Typ | Anzahl | Kurs | Betrag | Währung | Gebühren
```

**2. Wertpapiere** ← Stammdaten
```
ISIN | Titel | Ticker | Börse | Handelswährung | Kategorie
```
Verhindert Tippfehler bei Titel und Ticker. Wird bei erstem Kauf einmalig angelegt.

**3. Kurse** ← täglich automatisch befüllt
```
Datum | ISIN | Schlusskurs | Währung
```

**4. Wechselkurse** ← täglich automatisch befüllt
```
Datum | Währung | Kurs_CHF
```

**5. Depotwert-Historie** ← täglich automatisch befüllt
```
Datum | Depotwert_CHF
```

**Warum keine Positionstabelle?**
Positionen sind berechnete Views, keine gespeicherten Daten. In Airtable lassen sich diese als gruppierte/aggregierte Views der Transaktionen darstellen — oder sie werden beim Export für Hugo on-the-fly berechnet.

---

### Frage 5 – Was gehört in Hugo, was ausschliesslich in Airtable?

| Information | Hugo | Airtable |
|---|---|---|
| Aktueller Depotwert | ✓ (täglich aktualisiert) | ✓ (Quelle) |
| Positionsübersicht | ✓ (lesbar) | ✓ (Quelle) |
| Vermögensverlauf Chart | ✓ (visuell) | ✓ (Daten) |
| Monatsbericht | ✓ (publiziert) | ✓ (Quelldaten) |
| Transaktionsjournal | ✗ (privat) | ✓ |
| Kurshistorie | ✗ | ✓ |
| Wechselkurse | ✗ | ✓ |
| Fehlerjournal | ✗ | ✓ oder Datei |
| Konfiguration | ✗ | ✗ (Config-Datei) |

**Regel:** Hugo zeigt nur, was ein Anleger sehen soll. Airtable hält alles, was das System braucht.

---

## Empfohlene Minimalarchitektur V2

### Leitprinzip

> Eine Quelle der Wahrheit. Alle Zahlen daraus berechnet. Jede Berechnung reproduzierbar.

---

### Datenmodell

```
┌─────────────────────────────────────────────────────┐
│  TRANSAKTIONEN (Quelle der Wahrheit)                │
│  Datum | ISIN | Typ | Anzahl | Kurs | Betrag | CHF  │
└─────────────────┬───────────────────────────────────┘
                  │
        ┌─────────┴──────────┐
        │                    │
┌───────▼────────┐  ┌────────▼───────────────────────┐
│  WERTPAPIERE   │  │  KURSE + WECHSELKURSE           │
│  Stammdaten    │  │  (täglich automatisch)          │
└───────┬────────┘  └────────┬───────────────────────┘
        │                    │
        └─────────┬──────────┘
                  │
        ┌─────────▼──────────────────────────────────┐
        │  BERECHNUNG (nie gespeichert)               │
        │  Bestände | Einstandswerte | G/V | Werte   │
        └─────────┬──────────────────────────────────┘
                  │
        ┌─────────▼──────────────────────────────────┐
        │  DEPOTWERT-HISTORIE (täglich ein Wert)     │
        │  Datum | Depotwert CHF                     │
        └─────────┬──────────────────────────────────┘
                  │
        ┌─────────▼──────────────────────────────────┐
        │  EXPORT → HUGO (täglich)                   │
        │  JSON-Dateien für Dashboard, Charts        │
        └────────────────────────────────────────────┘
```

---

### Kernprozesse

**Täglicher Ablauf (einmal, nach Börsenschluss):**

```
1. Kurse aktualisieren        (Yahoo Finance → Kurse-Tabelle)
2. Wechselkurse aktualisieren (Yahoo Finance → Wechselkurse-Tabelle)
3. Depotwert berechnen        (Bestände × Kurse × Wechselkurse)
4. Depotwert speichern        (einen Satz in Depotwert-Historie)
5. Daten validieren           (Bestand ≥ 0, Kurs vorhanden, etc.)
6. Export für Hugo            (JSON-Dateien generieren)
7. Hugo bauen                 (statische Seite aus JSON)
8. Tagesbericht erstellen     (Markdown, ins Obsidian-Vault)
```

**Manuell (bei Bedarf):**
- Neue Transaktion erfassen (Kauf, Verkauf, Dividende)
- Neues Wertpapier anlegen (Stammdaten)

---

### Reporting

| Report | Inhalt | Frequenz | Ablage |
|---|---|---|---|
| Tagesbericht | Depotwert, G/V, Positionen, Aktivitäten | täglich | Obsidian |
| Monatsbericht | Performance, Dividenden, Käufe/Verkäufe | monatlich (letzter Kalendertag) | Obsidian + Hugo |
| Fehlerjournal | Technische Fehler (append-only) | bei Fehler | Obsidian |

---

### Hugo-Publikation

**Vier Seiten:**

```
/              Dashboard (Depotwert, G/V, Top-Positionen)
/positionen    Vollständige Positionstabelle
/verlauf       Vermögensentwicklung (Chart)
/berichte      Monatsberichte (Liste + Einzelseiten)
```

**Datenbasis:** Täglich generierte JSON-Dateien. Hugo rendert statisch. Kein Datenbankzugriff zur Laufzeit.

---

### Was V2 bewusst weglässt

- Zwei tägliche Ausführungen (09:45 und 22:30) → **ein Lauf**, nach Börsenschluss
- Checksummen-basierte Build-Optimierung → **immer bauen** (einfacher, kein Fehlerrisiko durch übersehene Änderungen)
- Komplexe Plausibilitätskaskaden → **sechs klare Validierungen** beim Erfassen
- FIFO → **Durchschnittsmethode** (kein Steuervorteil, deutlich einfacher)
- Separate Betriebsberichte mit Hugo/Git-Status → **Betriebsinformationen ins Fehlerjournal**, nicht in den Anlegerbericht
