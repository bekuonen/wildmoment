# Aktienbuchhaltung V1 → V2 — Analyse- und Entscheidungsbericht

---

## Teil 1 – Bewertung der V1

### Was ist fachlich sinnvoll und empfehlenswert

**Fail-fast Prinzip**
`set -euo pipefail` in jedem Skript. Kein stiller Datenverlust, kein halbfertiger Lauf. Fachlich korrekt für ein revisionssicheres System.

**Unveränderlichkeitsregeln**
Tagesberichte und Backups werden nie überschrieben, das Fehlerjournal ist append-only. Das ist buchhalterisch richtig — historische Dokumente gehören versiegelt.

**Strukturiertes Fehlerjournal**
`fehler()` in `common.sh` erzeugt strukturierte Einträge mit Prozess, Beschreibung, Ursache, Auswirkung und Massnahme. Gut für manuelle Nachverfolgung von Ausfällen.

**SHA-256 Änderungserkennung**
Verhindert unnötige Hugo-Builds wenn sich nichts geändert hat. Ressourcenschonend und korrekt.

**Atomic Swap bei Hugo-Build**
`public/` bleibt unverändert wenn der Build scheitert. Kein halb-publizierter Zustand.

**Zentrale Konfiguration**
Alle Pfade und Parameter in `aktienbuchhaltung.conf`. Keine verteilten Hard-Codes in Libraries.

**Zeitzonensicherheit**
Alle Zeitstempel explizit in `Europe/Zurich`. Korrekt für einen Schweizer Anleger mit Schweizer Broker.

---

### Was ist unnötig komplex, fachlich schwach oder wartungsintensiv

**Das fundamentalste Problem: Es gibt keine Transaktionshistorie.**
`depot.csv` enthält einen Snapshot des aktuellen Bestands — ISIN, Datum, Wert. Es gibt keine historischen Transaktionen. Kein Kaufdatum, kein Kaufpreis, kein Transaktionstyp. Damit fehlt die Grundlage jeder Buchhaltung: *Was habe ich wann zu welchem Preis gekauft?*

**Ohne Transaktionshistorie keine Einstandswerte — ohne Einstandswerte kein Gewinn/Verlust.**
Das ist nicht ein fehlendes Feature. Das ist das fehlende Fundament. Alles andere baut darauf auf.

**5 von 8 Prozessschritten sind leere Stubs.**
`run_0945.sh`: Depotimport, Buchhaltungsaktualisierung, Cockpit-Berechnung — alles TODO. `run_2230.sh`: Konsistenzprüfung, Validierung, Cockpit — alles TODO. Die Skripte laufen durch, loggen «Erfolgreich», und haben nichts getan ausser einem Backup und einem Hugo-Build.

**Monatsberichte sind Gerüst ohne Inhalt.**
Alle 8 Abschnitte (`## Monatsperformance`, `## Dividenden`, etc.) enthalten nur `<!-- TODO -->`. Ein Anleger erhält keinen einzigen Zahlenwert.

**Zwei tägliche Läufe ohne fachlich klare Abgrenzung.**
Der Unterschied zwischen 09:45 und 22:30 sollte fachlich sein: Update der Tageskurse vs. Tagesabschluss mit Bewertung. In der Implementierung sind beide Läufe strukturell identisch mit unterschiedlichen TODO-Kommentaren.

**Datenalter-Prüfung (Regel 4) stoppt nicht.**
Wenn Daten älter als 7 Tage sind, gibt es nur ein `log_warn`. Das widerspricht dem Fail-fast-Prinzip — entweder ist das eine Fehlergrenze oder sie ist es nicht.

**Kein Konzept für verschiedene Transaktionstypen.**
Das CSV-Modell (ISIN, Datum, Wert) kann keine Dividenden, Splits, Einbuchungen, Ausbuchungen abbilden. Für ein vollständiges Depot unzureichend.

**Keine Währungsumrechnung.**
`awk` summiert Werte aus der CSV ohne Rücksicht auf Fremdwährungspositionen. Für ein Depot mit CHF, EUR, USD nicht korrekt.

**Bash ist für Orchestrierung, nicht für Geschäftslogik.**
Checksummen, Backups, Git, Dateioperationen — das ist gutes Bash-Terrain. Einstandswert-Berechnung, FIFO, Performance-Berechnung, Währungsumrechnung — das wird in Bash wartungsintensiv und fehleranfällig.

---

## Teil 2 – Umbau oder Neubau?

### Variante A — Umbau der V1

**Aufwand:** Sehr hoch. Das fehlende Fundament (Transaktionsjournal) muss eingebaut werden, ohne die bestehende Infrastruktur zu zerstören. Jede neue Geschäftslogik muss in das bestehende Library-System eingefügt werden.

**Risiken:** Das Bash-Framework wurde für Orchestrierung entworfen, nicht für Buchhaltungslogik. Je mehr Berechnung dazukommt (FIFO, Währung, Performance), desto spröder wird der Code.

**Verständlichkeit:** Niedrig. Eine neue Instanz muss zuerst 9 Libraries, 2 Run-Skripte und eine SKILL.md verstehen, bevor sie an der eigentlichen Buchführung arbeiten kann.

**Wartbarkeit:** Abnehmend. Bash-Berechnungen über CSV sind schwer zu testen, schwer zu debuggen und schwer zu erweitern.

**Zukunftsfähigkeit:** Eingeschränkt. Das Datenmodell (flaches CSV) trägt einen vollständigen Anforderungskatalog nicht.

---

### Variante B — Neubau der V2

**Aufwand:** Klar strukturierter Neustart. Die bewährten Teile aus V1 (Fehlerjournal-Muster, Ablagestruktur, Backup-System, Fail-fast, Hugo-Integration) werden als Konventionen übernommen, nicht als Code-Kopie.

**Risiken:** Gering. Keine Abhängigkeiten von bestehendem Code, der intern inkonsistent ist.

**Verständlichkeit:** Hoch, wenn von Beginn an auf Einfachheit ausgerichtet. Das Datenmodell ist der Mittelpunkt, nicht die Betriebsinfrastruktur.

**Wartbarkeit:** Hoch, wenn das Transaktionsjournal die einzige Quelle der Wahrheit ist.

**Zukunftsfähigkeit:** Hoch. Ein sauberes Datenmodell trägt alle zukünftigen Anforderungen.

---

### Empfehlung: **Neubau V2**

**Begründung:**

Das Fundament fehlt. Ein Umbau der V1 wäre ein Neubau unter dem Zwang, eine bestehende Hülle zu respektieren, die für die eigentliche Aufgabe nicht konzipiert wurde.

V1 hat kein bestehendes Datenmodell, das migriert werden müsste — weil das Kernmodell (Transaktionsjournal) noch nicht existiert. Es gibt keine historischen Daten, die schützenswert wären. Es gibt nur betriebliche Infrastruktur — und die ist gut genug, um als Vorlage zu dienen, aber nicht gut genug, um als Fundament zu dienen.

Die bewährten Konventionen aus V1 — Fehlerjournal, Ablagestruktur, Backup-Namensschema, Zeitzonensicherheit, Unveränderlichkeitsregeln — werden in V2 vollständig übernommen. Das ist kein Wegwerfen von V1. Das ist Destillieren.

---

## Teil 3 – Anforderungen an V2

### Muss-Funktionen

| # | Anforderung |
|---|---|
| M1 | **Transaktionsjournal** — jeder Kauf, Verkauf, jede Dividende, Einbuchung, Ausbuchung dauerhaft und unveränderlich erfassen |
| M2 | **Bestandsberechnung** — aktueller Bestand je Position, aus Transaktionen berechnet |
| M3 | **Einstandswertberechnung** — Kaufpreis je Position (FIFO oder Durchschnittsmethode, einheitlich) |
| M4 | **Realisierte Gewinne und Verluste** — beim Verkauf berechnet, nach Steuerjahr auswertbar |
| M5 | **Offene Positionen** — aktueller Wert, Einstandswert, offener Gewinn/Verlust |
| M6 | **Aktuelle Kurse importieren** — tägliche Marktpreise je ISIN |
| M7 | **Depotwertberechnung** — Gesamtwert in Referenzwährung (CHF) inkl. Währungsumrechnung |
| M8 | **Tagesbericht mit echten Zahlen** — kein Stub, kein TODO |

### Soll-Funktionen

| # | Anforderung |
|---|---|
| S1 | Historische Vermögensentwicklung (1 Monat, 3 Monate, 1 Jahr, seit Beginn) |
| S2 | Dividendenübersicht — pro Titel und gesamt, nach Jahr |
| S3 | Monatsbericht mit echten Zahlen (Monatsperformance, Käufe, Verkäufe, Dividenden) |
| S4 | Positionsgewichtung — Anteil je Titel am Gesamtvermögen |
| S5 | Top-Gewinner und Top-Verlierer — nach absolutem und prozentualem Gewinn/Verlust |
| S6 | Konzentrationswarnung — wenn eine Position einen definierten Schwellenwert überschreitet |
| S7 | Hugo-Dashboard mit aktuellem Depotstatus |

### Kann-Funktionen

| # | Anforderung |
|---|---|
| K1 | Asset-Allocation-Analyse nach Kategorie, Region oder Währung |
| K2 | Vergleich mit einem Referenzindex (z.B. SMI, MSCI World) |
| K3 | Jahresbericht |
| K4 | Steuerrelevante Auswertung (realisierte Gewinne nach Steuerjahr) |

### Nicht Aufgabe einer Aktienbuchhaltung

- Kauf- oder Verkaufsentscheidungen treffen oder empfehlen
- Marktprognosen oder Kursvorhersagen
- Orderausführung oder Broker-Anbindung (aktives Trading)
- Steuerformulare ausfüllen oder einreichen
- Verwaltung von Bankkonten ausserhalb des Depots

---

## Teil 4 – Fachliches Zielmodell

### Quelle der Wahrheit

**Das Transaktionsjournal.**

Jede Buchung wird einmalig erfasst und ist danach unveränderlich. Kein anderes Dokument überschreibt, korrigiert oder ersetzt eine Transaktion. Alle weiteren Daten — Bestände, Einstandswerte, Gewinne, Depotwert — werden aus dem Journal berechnet.

---

### Welche Daten werden dauerhaft gespeichert?

**Transaktionsjournal** — die einzige Quelle der Wahrheit:

```
Datum | ISIN | Titel | Typ (Kauf/Verkauf/Dividende/…) | Anzahl | Kurs | Betrag | Währung | Gebühren
```

**Kurshistorie** — Tagesschlusskurse je ISIN, einmal abgelegt und unveränderlich:

```
Datum | ISIN | Kurs | Währung
```

**Wechselkurshistorie** — Tagesschlusskurse für relevante Währungspaare:

```
Datum | Von | Nach | Kurs
```

---

### Welche Daten werden automatisch aktualisiert?

- Aktuelle Kurse je ISIN (täglich, nach Börsenschluss)
- Aktuelle Wechselkurse (täglich)

Diese Daten kommen von aussen und werden als neue Einträge in die Kurshistorie geschrieben — nie überschrieben.

---

### Welche Daten werden berechnet?

Alle Auswertungsdaten werden bei Bedarf aus dem Transaktionsjournal und der Kurshistorie berechnet. Keine gespeicherten Zwischenergebnisse, die veralten könnten.

| Berechnung | Grundlage |
|---|---|
| Bestand je Position | Transaktionsjournal (Käufe minus Verkäufe) |
| Einstandswert | Transaktionsjournal (FIFO oder Durchschnitt, einheitlich) |
| Realisierter G/V | Verkaufspreis minus Einstandswert |
| Offener G/V | Aktueller Kurs minus Einstandswert |
| Depotwert | Bestand × aktueller Kurs × Wechselkurs (CHF) |
| Performance | (aktueller Wert − Einstandswert) / Einstandswert |
| Vermögensentwicklung | Tagesdepotwert über Zeitraum |

---

### Welche Informationen sollen visualisiert werden?

Visualisierungen antworten auf konkrete Anlegerfragen:

| Frage | Darstellung |
|---|---|
| Wo stehe ich heute? | Depotwert, Einstandswert, G/V absolut und in % |
| Was halte ich? | Positionstabelle mit Wert, Anteil, G/V |
| Wie entwickelt sich mein Vermögen? | Verlaufskurve 1M / 3M / 1J / seit Beginn |
| Was hat sich verändert? | Aktivitäten der letzten 30 Tage (Käufe, Verkäufe, Dividenden) |
| Wo bestehen Risiken? | Positionsgewichtung, Konzentrationswarnung |
| Was läuft gut / schlecht? | Top-5-Gewinner, Top-5-Verlierer |

---

### Welche Informationen sollen über Hugo veröffentlicht werden?

Hugo ist Darstellungsschicht, nicht Datenhaltung. Hugo bekommt aufbereitete Daten — keine Rohdaten.

**Auf Hugo:**
- Depotstatus (aktuell, täglich aktualisiert)
- Positionsübersicht mit Kennzahlen
- Vermögensverlauf (Grafik)
- Monatsbericht (wenn abgeschlossen)
- Aktivitätszusammenfassung

**Nicht auf Hugo:**
- Transaktionsjournal (persönliche Finanzdaten, nicht für Publikation geeignet)
- Kursrohdaten
- Fehlerjournal
- Konfigurationsdaten

---

## Entscheidung

**Empfehlung: Neubau V2**

V1 hat das Richtige gut gemacht: Infrastruktur, Revisionssicherheit, Fehlerbehandlung, Ablagestruktur. Diese Konventionen werden in V2 vollständig übernommen.

V1 fehlt das Entscheidende: eine Transaktionshistorie als Quelle der Wahrheit, Einstandswerte, Gewinn/Verlust-Rechnung, Währungsumrechnung. Das sind keine Features, die man ergänzt — das ist das Fundament.

Ein Umbau von V1 wäre ein Neubau mit der Last einer Hülle, die nicht für diese Aufgabe entworfen wurde. Ein klarer Neubau ist schneller, verständlicher und zukunftsfähiger.

**Was V2 von V1 übernimmt:**
- Fail-fast Prinzip (`set -euo pipefail`)
- Fehlerjournal-Muster (append-only, strukturiert)
- Ablagestruktur und Dateinamenskonventionen
- Backup vor jeder Datenänderung
- Zeitzonensicherheit (Europe/Zurich)
- Unveränderlichkeitsregeln
- Hugo als Darstellungsschicht
- Zentralisierte Konfiguration

**Was V2 neu denkt:**
- Transaktionsjournal als Quelle der Wahrheit
- Berechnungen aus dem Journal, nicht aus einem CSV-Snapshot
- Klares Datenmodell mit Transaktionstypen (Kauf, Verkauf, Dividende, …)
- Währungsumrechnung als erstklassiges Konzept
- Reporting mit echten Zahlen — kein TODO

---

*Leitprinzip für V2: Eine Quelle der Wahrheit. Alle Zahlen davon abgeleitet. Jeder Bericht reproduzierbar.*
