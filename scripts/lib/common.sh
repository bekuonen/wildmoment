#!/usr/bin/env bash
# Gemeinsame Funktionen: Konfiguration, Zeitstempel, Logging, Fehlerbehandlung
set -euo pipefail

_COMMON_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_CONFIG="${_COMMON_DIR}/../../config/aktienbuchhaltung.conf"

if [[ ! -f "${_CONFIG}" ]]; then
    echo "FEHLER: Konfigurationsdatei nicht gefunden: ${_CONFIG}" >&2
    exit 1
fi
# shellcheck source=../../config/aktienbuchhaltung.conf
source "${_CONFIG}"

# --- Zeitstempel ---
ts()     { TZ="${TIMEZONE}" date "+%Y-%m-%d_%H%M"; }
ts_iso() { TZ="${TIMEZONE}" date "+%Y-%m-%dT%H:%M:%S%z"; }
ts_dat() { TZ="${TIMEZONE}" date "+%Y-%m-%d"; }
ts_ym()  { TZ="${TIMEZONE}" date "+%Y-%m"; }

ist_monatsende() {
    local heute morgen
    heute=$(TZ="${TIMEZONE}" date "+%m")
    morgen=$(TZ="${TIMEZONE}" date -d "+1 day" "+%m" 2>/dev/null \
          || TZ="${TIMEZONE}" date -v+1d "+%m")
    [[ "${heute}" != "${morgen}" ]]
}

# --- Logging ---
log_info()  { echo "[$(ts_iso)] INFO  $*" >&2; }
log_warn()  { echo "[$(ts_iso)] WARN  $*" >&2; }
log_error() { echo "[$(ts_iso)] ERROR $*" >&2; }

# --- Fehlerjournal ---
_fehlerjournal_schreiben() {
    local prozess="$1" beschreibung="$2" ursache="$3" auswirkung="$4" massnahme="$5"
    local journal="${BETRIEB_ROOT}/Fehlerjournal/Fehlerjournal.md"
    mkdir -p "$(dirname "${journal}")"
    {
        printf '\n---\n\n'
        printf '**Datum:** %s\n' "$(ts_iso)"
        printf '**Prozess:** %s\n' "${prozess}"
        printf '**Fehlerbeschreibung:** %s\n' "${beschreibung}"
        printf '**Ursache:** %s\n' "${ursache}"
        printf '**Auswirkungen:** %s\n' "${auswirkung}"
        printf '**Empfohlene Massnahme:** %s\n' "${massnahme}"
    } >> "${journal}"
}

# Fehler: Journal aktualisieren und sofort stoppen
fehler() {
    local prozess="${1:-unbekannt}"
    local beschreibung="${2:-Unbekannter Fehler}"
    local ursache="${3:-Nicht ermittelt}"
    local auswirkung="${4:-Lauf abgebrochen}"
    local massnahme="${5:-Manuell prüfen}"
    log_error "${prozess}: ${beschreibung}"
    _fehlerjournal_schreiben "${prozess}" "${beschreibung}" "${ursache}" "${auswirkung}" "${massnahme}"
    exit 1
}
