#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

CHECKSUMS_DATEI="${BETRIEB_ROOT}/Status/checksums.txt"

_sha256() {
    sha256sum "$1" 2>/dev/null | awk '{print $1}' \
    || shasum -a 256 "$1" | awk '{print $1}'
}

_checksum_lesen() {
    grep -F "  $1" "${CHECKSUMS_DATEI}" 2>/dev/null | awk '{print $1}' || echo ""
}

hat_geaendert() {
    local datei="$1"
    [[ ! -f "${datei}" ]] && return 0
    local aktuell gespeichert
    aktuell=$(_sha256 "${datei}")
    gespeichert=$(_checksum_lesen "${datei}")
    [[ "${aktuell}" != "${gespeichert}" ]]
}

aenderungen_vorhanden() {
    local dateien=("$@")
    for datei in "${dateien[@]}"; do
        if [[ -f "${datei}" ]] && hat_geaendert "${datei}"; then
            log_info "Änderung erkannt: ${datei}"
            return 0
        fi
    done
    log_info "Keine Änderungen erkannt — Hugo-Build wird übersprungen"
    return 1
}

checksummen_aktualisieren() {
    local dateien=("$@")
    mkdir -p "$(dirname "${CHECKSUMS_DATEI}")"
    for datei in "${dateien[@]}"; do
        [[ ! -f "${datei}" ]] && continue
        local hash
        hash=$(_sha256 "${datei}")
        # Bestehenden Eintrag ersetzen
        if [[ -f "${CHECKSUMS_DATEI}" ]]; then
            grep -vF "  ${datei}" "${CHECKSUMS_DATEI}" > "${CHECKSUMS_DATEI}.tmp" || true
            mv "${CHECKSUMS_DATEI}.tmp" "${CHECKSUMS_DATEI}"
        fi
        echo "${hash}  ${datei}" >> "${CHECKSUMS_DATEI}"
    done
    log_info "Checksummen aktualisiert: ${CHECKSUMS_DATEI}"
}
