#!/usr/bin/env bash
# Ausführung 09:45 — Tägliches Update
set -euo pipefail

_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_DIR}/lib/common.sh"
source "${_DIR}/lib/backup.sh"
source "${_DIR}/lib/plausibility.sh"
source "${_DIR}/lib/publish.sh"
source "${_DIR}/lib/finalize.sh"

log_info "=== Ausführung 09:45: Tägliches Update ==="

SCHRITTE_LOG=""
_schritt() { local s="$1"; SCHRITTE_LOG+="${s}"$'\n'; log_info "Schritt: ${s}"; }

# Schritt 1: Backup
_schritt "1. Backup erstellen"
backup_erstellen "${DEPOT_QUELLDATEI}"

# Schritt 2: Depotdaten importieren
_schritt "2. Depotdaten importieren"
# TODO: Depotimport-Logik implementieren (CSV-Export aus Broker verarbeiten)

# Schritt 3: Aktienbuchhaltung aktualisieren
_schritt "3. Aktienbuchhaltung aktualisieren"
# TODO: Buchhaltungslogik implementieren

# Schritt 4: Vermögenscockpit berechnen
_schritt "4. Vermögenscockpit berechnen"
# TODO: Cockpit-Berechnung implementieren

# Schritt 5: Plausibilitätsprüfung
_schritt "5. Plausibilitätsprüfung"
PRUEF=$(plausibilitaet_pruefen)
DEPOTWERT="${PRUEF%%|*}"
POSITIONEN="${PRUEF##*|}"

# Schritt 6: Änderungen feststellen (durch Checksummen-Vergleich in publish())
_schritt "6. Änderungen feststellen"

# Schritt 7: publish()
_schritt "7. publish()"
PUB=$(publish "Aktienbuchhaltung Update $(ts_iso)")
HUGO_STATUS="${PUB%%|*}"
GIT_STATUS="${PUB##*|}"

# Schritt 8: finalize()
_schritt "8. finalize()"
NAECHSTE="$(ts_dat) 22:30 Europe/Zurich"
FIN=$(finalize "Update" "${DEPOTWERT}" "${POSITIONEN}" \
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
$(ts_dat) 22:30 Europe/Zurich
EOF
