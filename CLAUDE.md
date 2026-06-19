# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Projektübersicht

Bash-Automatisierungssuite für die periodische Aktienbuchhaltung. Sie importiert Depotdaten, führt Plausibilitätsprüfungen durch, baut eine Hugo-Webseite, committet/pusht via Git und schreibt strukturierte Berichte in einen Obsidian-Vault. Zwei geplante Ausführungen täglich: 09:45 (Update) und 22:30 (Tagesabschluss).

Alle Zeitangaben und Dateinamen verwenden **Europe/Zurich (CET/CEST)**.

## Skripte ausführen

```bash
# Einmalige Einrichtung — erstellt die Obsidian-Vault-Verzeichnisstruktur
bash scripts/setup.sh

# Tägliches Update (09:45)
bash scripts/run_0945.sh

# Tagesabschluss (22:30)
bash scripts/run_2230.sh
```

Es gibt kein Build-System, keinen Test-Runner und keinen Linter. Alle Skripte verwenden `set -euo pipefail` und brechen bei jedem Fehler sofort ab.

## Konfiguration

`config/aktienbuchhaltung.conf` ist die einzige Quelle der Wahrheit für alle Pfade, die Zeitzone und das CSV-Parsing:

```bash
OBSIDIAN_VAULT="${HOME}/Documents/Obsidian"
BETRIEB_ROOT="${OBSIDIAN_VAULT}/90_Betrieb/Aktienbuchhaltung"
HUGO_PROJECT="${HOME}/sites/depot"
DEPOT_QUELLDATEI="${OBSIDIAN_VAULT}/Depot/depot.csv"
TIMEZONE="Europe/Zurich"
CSV_SPALTE_ISIN=0        # 0-basierte Spaltenindizes
CSV_SPALTE_DATUM=1
CSV_SPALTE_WERT=2
CSV_TRENNZEICHEN=","
MAX_ALTER_TAGE=7
TOLERANZ_BETRAG="0.01"
```

Pfade niemals in Library-Dateien hart kodieren — immer aus Konfigurationsvariablen ableiten.

## Architektur

### Library-Muster

`scripts/lib/` enthält Module mit einer einzigen Verantwortlichkeit, die von den Run-Skripten eingebunden werden:

| Library | Verantwortlichkeit |
|---|---|
| `common.sh` | Zeitstempel, Logging (`info`, `warn`, `fehler`), Konfiguration laden |
| `backup.sh` | Zeitgestempeltes Backup vor jeder Datenänderung |
| `checksums.sh` | SHA-256-Änderungserkennung, gespeichert in `Status/checksums.txt` |
| `plausibility.sh` | 5 Validierungsregeln (nur 09:45) |
| `hugo_build.sh` | Build in temporäres Verzeichnis, HTML-Ausgabe validieren, atomarer Tausch nach `public/` |
| `git_ops.sh` | `git status` → bedingter Commit → Push |
| `reports.sh` | Statusdatei, Tagesberichte, Monatsberichte |
| `publish.sh` | Orchestriert: Checksummen → hugo_build → git_ops |
| `finalize.sh` | Orchestriert Berichte nach publish |

### Gemeinsame Teilprozeduren

Beide Run-Skripte rufen diese nach ihren eigenen Schritten auf:

**`publish()`** — Checksum-Vergleich → (überspringen falls unverändert) → Hugo-Build in Tempverzeichnis → validieren → atomarer `public/`-Tausch → Git-Commit + Push

**`finalize()`** — `Status/Aktienbuchhaltung_Status.md` überschreiben → neuen Tagesbericht anhängen → Monatsbericht erstellen falls letzter Kalendertag des Monats

### Noch nicht implementierte Abschnitte (TODO)

`run_0945.sh` enthält Platzhalter für: Depotdaten importieren, Aktienbuchhaltung aktualisieren, Vermögenscockpit berechnen. `run_2230.sh`: Datenkonsistenz prüfen, Aktienbuchhaltung validieren, Vermögenscockpit neu berechnen. Plausibilitätsregel 5 (Abstimmung Kontobewegungen) ist ebenfalls noch nicht implementiert.

## Dateibenennungs- und Ablagekonventionen

Alle Ausgaben landen unter `${BETRIEB_ROOT}` (`90_Betrieb/Aktienbuchhaltung/`):

```
Status/Aktienbuchhaltung_Status.md          ← wird bei jedem Lauf überschrieben
Status/checksums.txt                         ← wird nach jedem Hugo-Build aktualisiert
Tagesberichte/yyyy-mm-dd_hhmm_Aktienbuchhaltung_Update.md
Tagesberichte/yyyy-mm-dd_hhmm_Aktienbuchhaltung_Tagesabschluss.md
Monatsberichte/yyyy-mm_Monatsreport_Depot.md
Backups/yyyy-mm-dd_hhmm_depot_backup.<ext>
Fehlerjournal/Fehlerjournal.md
```

Zeitkomponente im Dateinamen: `0945` oder `2230` — immer vierstellig, kein Trennzeichen.

## Unveränderlichkeitsregeln

Diese Regeln sind verbindliche Vorgaben, keine Empfehlungen:

- **Tagesberichte** und **Backups** werden nur erstellt — niemals nachträglich verändert
- **Fehlerjournal** ist ausschliesslich zum Anhängen
- Historische Transaktionen dürfen niemals gelöscht oder stillschweigend korrigiert werden
- Die Statusdatei ist die einzige Datei, die bei jedem Lauf überschrieben wird

## Fehlerbehandlung

Die Funktion `fehler()` in `common.sh` protokolliert den Fehler, hängt ihn an `Fehlerjournal.md` an und ruft `exit 1` auf. Jeder Fehler stoppt den gesamten Prozess — keine Teilläufe, keine Fehler-Recovery-Schleifen. Bei einem Hugo-Build-Fehler wird das Tempverzeichnis verworfen und `public/` bleibt unverändert (Rollback).

Beim Hinzufügen neuer Schritte zu einem Run-Skript immer `fehler "Meldung"` statt `echo` + `exit` verwenden, damit das Fehlerjournal aktualisiert wird.

## Skill-Integration

`.claude/skills/aktienbuchhaltung-betrieb/SKILL.md` definiert diesen Workflow als benutzeraufrufbaren Claude-Code-Skill (`/aktienbuchhaltung-betrieb`). Beim Aufruf des Skills wird die Konfiguration geladen und das passende Run-Skript je nach Tageszeit aufgerufen. Die SKILL.md ist die massgebliche Spezifikation für erwartete Ausgaben, Berichtsformate und Plausibilitätsregeln — bei der Implementierung fehlender Geschäftslogik dort nachschlagen.
