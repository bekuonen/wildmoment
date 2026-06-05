#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

hugo_bauen() {
    if [[ ! -d "${HUGO_PROJECT}" ]]; then
        fehler "hugo_build" "Hugo-Projektverzeichnis nicht gefunden: ${HUGO_PROJECT}" \
               "Verzeichnis existiert nicht" "Build nicht möglich" \
               "HUGO_PROJECT in Config anpassen"
    fi

    local temp_dir
    temp_dir=$(mktemp -d)
    log_info "Hugo-Build startet → Temp: ${temp_dir}"

    if ! hugo --source "${HUGO_PROJECT}" --destination "${temp_dir}" 2>&1; then
        rm -rf "${temp_dir}"
        fehler "hugo_build" "Hugo-Build fehlgeschlagen" \
               "Hugo-Fehler (siehe Log)" \
               "public/ bleibt unverändert, kein Git-Commit" \
               "Hugo-Konfiguration und Content prüfen"
    fi

    local html_anzahl
    html_anzahl=$(find "${temp_dir}" -name "*.html" | wc -l | tr -d ' ')
    if (( html_anzahl == 0 )); then
        rm -rf "${temp_dir}"
        fehler "hugo_build" "Build erzeugte keine HTML-Dateien" \
               "Hugo-Output ist leer" \
               "public/ bleibt unverändert" \
               "Hugo-Templates und Content-Verzeichnis prüfen"
    fi

    mkdir -p "${HUGO_PUBLIC}"
    rm -rf "${HUGO_PUBLIC:?}"/*
    cp -r "${temp_dir}/." "${HUGO_PUBLIC}/"
    rm -rf "${temp_dir}"

    log_info "Hugo-Build erfolgreich: ${html_anzahl} HTML-Dateien → ${HUGO_PUBLIC}"
    echo "${html_anzahl}"
}
