#!/usr/bin/env bash
set -euo pipefail

_LIB="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_LIB}/common.sh"
source "${_LIB}/checksums.sh"
source "${_LIB}/hugo_build.sh"
source "${_LIB}/git_ops.sh"

# publish(): Hugo-Build (nur bei Änderungen) + Git Commit + Push
# Ausgabe: "<hugo_status>|<git_status>"
publish() {
    local commit_nachricht="${1:-Aktienbuchhaltung Update $(ts_iso)}"
    local hugo_status="übersprungen"
    local git_status="kein_commit"

    local pruef_dateien=("${DEPOT_QUELLDATEI}")

    # Schritte 1-2: Änderungserkennung
    if aenderungen_vorhanden "${pruef_dateien[@]}"; then

        # Schritt 3-5: Hugo-Build in Temp, validieren, public/ übernehmen
        local html_anzahl
        html_anzahl=$(hugo_bauen)
        hugo_status="erfolgreich (${html_anzahl} HTML-Dateien)"
        checksummen_aktualisieren "${pruef_dateien[@]}"

    fi

    # Schritte 6-9: Git (nur wenn Änderungen vorhanden)
    git_status=$(git_commit_und_push "${commit_nachricht}")

    log_info "publish() fertig: Hugo=${hugo_status}, Git=${git_status}"
    printf '%s|%s' "${hugo_status}" "${git_status}"
}
