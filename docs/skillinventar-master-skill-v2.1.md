# Master-Skill «Skillinventar» — Version 2.1

> Konsolidierte, verbindliche Auftragsfassung. Grundlage für die spätere Umsetzung.
> **Status:** Spezifikation (keine Implementierung). **Vorgänger:** V2.0.

Dieses Dokument enthält drei Teile:

1. **Master-Skill V2.1** — die bereinigte Auftragsfassung
2. **Änderungsprotokoll** gegenüber V2.0
3. **Begründung** jeder wesentlichen Änderung

---

# Teil 1 — Master-Skill V2.1

## 1. Zweck und Geltung

Der Master-Skill verwaltet **alle lokalen Claude-Skills** über eine einzige, führende
Skillinventur. Ziel ist ein **dauerhaft konsistentes, nachvollziehbares und wartbares**
Inventar mit einer automatisch generierten Übersicht als Arbeitsoberfläche.

Am Ende existieren:

- eine vollständige, klassifizierte Skillinventur,
- ein maschinell geführtes Register als einzige fachliche Wahrheit,
- eine daraus generierte HTML-Übersicht,
- ein definierter, wiederholbarer Pflegeprozess,
- keine unbekannten, vergessenen oder undokumentierten Skills.

## 2. Architektur-Grundsätze

| # | Grundsatz | Bedeutung |
|---|-----------|-----------|
| G1 | **Single Source of Truth** | Das Register ist die **einzige** fachliche Wahrheit. Alle Darstellungen (HTML, Listen, Auswertungen) werden ausschliesslich daraus generiert. Es gibt **keine** zweite, manuell gepflegte Übersicht. |
| G2 | **Repository-Unabhängigkeit** | Die Identität eines Skills basiert auf `Repository + relativem Pfad + Skill-ID`. Web-Links (GitHub o. ä.) dienen **nur der Navigation** und sind niemals Primärschlüssel oder Referenz. |
| G3 | **Vollständigkeit** | Alle definierten Ablagen (§3) werden vollständig durchsucht. Kein Skill bleibt unberücksichtigt. |
| G4 | **Keine automatische Löschung** | Der Status «Löschen» bedeutet ausschliesslich *Löschkandidat*. Physische Löschung nur nach ausdrücklicher Freigabe (§12). |
| G5 | **Nachvollziehbarkeit** | Jede Klassifizierung trägt eine Begründung (`status_begruendung`, Pflichtfeld). Keine Entscheidung ohne Begründung. |
| G6 | **Einfachheit** | Keine Doppelpflege, keine unnötige Komplexität. Ein Datenschema, ein Register, ein Generierungsschritt. |

## 3. Ablagen-Scope

Jeder gefundene Skill wird **genau einer** Ablage-Klasse zugeordnet und entsprechend
gekennzeichnet (`scope`):

| Scope | Klasse | Versioniert | Beispiel-Pfad |
|-------|--------|-------------|----------------|
| `project` | **Projekt-Skills (führend)** | ja | `./.claude/skills/` |
| `user` | Globale User-Skills | nein (flüchtig) | `~/.claude/skills/` |
| `system` | System-Skills (read-only) | nein | `/mnt/skills/` |
| `external` | Externe / flüchtige Ablagen | nein | sonstige Fundorte |

`project`-Skills sind **führend und dauerhaft**. Nicht versionierte Scopes werden im
Register und in der HTML sichtbar als **«nicht versioniert / flüchtig»** markiert, weil
ihre Vollständigkeit über Container-Neustarts hinweg nicht garantiert werden kann.

## 4. Kanonisches Datenschema

Alle Felder werden **genau einmal** hier definiert. Register und HTML verwenden dieses
Schema unverändert; es gibt keine zweite Feldliste.

| Feld | Pflicht | Quelle | Beschreibung |
|------|:------:|--------|--------------|
| `id` | ✔ | berechnet | Eindeutige Skill-ID (§5). Primärschlüssel. |
| `name` | ✔ | Scan (SKILL.md / Verzeichnis) | Skillname. |
| `scope` | ✔ | Scan | Ablage-Klasse (§3). |
| `repository` | ✔ | git-remote bzw. `—` | Repository der Ablage. |
| `pfad_relativ` | ✔ | Scan | Pfad ab Skills-Wurzel des Scopes. |
| `hauptdatei` | ✔ | Scan | i. d. R. `SKILL.md`. |
| `beschreibung` | ✔ | SKILL.md | Kurzbeschreibung. |
| `projekt` | – | Zuordnung | Zugeordnetes Projekt. |
| `status` | ✔ | manuell | Statuswert (§6), Default `Prüfen`. |
| `status_begruendung` | ✔ | manuell | Begründung der Klassifizierung. |
| `versioniert` | ✔ | Scan | `true`/`false`. |
| `erstellt` | ✔ | git bzw. `n/a` | Erster Commit: `git log --diff-filter=A --follow`. |
| `geaendert` | ✔ | git bzw. `n/a` | Letzter Commit der Hauptdatei. |
| `dubletten` | – | berechnet | IDs gleichnamiger Skills (§7). |
| `auffaelligkeiten` | – | Prüfung | Befunde der Qualitätsprüfung (§10). |
| `empfehlung` | – | manuell | Handlungsempfehlung. |

**Datumsregel:** `erstellt`/`geaendert` stammen **ausschliesslich aus git**
(Dateisystem-Zeitstempel sind in der Zielumgebung unbrauchbar). Nicht versionierte
Skills erhalten den Wert **`n/a (nicht versioniert)`**.

## 5. Skill-ID

Die ID ist stabil, menschenlesbar und ablageübergreifend eindeutig:

```
id = "<scope>/<pfad_relativ>"
```

Beispiele: `project/aktienbuchhaltung-betrieb`, `user/session-start-hook`.

Die ID ist **Primärschlüssel** (G2). Web-Links werden nie als Identität verwendet.

## 6. Statusmodell

Genau **ein** geschlossenes Statusmodell. Default für jeden neu erkannten Skill: `Prüfen`.

| Status | Bedeutung |
|--------|-----------|
| `Prüfen` | Neu erkannt, noch nicht klassifiziert (Default). |
| `Aktiv` | Wird verwendet und gepflegt. |
| `Inaktiv` | Zurzeit nicht verwendet, reaktivierbar. |
| `Alt` | Historisch, durch neueren Skill ersetzt, nur Referenz. |
| `Löschen` | Löschkandidat — **keine** automatische Löschung (G4). |

**Erlaubte Übergänge:**

```
Prüfen   → Aktiv | Inaktiv | Alt | Löschen
Aktiv    ↔ Inaktiv
Aktiv    → Alt | Löschen
Inaktiv  → Alt | Löschen
Alt      → Löschen | Prüfen (bei Re-Bewertung)
Löschen  → Prüfen (Rücknahme)  |  [physische Löschung nur nach Freigabe, §12]
```

Jeder Übergang setzt eine aktualisierte `status_begruendung` voraus (G5).

## 7. Dublettenerkennung

Eine **Dublette** liegt vor, wenn **derselbe `name`** unter **verschiedenen `id`**
existiert (z. B. gleicher Skill in `user` und `system`). Betroffene Einträge führen die
IDs der jeweils anderen Vorkommen im Feld `dubletten` und werden in der HTML markiert.
Dubletten werden **nicht** automatisch aufgelöst; sie erzeugen eine Empfehlung.

## 8. Drift- / Reconcile-Prüfung

Bei jedem Scan wird das Register gegen das Dateisystem abgeglichen:

- **Neu:** Skill auf Platte, nicht im Register → Eintrag mit Status `Prüfen` anlegen.
- **Verwaist:** Eintrag im Register, keine Datei → als `verwaist` markieren (nicht löschen).
- **Verschoben:** gleiche Hauptdatei, geänderter Pfad → ID-Wechsel melden, alten Eintrag markieren.

Drift wird im Prüfbericht (§10) ausgewiesen. Ziel im Normalbetrieb: **Drift = 0**.

## 9. Register und HTML-Generierung

**Register (Single Source of Truth):** `skills-register.json`.
Begründung der Wahl: maschinell erzeugbar, diff-freundlich, direkt in die HTML
einbettbar, resistent gegen versehentliche Handpflege. Markdown würde zu manueller
Pflege verleiten und widerspräche G1/G6.

**HTML-Konzept:**

- **Single-File-HTML** mit **eingebettetem JSON** (Kopie des Registers) und clientseitigem
  Rendering. Kein Build-Schritt, offline lauffähig, ein einziges File.
- HTML ist **generiert und versioniert** (liegt im Repo, überlebt Container-Recycling).
- **Keine Abhängigkeit von `file://`-Links.** Standardanzeige je Skill: `repository`,
  `pfad_relativ` (als kopierbarer Text) sowie ein **Git-/Web-Link** rein zur Navigation.
- Darstellung: **je Skill eine Karte** mit allen Pflichtfeldern des Schemas (§4) plus
  `auffaelligkeiten`.
- **Filter/Ansichten:** Status (`Prüfen`/`Aktiv`/`Inaktiv`/`Alt`/`Löschen`), Scope, Projekt,
  Volltextsuche, Sortierung alphabetisch und nach `geaendert`.

Die HTML wird **niemals** manuell bearbeitet, sondern ausschliesslich aus dem Register
erzeugt (G1).

## 10. Qualitätsprüfung und Prüfbericht

Regelmässig geprüft und im **Prüfbericht** ausgewiesen:

- Drift (neu / verwaist / verschoben, §8),
- Dubletten (§7),
- falsche Ablageorte,
- fehlende Beschreibungen oder Pflichtfelder,
- defekte oder veraltete Skills,
- Einträge im Status ohne Begründung.

## 11. Pflegeprozess

- **Kein dauerhafter Daemon.** Aktualisierung erfolgt über ein **Scan-Skript**.
- **Auslösung:** Session-Start-Hook **oder** manueller Aufruf. CI ist optional.
- Ablauf je Lauf: erkennen → registrieren → Reconcile (§8) → Dubletten prüfen (§7) →
  HTML generieren → Prüfbericht.
- **Neue Skills werden nie automatisch `Aktiv`.** Standardstatus `Prüfen`; endgültige
  Klassifizierung erst nach Freigabe.

## 12. Arbeitsweise und Freigabe

Vor jeder verändernden Umsetzung gilt **einmalig und abschliessend**:
**Analyse → Empfehlung → Diskussion → Freigabe → Umsetzung.**

Ohne ausdrückliche Freigabe erfolgt **keine** Löschung, Verschiebung, Überschreibung
oder Ersetzung. Diese Regel gilt für den gesamten Master-Skill und wird nicht wiederholt.

## 13. Definition of Done (messbar)

Der Zustand gilt als erreicht, wenn **alle** Kriterien erfüllt sind:

1. **Drift = 0** — Anzahl Register-Einträge = Anzahl gefundener Hauptdateien in den
   definierten Scopes (§3).
2. Jeder Eintrag besitzt alle Pflichtfelder (§4).
3. Kein Skill trägt einen Status ohne `status_begruendung`.
4. Alle Dubletten sind markiert (§7).
5. Die HTML ist aus dem **aktuellen** Register generiert; keine manuelle Divergenz.
6. Ein aktueller Prüfbericht (§10) liegt vor.

## 14. Abschlussbericht

Nach Abschluss zu liefern: (1) Anzahl gefundener Skills, (2) Anzahl je Status,
(3) Dubletten, (4) Inkonsistenzen/Drift, (5) Risiken, (6) Verbesserungsvorschläge,
(7) Empfehlungen, (8) offene Entscheidungen.

---

# Teil 2 — Änderungsprotokoll (V2.0 → V2.1)

| ID | Art | Änderung |
|----|-----|----------|
| O1 | Korrektur | Statusmodell auf **ein** geschlossenes Enum vereinheitlicht; `Prüfen` als Default in das Modell integriert; **erlaubte Übergänge** dokumentiert (§6). |
| O2 | Korrektur | Datumsquellen fixiert: `erstellt`/`geaendert` **aus git**; nicht versioniert → `n/a` (§4). Dateisystem-Zeitstempel verworfen. |
| O3 | Korrektur | HTML-Konzept: **generiert + versioniert**, keine `file://`-Abhängigkeit, Standard = Repo-Pfad + Git-Link; Web-Link nur Navigation (§9, G2). |
| O4 | Korrektur | Ablagen-Scope in 4 gekennzeichnete Klassen (`project/user/system/external`) mit Versionierungs-/Flüchtigkeitsmarkierung (§3). |
| O5 | Korrektur | Automatisierung ehrlich: kein Daemon, Scan-Skript via Session-Start-Hook/manuell, CI optional (§11). |
| A1 | Ergänzung | **Kanonisches Datenschema** als einzige Feldliste inkl. Quelle je Feld (§4). |
| A2 | Ergänzung | **Skill-ID** `<scope>/<pfad_relativ>` als Primärschlüssel (§5). |
| A3 | Ergänzung | **Dublettenerkennung** über gleichen `name` bei verschiedenen `id` (§7). |
| A4 | Ergänzung | **Drift-/Reconcile-Prüfung** (neu/verwaist/verschoben) (§8). |
| A5 | Ergänzung | **Messbare Definition of Done** inkl. Drift-0-Kriterium (§13). |
| A5b | Ergänzung | **Single-File-HTML mit eingebettetem JSON** als konkretes Generierungskonzept (§9). |
| K1 | Straffung | «Ziele» und «Grundsätze» zu Zweck (§1) + Architektur-Grundsätzen (§2) zusammengeführt. |
| K2 | Straffung | Freigabe-/Keine-Löschung-Regel **einmal** zentral (§12, G4) statt mehrfach. |
| K3 | Straffung | Felddefinitionen **einmal** im Datenschema (§4); doppelte Inventur-/HTML-Liste entfernt. |
| K4 | Straffung | Begründungspflicht **einmal** als G5 zusammengefasst. |
| K5 | Straffung | Wiederholte Ein-Satz-Absätze und Trennlinien in kompakte Listen/Tabellen überführt. |
| Arch1 | Vorgabe | **Single Source of Truth** verbindlich als G1. |
| Arch2 | Vorgabe | **Repository-Unabhängigkeit** verbindlich als G2 (Identität ≠ Web-Link). |

**Umfang:** Durch K1–K5 (Konsolidierung von Prosa, Tabellisierung, Entfernen der doppelten
Feldliste) liegt der Text trotz der Ergänzungen A1–A5 spürbar dichter und ist gegenüber V2.0
um schätzungsweise **25–30 % kürzer** bei höherem Informationsgehalt.

---

# Teil 3 — Begründung wesentlicher Änderungen

- **O1 — Statusmodell:** V2.0 nannte 4 Status in der Klassifizierung, führte «Prüfen» aber
  erst im Pflegeprozess ein und sprach an anderer Stelle von «Kategorien». Ein geschlossenes
  Enum mit dokumentierten Übergängen beseitigt Mehrdeutigkeit und macht Klassifizierung
  eindeutig.
- **O2 — Datumsquellen:** In der Zielumgebung sind alle Dateisystem-Zeitstempel identisch
  (Clone-Zeitpunkt) und damit wertlos. git ist die einzige belastbare Quelle; nicht
  versionierte Skills können kein echtes Datum tragen → expliziter `n/a`-Wert statt
  Scheingenauigkeit.
- **O3 — HTML/Links:** Ephemere Remote-Container und Zugriff über Web/Mobile machen
  `file://`-Links praktisch unbrauchbar und lokale HTML flüchtig. Versionierte HTML im Repo
  plus Repo-Pfad und Navigations-Link sind portabel und überlebensfähig.
- **O4 — Ablagen-Scope:** «Alle bekannten Ablagen» umfasst versionierte und flüchtige,
  teils ausserhalb des Repos. Ohne klare Kennzeichnung lässt sich Vollständigkeit nicht
  ehrlich zusichern. Die 4 Klassen trennen Führendes von Flüchtigem.
- **O5 — Automatisierung:** «Automatisch» war nicht einlösbar (kein Daemon). Ein Scan-Skript
  mit definiertem Trigger beschreibt die Realität und bleibt wartbar.
- **A1/A2 — Schema & ID:** Ohne kanonisches Schema entstünde Doppelpflege (Widerspruch zu
  G1/G6); ohne stabile ID liesse sich weder Dublette noch Drift sauber definieren.
- **A3/A4 — Dubletten & Drift:** V2.0 deckte nur *neue* Skills ab. Verwaiste/verschobene
  Einträge und Namensdubletten (real vorhanden) brauchen definierte Regeln, sonst driftet
  das Register unbemerkt.
- **A5 — Definition of Done:** «Vollständig» war eine Behauptung. Das Drift-0-Kriterium macht
  Vollständigkeit prüfbar.
- **K1–K5 — Straffung:** Entfernt Redundanz (mehrfache Freigabe-Klauseln, doppelte
  Feldlisten, überlappende Ziele/Grundsätze) und erfüllt so G6 sowie das 25–30 %-Ziel.
- **Arch1/Arch2 — SSOT & Repo-Unabhängigkeit:** Sichern die tragende Architektur ab: eine
  Wahrheit (Register), Identität aus Repo+Pfad+ID statt aus fragilen Web-Links.
