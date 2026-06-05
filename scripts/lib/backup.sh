#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

backup_erstellen() {
    local quelldatei="$1"
    if [[ ! -f "${quelldatei}" ]]; then
        fehler "backup" "Quelldatei nicht gefunden: ${quelldatei}" \
               "Datei existiert nicht" "Kein Backup möglich" \
               "DEPOT_QUELLDATEI in config/aktienbuchhaltung.conf prüfen"
    fi
    local ext="${quelldatei##*.}"
    local ziel="${BETRIEB_ROOT}/Backups/$(ts)_depot_backup.${ext}"
    mkdir -p "${BETRIEB_ROOT}/Backups"
    cp "${quelldatei}" "${ziel}"
    log_info "Backup erstellt: ${ziel}"
    echo "${ziel}"
}
