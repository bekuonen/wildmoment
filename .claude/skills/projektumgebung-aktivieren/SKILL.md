---
name: projektumgebung-aktivieren
description: >
  Aktiviert vor jedem Arbeitsauftrag die richtige Projektumgebung: Projektname
  aus dem Auftrag erkennen, passende Umgebung auswählen oder suchen, ins richtige
  Arbeitsverzeichnis wechseln, zugehöriges Git-Repository und den passenden Branch
  aktivieren, alle Voraussetzungen prüfen. Ist die Umgebung nicht eindeutig oder
  unvollständig, SOFORT stoppen und den Grund melden — keine Änderungen, kein
  Commit, kein Push. Erst nach erfolgreicher Aktivierung weitere Aufträge ausführen.
  IMMER verwenden am Beginn von Arbeitsaufträgen mit Code-, Datei- oder
  Shell-Operationen ("arbeite an", "fix", "refactor", "deploy", "schreibe",
  "ändere", "erstelle Datei", "führe aus") und immer, wenn unklar ist, in welchem
  Projekt, Repository oder Verzeichnis gearbeitet werden soll. Projektunabhängig,
  funktioniert mit und ohne Git.
---

# Projektumgebung aktivieren

Zweck: Vor jedem Arbeitsauftrag sicherstellen, dass ich in der **richtigen**
Projektumgebung arbeite. Erst nach erfolgreicher Aktivierung dürfen weitere
Schritte des Auftrags ausgeführt werden. Der Skill funktioniert für alle Projekte —
unabhängig davon, ob sie Git verwenden oder nicht.

Grundregel während der Aktivierung: **nur lesen und navigieren** (Verzeichnis
wechseln, Branch auschecken). Keine inhaltlichen Änderungen, kein Commit, kein
Push, keine Installation, keine Migration — bis die Umgebung bestätigt ist.

## Schritt 1: Projektname aus dem Auftrag erkennen

Bestimme aus der Auftragsformulierung, um welches Projekt es geht. Achte auf:
- explizit genannte Projekt-, Repository- oder Verzeichnisnamen,
- Technologie-/Domänenhinweise ("die Astro-Seite", "das Finanzsystem"),
- erwartete Branch- oder Remote-Angaben.

Halte das erkannte Ziel kurz fest:
`🎯 Ziel-Projekt laut Auftrag: <Name> (Branch: <falls genannt>)`

Ist aus dem Auftrag **kein** Projekt ableitbar → weiter zu Schritt 6 (Stopp).

## Schritt 2: Passende Umgebung auswählen oder suchen

Ermittle die aktuelle Umgebung und suche bei Bedarf nach der passenden:

```bash
pwd
ls -d */ 2>/dev/null                          # mögliche Projektverzeichnisse
git rev-parse --show-toplevel 2>/dev/null || echo "(kein Git-Repository)"
```

- Passt das aktuelle Verzeichnis bereits zum Ziel-Projekt? Dann Schritt 3 überspringen.
- Sonst nach einem Verzeichnis suchen, dessen Name/Inhalt zum Ziel passt
  (z. B. `find ~ -maxdepth 3 -type d -name "<projekt>*" 2>/dev/null`).
- Mehrere gleich gute Treffer oder gar keiner → Schritt 6 (Stopp).

## Schritt 3: Ins richtige Arbeitsverzeichnis wechseln (falls nötig)

Nur wenn ein **eindeutiges** Zielverzeichnis feststeht:

```bash
cd <zielverzeichnis> && pwd
```

Bei Monorepos zusätzlich das konkrete Unterprojekt-Verzeichnis wählen.

## Schritt 4: Git-Repository und Branch aktivieren (falls vorhanden)

Nur wenn es sich um ein Git-Projekt handelt:

```bash
git remote get-url origin 2>/dev/null || echo "(kein Remote)"
git branch --show-current
git status --short
```

- Stimmt der Branch mit dem Auftrag überein? Falls ein anderer Branch verlangt ist
  und das Arbeitsverzeichnis sauber ist: `git checkout <branch>` (nur auschecken,
  nichts committen).
- Ist der geforderte Branch nicht eindeutig, das Verzeichnis nicht sauber, oder
  passt das Remote nicht zum Ziel-Projekt → Schritt 6 (Stopp).
- Kein Git-Projekt? Das ist zulässig — überspringen und mit Schritt 5 fortfahren.

## Schritt 5: Voraussetzungen prüfen

Prüfe die für das Projekt nötigen Voraussetzungen. Was relevant ist, hängt vom
Projekt ab — typische Punkte:
- **Verzeichnis** vorhanden und beschreibbar,
- **Repository/Branch** wie erwartet (falls Git),
- **Konfiguration** vorhanden (z. B. `package.json`, `pyproject.toml`,
  `astro.config.*`, `.env.example`, `CLAUDE.md`),
- weitere **projektspezifische Anforderungen** aus `README.md`/`CLAUDE.md`.

Lies dazu bei Bedarf die erste Zeile von `README.md` bzw. den `name`-Eintrag der
Konfigurationsdatei und die ersten Zeilen von `CLAUDE.md`.

## Schritt 6: Entscheidung

**Nur wenn alles eindeutig und vollständig ist — Aktivierung erfolgreich:**

```
✅ Projektumgebung aktiviert
   Projekt:      <Name>
   Verzeichnis:  <pfad>
   Repository:   <remote oder "kein Git">
   Branch:       <branch oder "—">
   Voraussetzungen: erfüllt
→ Beginne jetzt mit dem Arbeitsauftrag.
```

**Ist die Umgebung nicht eindeutig oder unvollständig — SOFORT STOPPEN.**
Keine Änderungen, kein Commit, kein Push. Grund präzise melden:

```
⛔ Stopp — Projektumgebung nicht eindeutig/aktivierbar.

Erwartet:   <Ziel-Projekt/Branch laut Auftrag>
Gefunden:   <aktueller Stand / Problem>
Grund:      <z. B. kein passendes Verzeichnis / mehrere Treffer /
             falsches Remote / Branch nicht vorhanden / Arbeitsbaum nicht sauber>

Bitte Projekt, Verzeichnis oder Branch bestätigen, bevor ich weitermache.
```

Auf explizite Bestätigung des Nutzers warten. Erst danach fortfahren.

## Schritt 7: Auftrag ausführen

Erst **nach** erfolgreicher Aktivierung (grünes ✅ in Schritt 6) mit den
eigentlichen Schritten des Arbeitsauftrags beginnen.

## Hinweise

- Der Check soll schnell sein — wenige Shell-Befehle, keine Tiefenanalyse.
- Ohne Git genügt ein eindeutig dem Auftrag zuzuordnendes Verzeichnis als Umgebung.
- Im Zweifel gilt immer: **stoppen und fragen** statt im falschen Projekt arbeiten.
