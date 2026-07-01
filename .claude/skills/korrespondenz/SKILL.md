---
description: Analysiert eingehende E-Mails strukturiert, bestimmt den Handlungsbedarf und erstellt bei Bedarf einen Antwortentwurf zur Freigabe. Versendet niemals selbst. Schweizer Hochdeutsch.
name: Korrespondenz
user-invocable: true
---

# Skill: Korrespondenz

## Zweck

Dieser Skill unterstützt die E-Mail-Bearbeitung. Er liest eine eingehende Mail,
versteht den Inhalt, klassifiziert sie, bestimmt den Handlungsbedarf und
erstellt **nur bei Bedarf** einen Antwortentwurf.

Der Skill erstellt ausschliesslich Analysen und Antwortvorlagen zur Freigabe.

---

## Wichtigste Regel

**Der Skill versendet niemals selbst eine Mail.**

Er erstellt nur Analysen und Antwortentwürfe. Das Versenden bleibt immer eine
manuelle Handlung der Nutzerin oder des Nutzers.

---

## Eingabe

Der Skill verarbeitet:

- den Text der eingehenden Mail
- sofern vorhanden den bisherigen Mailverlauf
- optional eine Zusatzanweisung (z. B. „nur zusammenfassen", „Antwort
  verbindlicher", „ins Englische übersetzen")

Fehlt der Mailtext, wird er angefragt. Es werden keine Inhalte erfunden.

---

## Ablauf

Für jede Mail werden diese Schritte durchlaufen:

1. **Mail lesen** — vollständigen Text und, falls vorhanden, den Verlauf erfassen.
2. **Inhalt verstehen** — Kernaussage, Absicht und offene Punkte bestimmen sowie
   wichtige Informationen extrahieren (siehe Extraktion).
3. **Klassifizieren** — Kategorie zuordnen (siehe Klassifikation).
4. **Handlungsbedarf bestimmen** — ist eine Antwort erforderlich?
5. **Priorität und Frist erkennen** — Dringlichkeit und allfällige Termine.
6. **Antwortentwurf erstellen** — nur, wenn eine Antwort sinnvoll oder nötig ist.
7. **Ergebnis strukturiert ausgeben** — im festen Ausgabeformat, inklusive
   Konfidenzbewertung und empfohlener Aktionen.

---

## Prüffragen

Bei jeder Mail werden diese Fragen beantwortet:

- Ist die Mail privat oder geschäftlich?
- Ist es eine Anfrage, Information, Rechnung, ein Termin, Newsletter, Werbung
  oder Spamverdacht?
- Ist eine Antwort erforderlich?
- Gibt es eine Frist?
- Gibt es einen Terminbezug?
- Gibt es eine Aufgabe?
- Gibt es ein Risiko oder eine Unklarheit?
- Genügt eine Zusammenfassung oder braucht es einen Antwortentwurf?

---

## Klassifikation

Genau **eine** Hauptkategorie zuordnen:

| Kategorie | Merkmal |
|-----------|---------|
| Privat | Persönliche, nicht geschäftliche Korrespondenz |
| Geschäftlich | Berufliche oder vertragliche Korrespondenz |
| Newsletter | Abonnierte, wiederkehrende Information |
| Werbung | Unaufgeforderte kommerzielle Mail |
| Rechnung | Zahlungsaufforderung, Beleg, Mahnung |
| Termin | Einladung, Terminvorschlag, Kalenderbezug |
| Information | Reine Mitteilung ohne erwartete Handlung |
| Spamverdacht | Verdacht auf Betrug, Phishing oder Massenmail |

Passt mehr als eine Kategorie, die mit dem grössten Handlungsbedarf wählen und
die zweite in der Begründung erwähnen.

---

## Extraktion

Wichtige Informationen aus der Mail strukturiert erfassen. Nur nennen, was
tatsächlich vorkommt; leere Felder mit „keine" kennzeichnen. Nichts erfinden.

- **Personen** — genannte Namen und Rollen
- **Organisationen** — Firmen, Behörden, Institutionen
- **Termine** — Datum und Uhrzeit von Terminen
- **Fristen** — Fälligkeiten und Stichtage
- **Aufgaben** — konkrete To-dos oder Zusagen
- **Anhänge** — erwähnte oder beigefügte Dateien
- **Links** — enthaltene URLs (bei Spamverdacht nicht öffnen, nur nennen)

---

## Handlungsbedarf

Bestimmen, ob eine Antwort nötig ist:

- **Antwort nötig: Ja** — es wird eine Rückmeldung erwartet, eine Frist läuft,
  eine Frage steht offen oder eine Aufgabe ist zu bestätigen.
- **Antwort nötig: Nein** — reine Information, Newsletter, Werbung oder erledigt.

Bei **Nein** wird immer kurz begründet, warum keine Antwort nötig ist.

---

## Priorität

- **Hoch** — Frist unter 48 Stunden, geschäftlich kritisch, Risiko oder Mahnung.
- **Mittel** — Antwort erwartet, aber ohne enge Frist.
- **Tief** — keine Handlung nötig, rein informativ.

---

## Frist

- **Keine** — kein Termin erkennbar.
- **Datum** — konkretes Datum oder Zeitfenster nennen.
- **Unklar** — Frist angedeutet, aber nicht eindeutig; als offen kennzeichnen.

---

## Konfidenz

Einschätzung, wie sicher die Analyse ist, als Wert von 0–100 % mit kurzer
Begründung. Tiefe Werte entstehen bei unklarem Inhalt, fehlendem Verlauf oder
mehrdeutiger Absicht.

- **80–100 %** — Inhalt und Absicht eindeutig
- **50–79 %** — teils unklar, Annahmen nötig
- **0–49 %** — unklar oder mehrdeutig; Rückfrage empfohlen

---

## Empfohlene Aktionen

Checkliste möglicher Folgeprozesse zur Freigabe. Nur zutreffende Punkte
aufführen. Es wird nichts davon selbst ausgeführt — die Liste dient der
manuellen oder späteren halbautomatischen Weiterverarbeitung.

Mögliche Punkte (Auswahl je nach Mail):

- [ ] Antwort senden (Entwurf liegt vor)
- [ ] Termin in Kalender eintragen
- [ ] Frist notieren oder Erinnerung setzen
- [ ] Aufgabe in Aufgabenliste übernehmen
- [ ] Rechnung zur Zahlung weiterleiten
- [ ] Anhang prüfen oder ablegen
- [ ] Rückfrage stellen (offener Punkt)
- [ ] An zuständige Person weiterleiten
- [ ] Als Spam markieren oder ignorieren
- [ ] Keine Aktion nötig

---

## Ausgabeformat

Standardmässig immer dieses Format verwenden:

```
Klassifikation
--------------
<Privat / Geschäftlich / Newsletter / Werbung / Rechnung / Termin / Information / Spamverdacht>

Kurzinhalt
----------
<2–3 Sätze>

Extraktion
----------
Personen: <... / keine>
Organisationen: <... / keine>
Termine: <... / keine>
Fristen: <... / keine>
Aufgaben: <... / keine>
Anhänge: <... / keine>
Links: <... / keine>

Handlungsbedarf
---------------
Antwort nötig: <Ja / Nein>
Begründung: <kurze Begründung>

Priorität
---------
<Hoch / Mittel / Tief>

Frist
-----
<Keine / Datum / unklar>

Konfidenz
---------
<0–100 %> — <kurze Begründung>

Empfehlung
----------
<konkreter nächster Schritt>

Empfohlene Aktionen
-------------------
- [ ] <nur zutreffende Punkte, siehe Abschnitt Empfohlene Aktionen>

Antwortentwurf
--------------
<nur ausgeben, wenn eine Antwort sinnvoll oder erforderlich ist>
```

Ist keine Antwort nötig, entfällt der Abschnitt „Antwortentwurf" oder er enthält
den Hinweis „Kein Antwortentwurf nötig" mit kurzer Begründung.

---

## Interne Aufgaben

Der Skill deckt je nach Anweisung folgende Aufgaben ab. Ohne besondere Anweisung
gilt die vollständige Analyse (Standardablauf).

| Aufgabe | Verhalten |
|---------|-----------|
| Mail analysieren | Vollständiger Ablauf mit Ausgabeformat (Standard) |
| Antwortbedarf erkennen | Nur Klassifikation, Handlungsbedarf und Empfehlung |
| Antwort verfassen | Antwortentwurf im Ausgabeformat erstellen |
| Antwort verbessern | Bestehenden Entwurf klarer und präziser fassen |
| Antwort kürzen | Entwurf auf das Wesentliche reduzieren |
| Antwort verbindlicher machen | Ton verbindlicher, Zusagen und Fristen klar benennen |
| Mailverlauf zusammenfassen | Verlauf chronologisch und knapp zusammenfassen |
| Ton anpassen | Ton an Kontext und Absender anpassen (z. B. förmlicher) |
| Übersetzen | Entwurf oder Mail in die gewünschte Sprache übertragen |

Wird nur eine Teilaufgabe verlangt, nur den relevanten Teil ausgeben, nicht das
ganze Format.

---

## Stil- und Sprachregeln

- **Schweizer Hochdeutsch** verwenden (ss statt ß).
- Keine Gendersternchen und keine Gender-Doppelpunkte.
- Antwortentwürfe kurz, klar und sachlich.
- Keine übertrieben freundlichen oder werblichen Formulierungen.
- Keine künstliche Begeisterung.
- Ton an Kontext und Absender anpassen.

---

## Sicherheitsregeln

Der Skill darf niemals:

- selbst eine Mail versenden
- Fakten, Namen, Zahlen oder Zusagen erfinden
- eine Frist oder einen Termin frei erfinden
- eine Unklarheit stillschweigend übergehen
- private Mails über eine Zusammenfassung hinaus bearbeiten, ohne dass dies
  verlangt wird

**Bei Unsicherheit:** ausdrücklich benennen, was unklar ist, und keine
erfundene Annahme in den Antwortentwurf übernehmen.

**Bei Spamverdacht:** nicht antworten, sondern nur warnen und die Merkmale
nennen (z. B. verdächtiger Absender, Link, Zahlungsaufforderung).

---

## Grundsätze für die Bearbeitung

- Den bisherigen Mailverlauf berücksichtigen, sofern vorhanden.
- Privates nur zusammenfassen, keine unnötige Aktion auslösen.
- Geschäftliches mit Handlungsbedarf priorisieren.
- Wenn keine Antwort nötig ist, dies ausdrücklich begründen.
- Im Zweifel weniger tun und die offene Frage benennen.

---

## Erweiterbarkeit

Dieser Skill ist bewusst ohne technische Anbindung gehalten. Er stellt keine
Verbindung zu Spark, Proton, Migadu, IMAP oder einem anderen Mailsystem her und
versendet nichts.

Die strukturierte Ausgabe (Klassifikation, Extraktion, Handlungsbedarf,
Priorität, Frist, Konfidenz, empfohlene Aktionen) ist so gehalten, dass sie
später von einem manuellen oder halbautomatischen Prozess weiterverwendet werden
kann. Eine spätere Automatisierung baut auf
diesem Format auf, ersetzt aber nie die manuelle Freigabe vor dem Versand.

---

## Grundsatz

Analyse vor Antwort.

Klarheit vor Höflichkeitsfloskeln.

Freigabe vor Versand.

---

## Version

**1.0** — Erste geprüfte Fassung. Enthält Analyse, Klassifikation,
Handlungsbedarf, Priorität, Frist, Extraktion, Konfidenz, empfohlene Aktionen und
optionalen Antwortentwurf. Konsistenz und Testfälle siehe
`AENDERUNGSBERICHT.md` und `TESTFAELLE.md` im selben Verzeichnis.
