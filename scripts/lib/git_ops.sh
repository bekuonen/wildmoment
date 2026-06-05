#!/usr/bin/env bash
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

git_commit_und_push() {
    local nachricht="$1"
    local arbeitsverzeichnis="${HUGO_PROJECT}"

    if [[ ! -d "${arbeitsverzeichnis}/.git" ]]; then
        fehler "git_ops" "Kein Git-Repository: ${arbeitsverzeichnis}" \
               "Verzeichnis ist kein Git-Repo" "Git-Schritte übersprungen" \
               "Git-Repository initialisieren oder HUGO_PROJECT korrigieren"
    fi

    cd "${arbeitsverzeichnis}"

    local aenderungen
    aenderungen=$(git status --porcelain)

    if [[ -z "${aenderungen}" ]]; then
        log_info "Git: Keine Änderungen — kein Commit"
        echo "kein_commit"
        return 0
    fi

    log_info "Git: $(echo "${aenderungen}" | wc -l | tr -d ' ') geänderte Datei(en)"
    git add -A

    if ! git commit -m "${nachricht}"; then
        fehler "git_commit" "Git Commit fehlgeschlagen" \
               "Siehe Git-Fehlerausgabe" \
               "Änderungen nicht committed" \
               "git status und git log manuell prüfen"
    fi

    if ! git push; then
        fehler "git_push" "Git Push fehlgeschlagen" \
               "Netzwerk- oder Berechtigungsfehler" \
               "Commit lokal vorhanden, Remote nicht aktualisiert" \
               "git push manuell wiederholen"
    fi

    log_info "Git: Commit und Push erfolgreich"
    echo "gepusht"
}
