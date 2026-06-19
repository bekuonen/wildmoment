# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Bash automation suite for periodic stock portfolio accounting (Aktienbuchhaltung). It imports depot data, runs plausibility checks, builds a Hugo static site, commits/pushes via git, and writes structured reports into an Obsidian vault. Two scheduled runs per day: 09:45 (update) and 22:30 (Tagesabschluss).

All times and filenames use **Europe/Zurich (CET/CEST)**.

## Running Scripts

```bash
# One-time setup — creates Obsidian vault directory structure
bash scripts/setup.sh

# Daily update (09:45)
bash scripts/run_0945.sh

# Daily close (22:30)
bash scripts/run_2230.sh
```

There is no build system, test runner, or linter. All scripts use `set -euo pipefail` and fail immediately on any error.

## Configuration

`config/aktienbuchhaltung.conf` is the single source of truth for all paths, timezone, and CSV parsing:

```bash
OBSIDIAN_VAULT="${HOME}/Documents/Obsidian"
BETRIEB_ROOT="${OBSIDIAN_VAULT}/90_Betrieb/Aktienbuchhaltung"
HUGO_PROJECT="${HOME}/sites/depot"
DEPOT_QUELLDATEI="${OBSIDIAN_VAULT}/Depot/depot.csv"
TIMEZONE="Europe/Zurich"
CSV_SPALTE_ISIN=0        # 0-based column indices
CSV_SPALTE_DATUM=1
CSV_SPALTE_WERT=2
CSV_TRENNZEICHEN=","
MAX_ALTER_TAGE=7
TOLERANZ_BETRAG="0.01"
```

Never hard-code paths in library files — always derive from config variables.

## Architecture

### Library pattern

`scripts/lib/` contains single-responsibility modules sourced by the run scripts:

| Library | Responsibility |
|---|---|
| `common.sh` | Timestamps, logging (`info`, `warn`, `fehler`), config loading |
| `backup.sh` | Timestamped backup before any data change |
| `checksums.sh` | SHA-256 change detection, stored in `Status/checksums.txt` |
| `plausibility.sh` | 5 validation rules (09:45 only) |
| `hugo_build.sh` | Build to temp dir, validate HTML output, atomic swap to `public/` |
| `git_ops.sh` | `git status` → conditional commit → push |
| `reports.sh` | Status file, Tagesberichte, Monatsberichte |
| `publish.sh` | Orchestrates checksums → hugo_build → git_ops |
| `finalize.sh` | Orchestrates reports after publish |

### Shared procedures

Both run scripts call these in sequence after their own steps:

**`publish()`** — checksum diff → (skip if unchanged) → Hugo build to tempdir → validate → atomic `public/` swap → git commit + push

**`finalize()`** — overwrite `Status/Aktienbuchhaltung_Status.md` → append new daily report → create monthly report if last calendar day of month

### Incomplete sections (TODO)

`run_0945.sh` has placeholder stubs for: depot data import, Aktienbuchhaltung update, Vermögenscockpit calculation. `run_2230.sh` stubs: data consistency check, accounting validation, Vermögenscockpit recalculation. Plausibility rule 5 (account movement reconciliation) is also not yet implemented.

## File Naming and Storage Conventions

All output goes under `${BETRIEB_ROOT}` (`90_Betrieb/Aktienbuchhaltung/`):

```
Status/Aktienbuchhaltung_Status.md          ← overwritten each run
Status/checksums.txt                         ← updated after each Hugo build
Tagesberichte/yyyy-mm-dd_hhmm_Aktienbuchhaltung_Update.md
Tagesberichte/yyyy-mm-dd_hhmm_Aktienbuchhaltung_Tagesabschluss.md
Monatsberichte/yyyy-mm_Monatsreport_Depot.md
Backups/yyyy-mm-dd_hhmm_depot_backup.<ext>
Fehlerjournal/Fehlerjournal.md
```

Time component in filenames: `0945` or `2230` — always four digits, no separator.

## Immutability Rules

These are hard constraints, not preferences:

- **Tagesberichte** and **Backups** are append/create-only — never modify after creation
- **Fehlerjournal** is append-only
- Historical transactions must never be deleted or silently corrected
- The Status file is the only file that gets overwritten on each run

## Error Handling

The `fehler()` function in `common.sh` logs the error, appends to `Fehlerjournal.md`, and calls `exit 1`. Any error stops the entire process — no partial runs, no error recovery loops. On Hugo build failure, the temp dir is discarded and `public/` remains unchanged (rollback).

When adding new steps to a run script, always use `fehler "message"` instead of `echo` + `exit` to ensure the journal is updated.

## Skill Integration

The `.claude/skills/aktienbuchhaltung-betrieb/SKILL.md` defines this workflow as a user-invocable Claude Code skill (`/aktienbuchhaltung-betrieb`). When the skill is invoked, it loads config and calls the appropriate run script based on current time. The SKILL.md is the authoritative specification for expected outputs, report formats, and plausibility rules — consult it when implementing missing business logic.
