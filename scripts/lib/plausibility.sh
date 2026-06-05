#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

plausibilitaet_pruefen() {
    local depot="${DEPOT_QUELLDATEI}"
    log_info "Plausibilitätsprüfung: ${depot}"

    if [[ ! -f "${depot}" ]]; then
        fehler "plausibilitaet" "Depotdatei nicht gefunden: ${depot}" \
               "Datei fehlt" "Prüfung nicht möglich" \
               "DEPOT_QUELLDATEI in Config anpassen"
    fi

    local sep="${CSV_TRENNZEICHEN}"
    local col_isin=$(( CSV_SPALTE_ISIN + 1 ))
    local col_datum=$(( CSV_SPALTE_DATUM + 1 ))
    local col_wert=$(( CSV_SPALTE_WERT + 1 ))

    # Regel 1: Depotwert > 0
    # TODO: Spalte col_wert enthält Einzelwerte — Gesamtsumme berechnen
    local depotwert
    depotwert=$(awk -F"${sep}" -v col="${col_wert}" \
        'NR>1 && $col+0==$col {sum+=$col} END {printf "%.2f", sum+0}' "${depot}")
    if awk "BEGIN {exit !(${depotwert} <= 0)}"; then
        fehler "plausibilitaet" "Depotwert <= 0: ${depotwert}" \
               "Berechnung ergab nicht-positiven Wert" "Lauf gestoppt" \
               "Depotdatei und Spaltenkonfiguration prüfen"
    fi
    log_info "Regel 1 OK: Depotwert = ${depotwert}"

    # Regel 2: Anzahl Positionen >= MIN_POSITIONEN
    local positionen
    positionen=$(awk -F"${sep}" -v col="${col_isin}" \
        'NR>1 && $col!="" {count++} END {print count+0}' "${depot}")
    if (( positionen < MIN_POSITIONEN )); then
        fehler "plausibilitaet" "Zu wenige Positionen: ${positionen} < ${MIN_POSITIONEN}" \
               "Depotdatei unvollständig oder leer" "Lauf gestoppt" \
               "Depotdaten importieren"
    fi
    log_info "Regel 2 OK: Positionen = ${positionen}"

    # Regel 3: Keine doppelten ISIN-Einträge
    local duplikate
    duplikate=$(awk -F"${sep}" -v col="${col_isin}" \
        'NR>1 && $col!="" {print $col}' "${depot}" \
        | sort | uniq -d | wc -l | tr -d ' ')
    if (( duplikate > 0 )); then
        fehler "plausibilitaet" "Doppelte ISIN-Einträge: ${duplikate}" \
               "Duplikate in Depotdatei" "Lauf gestoppt" \
               "Doppelte Einträge aus Depotdatei entfernen"
    fi
    log_info "Regel 3 OK: Keine ISIN-Duplikate"

    # Regel 4: Transaktionsdaten nicht älter als MAX_ALTER_TAGE
    local aeltestes_datum grenze
    aeltestes_datum=$(awk -F"${sep}" -v col="${col_datum}" \
        'NR>1 && $col!="" {print $col}' "${depot}" | sort | head -1)
    if [[ -n "${aeltestes_datum}" ]]; then
        grenze=$(TZ="${TIMEZONE}" date -d "-${MAX_ALTER_TAGE} days" "+%Y-%m-%d" 2>/dev/null \
              || TZ="${TIMEZONE}" date -v-"${MAX_ALTER_TAGE}"d "+%Y-%m-%d")
        if [[ "${aeltestes_datum}" < "${grenze}" ]]; then
            log_warn "Transaktionsdaten älter als ${MAX_ALTER_TAGE} Tage: ${aeltestes_datum}"
        else
            log_info "Regel 4 OK: Aktualität = ${aeltestes_datum}"
        fi
    fi

    # Regel 5: Summenabgleich mit Kontobewegungen
    # TODO: Implementieren sobald Kontobewegungsdatei verfügbar
    log_info "Regel 5: Summenabgleich (ausstehend — Kontobewegungsdatei konfigurieren)"

    log_info "Plausibilitätsprüfung abgeschlossen: ${positionen} Positionen, Wert ${depotwert}"
    printf '%s|%s' "${depotwert}" "${positionen}"
}
