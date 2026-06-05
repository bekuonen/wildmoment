#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

statusdatei_aktualisieren() {
    local depotwert="$1" positionen="$2" hugo_status="$3" git_status="$4"
    local warnung="${5:-}" fehler_text="${6:-}" naechste="$7"

    local datei="${BETRIEB_ROOT}/Status/Aktienbuchhaltung_Status.md"
    mkdir -p "$(dirname "${datei}")"

    cat > "${datei}" <<EOF
# Aktienbuchhaltung Status

**Letzter erfolgreicher Lauf:** $(ts_iso)

| Feld | Wert |
|------|------|
| Depotwert | ${depotwert} |
| Anzahl Positionen | ${positionen} |
| Hugo-Build Status | ${hugo_status} |
| Git-Synchronisation Status | ${git_status} |
| Nächste Ausführung | ${naechste} |
| Letzte Warnung | ${warnung:—} |
| Letzter Fehler | ${fehler_text:—} |
EOF
    log_info "Statusdatei aktualisiert: ${datei}"
    echo "${datei}"
}

tagesbericht_erstellen() {
    local typ="$1" schritte="$2" transaktionen="$3" depotwert="$4"
    local aenderungen="$5" hugo_ergebnis="$6" git_ergebnis="$7"
    local warnungen="${8:-}" fehler_text="${9:-}" zusammenfassung="${10:-}"

    local datei="${BETRIEB_ROOT}/Tagesberichte/$(ts)_Aktienbuchhaltung_${typ}.md"
    mkdir -p "$(dirname "${datei}")"

    cat > "${datei}" <<EOF
# Aktienbuchhaltung ${typ}

**Datum:** $(ts_iso)

## Ausgeführte Schritte

${schritte}

## Kennzahlen

| Feld | Wert |
|------|------|
| Verarbeitete Transaktionen | ${transaktionen} |
| Depotwert | ${depotwert} |
| Änderungen seit letztem Lauf | ${aenderungen} |

## Ergebnisse

| Prozess | Status |
|---------|--------|
| Hugo-Build | ${hugo_ergebnis} |
| Git | ${git_ergebnis} |

## Warnungen

${warnungen:-Keine}

## Fehler

${fehler_text:-Keine}

## Zusammenfassung

${zusammenfassung}
EOF
    log_info "Tagesbericht erstellt: ${datei}"
    echo "${datei}"
}

monatsreport_erstellen() {
    local datei="${BETRIEB_ROOT}/Monatsberichte/$(ts_ym)_Monatsreport_Depot.md"
    mkdir -p "$(dirname "${datei}")"

    if [[ -f "${datei}" ]]; then
        log_warn "Monatsreport existiert bereits — übersprungen: ${datei}"
        echo "${datei}"
        return 0
    fi

    cat > "${datei}" <<EOF
# Monatsreport Depot $(ts_ym)

**Erstellt:** $(ts_iso)

## Monatsperformance

<!-- TODO -->

## Jahresperformance

<!-- TODO -->

## Dividenden

<!-- TODO -->

## Käufe

<!-- TODO -->

## Verkäufe

<!-- TODO -->

## Asset Allocation

<!-- TODO -->

## Top Gewinner

<!-- TODO -->

## Top Verlierer

<!-- TODO -->

## Bemerkungen

EOF
    log_info "Monatsreport erstellt: ${datei}"
    echo "${datei}"
}
