#!/usr/bin/env bash
# Einmalige Einrichtung: Ablagestruktur in Obsidian-Vault anlegen
set -euo pipefail

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_DIR}/lib/common.sh"

log_info "Setup: Ablagestruktur wird angelegt in ${BETRIEB_ROOT}"

for verzeichnis in Backups Status Tagesberichte Monatsberichte Fehlerjournal; do
    mkdir -p "${BETRIEB_ROOT}/${verzeichnis}"
    log_info "  Erstellt: ${BETRIEB_ROOT}/${verzeichnis}"
done

# Fehlerjournal initialisieren (leerer Header, damit Einträge korrekt angehängt werden)
journal="${BETRIEB_ROOT}/Fehlerjournal/Fehlerjournal.md"
if [[ ! -f "${journal}" ]]; then
    printf '# Fehlerjournal\n\n' > "${journal}"
    log_info "Fehlerjournal initialisiert: ${journal}"
fi

log_info "Setup abgeschlossen."
