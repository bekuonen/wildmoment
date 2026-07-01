# Änderungsbericht — Skill Korrespondenz (Version 1.0)

Stand: 2026-07-01

## 1. Vorgenommene Erweiterungen

Ausgehend von der ersten Skill-Fassung (Analyse, Klassifikation,
Handlungsbedarf, Priorität, Frist, optionaler Antwortentwurf) wurden ergänzt:

- **Konfidenzbewertung (0–100 %)** mit kurzer Begründung und drei Stufen
  (80–100 / 50–79 / 0–49 %).
- **Strukturierte Extraktion** von Personen, Organisationen, Terminen, Fristen,
  Aufgaben, Anhängen und Links. Leere Felder werden mit „keine" gekennzeichnet.
- **Abschnitt „Empfohlene Aktionen"** als Checkliste möglicher Folgeprozesse
  (nur zur Freigabe, nichts wird selbst ausgeführt).

Diese drei Felder wurden zusätzlich in das feste Ausgabeformat aufgenommen.

## 2. Konsistenzprüfung

Der Skill wurde auf Konsistenz, Redundanzen und Widersprüche geprüft. Zwei
kleinere Punkte wurden bereinigt:

- **Reihenfolge angeglichen:** Der Definitionsabschnitt „Extraktion" stand
  hinter „Frist", im Ausgabeformat erscheint Extraktion aber vor
  „Handlungsbedarf". Die Definitionsabschnitte folgen jetzt der Reihenfolge des
  Ausgabeformats.
- **Erweiterbarkeit aktualisiert:** Die Aufzählung der strukturierten
  Ausgabefelder nennt nun auch Extraktion, Konfidenz und empfohlene Aktionen.

Keine inhaltlichen Widersprüche gefunden. Die zentrale Regel „niemals selbst
versenden" ist an drei Stellen konsistent verankert (Zweck, Wichtigste Regel,
Sicherheitsregeln) und wird durch die neue Checkliste nicht aufgeweicht: Der
Punkt „Antwort senden" ist eine Vormerkung zur manuellen Freigabe.

## 3. Wichtigste Designentscheidungen

- **Ein Skill statt Aufteilung:** Alle Teilaufgaben (analysieren, verfassen,
  verbessern, kürzen, verbindlicher machen, zusammenfassen, Ton anpassen,
  übersetzen) bleiben in einem Skill. Das hält Wartung und Auffindbarkeit
  einfach.
- **Ablauf unverändert bei 7 Schritten:** Extraktion wurde in Schritt 2,
  Konfidenz und empfohlene Aktionen in Schritt 7 eingebettet. Es kamen keine
  neuen Ablaufschritte hinzu.
- **Trennung von Analyse und Ausführung:** Empfohlene Aktionen sind bewusst eine
  reine Checkliste ohne Automatik. So bleibt der Skill für spätere manuelle oder
  halbautomatische Nutzung anschlussfähig, ohne die Freigabe zu umgehen.
- **Konservative Grundhaltung:** Bei Unsicherheit wird die Unklarheit benannt
  statt geraten; die Konfidenzstufe macht diese Unsicherheit explizit messbar.
- **Schweizer Hochdeutsch** ohne Gendersternchen, sachlicher Ton.

## 4. Offene Punkte und Einschränkungen

- **Keine technische Anbindung:** Der Skill liest keine Postfächer und versendet
  nichts. Eingabe (Mailtext, Verlauf) erfolgt manuell.
- **Konfidenz ist eine Einschätzung, keine Messgrösse:** Der Prozentwert ist
  eine begründete Selbsteinschätzung, kein kalibrierter Wert.
- **Klassifikation nur eine Hauptkategorie:** Mischfälle werden über die
  Begründung abgebildet, nicht über Mehrfachkategorien.
- **Sprache der Ausgabe:** Analyse standardmässig auf Schweizer Hochdeutsch;
  Übersetzung nur auf Anweisung.
- **Prioritätsstufe „Tief"** ist eng an „keine Handlung nötig" gekoppelt.
  Seltene Fälle (Antwort erwünscht, aber unwichtig) werden über die Begründung
  aufgelöst.
- **Spätere Automation** (Spark, Proton, Migadu, IMAP) ist bewusst noch nicht
  umgesetzt und für einen späteren Schritt vorgesehen.

## 5. Ergebnis

Nach Erweiterung, Konsistenzprüfung und Erstellung der Testfälle
(`TESTFAELLE.md`) gilt der Skill als **Version 1.0**.
