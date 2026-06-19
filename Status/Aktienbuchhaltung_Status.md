---
tags:
  - Aktienbuchhaltung
  - Status
  - V2
  - Planung
erstellt: 2026-06-19
status: Planung abgeschlossen
---

# Aktienbuchhaltung V2 — Statusbericht

> [!success] Planungsphase abgeschlossen
> Alle Grundsatzentscheidungen sind getroffen. Die V2 kann implementiert werden.

---

## Ausgangslage

Die bestehende [[Aktienbuchhaltung V1]] wurde analysiert und für ungeeignet als Basis befunden. Das Kernproblem: Es fehlt ein Transaktionsjournal als Quelle der Wahrheit. Alle Berechnungen (Einstandswert, G/V, Depotwert) setzen dieses voraus.

**Entscheidung:** Neubau V2 — keine Erweiterung der V1.

---

## Getroffene Entscheidungen

### Datenmodell

| Entscheidung | Gewählt | Begründung |
|---|---|---|
| Quelle der Wahrheit | Transaktionsjournal | Einzige nicht-ableitbare Datenmenge |
| Einstandsmethode | Durchschnitt | Schweiz: keine Kapitalertragsteuer, FIFO unnötig |
| Bestandsberechnung | Immer neu berechnen | Kein Cache-Risiko, Datenvolumen klein |
| G/V gespeichert? | Nein — berechnet | Deterministisch aus Journal ableitbar |
| Historisierung | Täglich, Gesamtwert CHF | 1 Wert/Tag reicht für Performance-Charts |

### Broker

Fünf Broker mit überlappenden Beständen:
- **Swissquote**
- **Saxo**
- **Captrader**
- **LUKB**
- **Findependent**

> [!important] Broker-Feld ist Pflicht
> Derselbe Titel kann bei mehreren Brokern gleichzeitig gehalten werden. Das Transaktionsjournal braucht ein Broker-Feld.

**Auswertungslogik:**
- Primär: Konsolidiert nach ISIN (alle Broker summiert)
- Sekundär: Pro Broker (für Transfers, Rebalancing)

### Kursversorgung

| Quelle | Rolle |
|---|---|
| **Twelve Data** | Primär — offizielles API, 800 Calls/Tag kostenlos |
| **Yahoo Finance** | Fallback — für Titel die Twelve Data nicht kennt |
| Broker-Export | Nicht genutzt — 5 verschiedene Formate, zu wartungsintensiv |

**Transaktionserfassung:** Manuell (5–20 Transaktionen/Monat, wenige Minuten Aufwand, kein Parserfehler).

---

## Datenmodell

### Transaktionsjournal (Quelle der Wahrheit)

| Feld | Pflicht |
|---|---|
| Datum | ja |
| Broker | ja |
| ISIN | ja |
| Titel | ja |
| Typ (Kauf/Verkauf/Dividende/Einbuchung/Ausbuchung) | ja |
| Anzahl | bei Kauf/Verkauf |
| Kurs | bei Kauf/Verkauf |
| Betrag (Handelswährung) | ja |
| Währung | ja |
| Gebühren | nein |

### Airtable-Tabellen (5 Tabellen)

1. **Transaktionen** — Quelle der Wahrheit
2. **Wertpapiere** — Stammdaten (ISIN, Ticker, Börse, Währung)
3. **Kurse** — Tagesschlusskurse je ISIN (täglich automatisch)
4. **Wechselkurse** — CHF vs. relevante Währungen (täglich automatisch)
5. **Depotwert-Historie** — Datum + Gesamtwert CHF (täglich automatisch)

---

## Kernprozess (täglich, nach Börsenschluss)

```
1. Kurse aktualisieren       → Twelve Data → Tabelle Kurse
2. Wechselkurse aktualisieren → Twelve Data → Tabelle Wechselkurse
3. Depotwert berechnen        → Bestände × Kurse × Wechselkurse
4. Depotwert speichern        → Tabelle Depotwert-Historie
5. Validierung                → Bestand ≥ 0, Kurs vorhanden
6. Export für Hugo            → JSON-Dateien generieren
7. Hugo bauen                 → Statische Seite aus JSON
8. Tagesbericht erstellen     → Markdown ins Obsidian-Vault
```

---

## Reporting

| Report | Inhalt | Frequenz |
|---|---|---|
| Tagesbericht | Depotwert, G/V, Positionen, Aktivitäten | täglich |
| Monatsbericht | Performance, Dividenden, Käufe/Verkäufe | letzter Kalendertag |
| Fehlerjournal | Technische Fehler (append-only) | bei Fehler |

---

## Hugo-Publikation

**Vier Seiten:**

| Pfad | Inhalt |
|---|---|
| `/` | Dashboard — Depotwert, G/V, Top-Positionen |
| `/positionen` | Vollständige Positionstabelle |
| `/verlauf` | Vermögensentwicklung (Chart) |
| `/berichte` | Monatsberichte |

**Nicht auf Hugo:** Transaktionsjournal, Kursrohdaten, Fehlerjournal, Konfiguration.

---

## Was V2 gegenüber V1 weglässt

- ~~Zwei tägliche Läufe (09:45 / 22:30)~~ → ein Lauf nach Börsenschluss
- ~~Checksummen-basierter Build-Skip~~ → immer bauen
- ~~Broker-CSV-Import~~ → manuelle Erfassung
- ~~FIFO~~ → Durchschnittsmethode
- ~~Betriebsstatus im Anlegerbericht~~ → Betriebslog separat

---

## Offene Punkte

> [!todo] Noch zu klären
> - [ ] Welcher Tagesabschluss-Zeitpunkt? (nach US-Börsenschluss = ~23:00 Zürich, oder früher?)
> - [ ] Historische Transaktionen aus 5 Brokern einmalig importieren oder manuell nacherfassen?
> - [ ] Referenzwährung für Performance-Berechnung: ausschliesslich CHF?
> - [ ] Findependent — hat die App einen CSV-Export?

---

## Nächste Schritte

> [!note] Reihenfolge
> 1. Airtable-Struktur anlegen (5 Tabellen)
> 2. Historische Transaktionen erfassen (Bootstrap)
> 3. Kursversorgung implementieren (Twelve Data)
> 4. Berechnungslogik und täglicher Lauf
> 5. Hugo-Dashboard
> 6. Tagesbericht und Monatsbericht

---

## Referenzdokumente

- [[Aktienbuchhaltung_V2_Analysebericht]] — V1-Bewertung und Neubau-Entscheidung
- [[Aktienbuchhaltung_V2_Entscheidungsgrundlage]] — Bewertung aller 12 Muss-Anforderungen
