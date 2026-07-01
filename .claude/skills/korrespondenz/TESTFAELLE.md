# Testfälle — Skill Korrespondenz (Version 1.0)

Diese Testfälle dienen als Referenz für die spätere manuelle Qualitätsprüfung.
Sie werden **nicht automatisch ausgeführt**. Jeder Fall nennt eine Beispielmail
und die erwarteten Kernergebnisse. Bei der Prüfung wird kontrolliert, ob die
Skill-Ausgabe diese Erwartungen im festen Ausgabeformat trifft und ob die Regel
„niemals selbst versenden" eingehalten bleibt.

Prüfschema pro Fall: Klassifikation, Antwort nötig, Priorität, Frist, zentrale
Extraktion, empfohlene Aktionen, Antwortentwurf (ja/nein).

---

## T01 — Private Mail

**Eingabe:** „Hoi, wir grillieren am Samstag ab 18 Uhr bei uns im Garten. Kommst
du auch? Liebe Grüsse, Anna."

**Erwartet:**
- Klassifikation: Privat
- Antwort nötig: Ja (persönliche Einladung, Rückmeldung erwartet)
- Priorität: Tief bis Mittel
- Frist: Datum (Samstag)
- Extraktion: Person Anna; Termin Samstag 18 Uhr
- Empfohlene Aktionen: Antwort senden; Termin eintragen
- Antwortentwurf: Ja, kurz und persönlich

---

## T02 — Geschäftliche Anfrage

**Eingabe:** „Sehr geehrte Damen und Herren, wir prüfen Ihr Angebot und bitten
bis Freitag um eine Offerte für 200 Stück inklusive Lieferkosten. Freundliche
Grüsse, M. Keller, Einkauf, Muster AG."

**Erwartet:**
- Klassifikation: Geschäftlich
- Antwort nötig: Ja (Offerte angefragt)
- Priorität: Hoch (Frist Freitag)
- Frist: Datum (Freitag)
- Extraktion: Person M. Keller (Einkauf); Organisation Muster AG; Aufgabe
  Offerte erstellen
- Empfohlene Aktionen: Antwort senden; Aufgabe übernehmen; Frist notieren
- Antwortentwurf: Ja, sachlich und verbindlich

---

## T03 — Newsletter

**Eingabe:** „Unser Monats-Newsletter: Neue Rezepte, Tipps und Aktionen. Hier
abmelden."

**Erwartet:**
- Klassifikation: Newsletter
- Antwort nötig: Nein (abonnierte Information)
- Priorität: Tief
- Frist: Keine
- Extraktion: Link Abmeldung
- Empfohlene Aktionen: Keine Aktion nötig (optional: ablegen)
- Antwortentwurf: Nein, mit Begründung

---

## T04 — Rechnung

**Eingabe:** „Rechnung Nr. 2026-0421 über CHF 480.00, zahlbar innert 30 Tagen
bis 31.07.2026. Rechnung im Anhang."

**Erwartet:**
- Klassifikation: Rechnung
- Antwort nötig: Nein (keine Rückmeldung erwartet, nur Zahlung)
- Priorität: Mittel
- Frist: Datum (31.07.2026)
- Extraktion: Frist 31.07.2026; Aufgabe Zahlung CHF 480.00; Anhang Rechnung
- Empfohlene Aktionen: Rechnung zur Zahlung weiterleiten; Frist notieren;
  Anhang prüfen und ablegen
- Antwortentwurf: Nein, mit Begründung

---

## T05 — Terminanfrage

**Eingabe:** „Passt Ihnen ein Gespräch am Dienstag, 7. Juli, um 14 Uhr, oder
schlagen Sie eine Alternative vor?"

**Erwartet:**
- Klassifikation: Termin
- Antwort nötig: Ja (Bestätigung oder Gegenvorschlag)
- Priorität: Mittel bis Hoch (naher Termin)
- Frist: Datum (7. Juli, 14 Uhr)
- Extraktion: Termin Dienstag 7. Juli 14 Uhr
- Empfohlene Aktionen: Antwort senden; Termin eintragen
- Antwortentwurf: Ja, kurz mit Zusage oder Alternative

---

## T06 — Spam-/Phishing-Mail

**Eingabe:** „Ihr Konto wurde gesperrt. Bestätigen Sie sofort Ihre Daten unter
http://sicher-login-bank.example um die Sperrung aufzuheben."

**Erwartet:**
- Klassifikation: Spamverdacht
- Antwort nötig: Nein (nicht antworten)
- Priorität: Tief (aber Warnhinweis)
- Frist: Keine (künstlicher Druck ignorieren)
- Extraktion: Link (nur nennen, nicht öffnen)
- Empfohlene Aktionen: Als Spam markieren oder ignorieren
- Antwortentwurf: Nein; Warnung mit Merkmalen (verdächtiger Link,
  Dringlichkeitsdruck, Datenabfrage)

---

## T07 — Mail ohne Antwortbedarf

**Eingabe:** „Zur Information: Das Büro bleibt am Bundesfeiertag geschlossen.
Keine Rückmeldung nötig."

**Erwartet:**
- Klassifikation: Information
- Antwort nötig: Nein (reine Mitteilung)
- Priorität: Tief
- Frist: Keine
- Extraktion: Termin 1. August (Bundesfeiertag, sofern genannt)
- Empfohlene Aktionen: Keine Aktion nötig
- Antwortentwurf: Nein, mit ausdrücklicher Begründung

---

## T08 — Mail mit Anhang

**Eingabe:** „Anbei der unterschriebene Vertrag als PDF sowie das Protokoll.
Bitte gegenlesen und bis Ende Woche bestätigen."

**Erwartet:**
- Klassifikation: Geschäftlich
- Antwort nötig: Ja (Bestätigung angefragt)
- Priorität: Hoch (Frist Ende Woche)
- Frist: Datum (Ende Woche)
- Extraktion: Anhänge Vertrag (PDF), Protokoll; Aufgabe gegenlesen und
  bestätigen; Frist Ende Woche
- Empfohlene Aktionen: Anhang prüfen; Antwort senden; Aufgabe übernehmen;
  Frist notieren
- Antwortentwurf: Ja, nach Prüfung; bei ungeprüftem Inhalt Unsicherheit benennen

---

## T09 — Mail auf Französisch oder Englisch

**Eingabe (FR):** „Bonjour, pourriez-vous confirmer la réception du dossier et
m'indiquer un délai de traitement? Merci, C. Dubois."

**Erwartet:**
- Klassifikation: Geschäftlich
- Antwort nötig: Ja (Empfangsbestätigung und Frist angefragt)
- Priorität: Mittel
- Frist: Unklar (Bearbeitungsfrist angefragt, nicht genannt)
- Extraktion: Person C. Dubois; Aufgabe Empfang bestätigen, Frist nennen
- Konfidenz: mittel bis hoch; Fremdsprache korrekt erkannt
- Empfohlene Aktionen: Antwort senden; Rückfrage zur Frist
- Antwortentwurf: Ja; Analyse auf Schweizer Hochdeutsch, Antwortentwurf auf
  Anweisung auf Französisch

---

## T10 — Längerer Mailverlauf

**Eingabe:** Verlauf über vier Nachrichten zu einem Projekt: (1) Anfrage, (2)
Rückfrage, (3) Antwort mit offener Detailfrage, (4) letzte Nachricht: „Wie in
den letzten Mails besprochen — können Sie den finalen Termin bis morgen
bestätigen?"

**Erwartet:**
- Klassifikation: Geschäftlich (Termin/Projekt)
- Antwort nötig: Ja (Terminbestätigung bis morgen)
- Priorität: Hoch (Frist morgen)
- Frist: Datum (morgen)
- Extraktion: Aufgabe finalen Termin bestätigen; offene Detailfrage aus
  Nachricht 3
- Verlauf: chronologisch berücksichtigt; offene Detailfrage nicht übergehen
- Empfohlene Aktionen: Antwort senden; Termin eintragen; offene Detailfrage
  klären
- Antwortentwurf: Ja, mit Bezug auf den bisherigen Verlauf; offene Punkte
  benennen statt raten

---

## T11 — Werbung

**Eingabe:** „Nur diese Woche: 20 % auf das gesamte Sortiment. Jetzt zugreifen und
sparen!"

**Erwartet:**
- Klassifikation: Werbung
- Antwort nötig: Nein (unaufgeforderte kommerzielle Mail)
- Priorität: Tief
- Frist: Keine (künstlicher Zeitdruck, kein echter Termin)
- Extraktion: keine (kein Absender mit Namen, keine Aufgabe)
- Empfohlene Aktionen: Keine Aktion nötig
- Antwortentwurf: Nein, mit Begründung

---

## Querschnittsprüfungen (für alle Fälle)

- Ausgabe folgt dem festen Ausgabeformat des Skills.
- Bei „Antwort nötig: Nein" ist eine Begründung vorhanden.
- Kein Antwortentwurf bei Newsletter, Werbung und Spamverdacht.
- Keine erfundenen Namen, Zahlen, Termine oder Fristen.
- Unklarheiten werden benannt, nicht überspielt.
- Konfidenz ist angegeben und plausibel begründet.
- In keinem Fall wird eine Mail versendet; „Antwort senden" bleibt eine
  Checklisten-Vormerkung zur Freigabe.
- Sprache der Analyse: Schweizer Hochdeutsch, keine Gendersternchen.
