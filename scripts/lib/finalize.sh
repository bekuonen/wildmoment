#!/usr/bin/env bash
set -euo pipefail

_LIB="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_LIB}/common.sh"
source "${_LIB}/reports.sh"

# finalize(): Statusdatei und Tagesbericht schreiben, ggf. Monatsreport
# Ausgabe: "<bericht>|<statusdatei>"
finalize() {
    local typ="$1"           # Update | Tagesabschluss
    local depotwert="$2"
    local positionen="$3"
    local hugo_status="$4"
    local git_status="$5"
    local naechste="$6"
    local schritte="${7:---}"
    local transaktionen="${8:-0}"
    local aenderungen="${9:---}"
    local warnungen="${10:-}"

    local zusammenfassung="Lauf ${typ} abgeschlossen. Depot: ${depotwert}, Positionen: ${positionen}."

    local statusdatei
    statusdatei=$(statusdatei_aktualisieren \
        "${depotwert}" "${positionen}" "${hugo_status}" "${git_status}" \
        "${warnungen}" "" "${naechste}")

    local bericht
    bericht=$(tagesbericht_erstellen \
        "${typ}" "${schritte}" "${transaktionen}" "${depotwert}" \
        "${aenderungen}" "${hugo_status}" "${git_status}" \
        "${warnungen}" "" "${zusammenfassung}")

    if ist_monatsende; then
        monatsreport_erstellen
    fi

    printf '%s|%s' "${bericht}" "${statusdatei}"
}
