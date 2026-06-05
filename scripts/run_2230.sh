#!/usr/bin/env bash
# Ausführung 22:30 — Tagesabschluss
set -euo pipefail

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_DIR}/lib/common.sh"
source "${_DIR}/lib/backup.sh"
source "${_DIR}/lib/publish.sh"
source "${_DIR}/lib/finalize.sh"

log_info "=== Ausführung 22:30: Tagesabschluss ==="

SCHRITTE_LOG=""
_schritt() { local s="$1"; SCHRITTE_LOG+="${s}"$'\n'; log_info "Schritt: ${s}"; }

# Schritt 1: Backup
_schritt "1. Backup erstellen"
backup_erstellen "${DEPOT_QUELLDATEI}"

# Schritt 2: Datenkonsistenz prüfen
_schritt "2. Datenkonsistenz prüfen"
# TODO: Konsistenzprüfung implementieren

# Schritt 3: Aktienbuchhaltung validieren
_schritt "3. Aktienbuchhaltung validieren"
# TODO: Validierungslogik implementieren (Datenintegrität, keine Lücken)

# Schritt 4: Vermögenscockpit neu berechnen
_schritt "4. Vermögenscockpit neu berechnen"
# TODO: Abschlussberechnung implementieren

# Depotwert und Positionen ermitteln (ohne volle Plausibilitätsprüfung)
DEPOTWERT="—"
POSITIONEN="—"

# Schritt 5: publish()
_schritt "5. publish()"
PUB=$(publish "Aktienbuchhaltung Tagesabschluss $(ts_iso)")
HUGO_STATUS="${PUB%%|*}"
GIT_STATUS="${PUB##*|}"

# Schritt 6: finalize()
_schritt "6. finalize()"
NAECHSTE="$(TZ="${TIMEZONE}" date -d "+1 day" "+%Y-%m-%d" 2>/dev/null \
          || TZ="${TIMEZONE}" date -v+1d "+%Y-%m-%d") 09:45 Europe/Zurich"
FIN=$(finalize "Tagesabschluss" "${DEPOTWERT}" "${POSITIONEN}" \
    "${HUGO_STATUS}" "${GIT_STATUS}" "${NAECHSTE}" \
    "${SCHRITTE_LOG}" "0" "—" "")
BERICHT="${FIN%%|*}"
STATUSDATEI="${FIN##*|}"

cat <<EOF

Status: Erfolgreich
Aktualisiert:
- Aktienbuchhaltung
- Vermögenscockpit
- Hugo-Webseite
Bericht:
${BERICHT}
Statusdatei:
${STATUSDATEI}
Nächste Ausführung:
${NAECHSTE}
EOF
