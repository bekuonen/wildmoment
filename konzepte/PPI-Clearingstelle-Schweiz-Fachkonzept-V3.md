# Nationale PPI-Clearingstelle Schweiz
## Fachkonzept V3 — Integrierte Fassung

**Version:** 3.0  
**Datum:** 18. Juni 2026  
**Status:** Konsolidierte Arbeitsgrundlage  
**Grundlage:** Fachkonzept V1, V2 und Modellkorrektur Patientenorganisationen  

---

> **Leitfrage**  
> Wie kann die Schweiz mit begrenzten Ressourcen eine wirksame PPI-Vermittlungsinfrastruktur aufbauen, die passende Erfahrungen und Kompetenzen findet — ohne eine grosse Plattformorganisation zu schaffen und ohne bestehende Organisationsstrukturen zur Zugangsbedingung zu machen?

---

## Inhaltsverzeichnis

1. [Executive Summary](#1-executive-summary)
2. [Was ist PPI?](#2-was-ist-ppi)
3. [Das Problem in der Schweiz](#3-das-problem-in-der-schweiz)
4. [Lehren aus bestehenden Systemen](#4-lehren-aus-bestehenden-systemen)
5. [Die drei Perspektivtypen — das Kernmodell](#5-die-drei-perspektivtypen--das-kernmodell)
6. [Betriebsmodell: Clearingstelle](#6-betriebsmodell-clearingstelle)
7. [Fachmodell](#7-fachmodell)
8. [Service Blueprint](#8-service-blueprint)
9. [Minimalmodell](#9-minimalmodell)
10. [Governance](#10-governance)
11. [Datenschutz](#11-datenschutz)
12. [Risiken](#12-risiken)
13. [Empfehlungen](#13-empfehlungen)
14. [Kernfragen beantwortet](#14-kernfragen-beantwortet)
15. [Quellennachweis](#15-quellennachweis)

---

## 1. Executive Summary

### 1.1 Worum es geht

Forschungsprojekte in der Schweiz suchen heute Patientenperspektiven, Erfahrungen und PPI-Kompetenzen über persönliche Netzwerke und Einzelanfragen. Eine systematische, zugängliche Infrastruktur fehlt. Das führt zu Netzwerkverzerrungen, Tokenismus und unterrepräsentierten Perspektiven.

Dieses Konzept beschreibt eine **nationale PPI-Clearingstelle**: einen menschlich geführten Vermittlungsdienst mit leichter digitaler Unterstützung, der Forschungsprojekte mit passenden Perspektiven, Erfahrungen und Kompetenzen zusammenführt — auf Basis des gesuchten Beitragstyps, nicht auf Basis von Diagnosen oder Organisationsmitgliedschaft.

### 1.2 Die vier Grundentscheide

**Entscheid 1 — Clearingstelle, nicht Plattform**  
Für den Schweizer Markt (50–150 PPI-relevante Projekte pro Jahr, 50–100 aktivierbare Mitwirkende) ist ein koordinierter Vermittlungsdienst wirksamer als eine automatisierte Matching-Plattform. Vertrauen entsteht durch menschliche Begleitung, nicht durch Algorithmen.

**Entscheid 2 — Drei Perspektivtypen als Matching-Einstieg**  
PPI-Mitwirkende bringen drei grundlegend verschiedene Beiträge. Das Matching beginnt mit der Frage nach dem gesuchten Perspektivtyp — nicht mit der Organisationszugehörigkeit.

**Entscheid 3 — Direktzugang und Organisationszugang gleichwertig**  
Individuen registrieren sich direkt, ohne Organisationsmitgliedschaft. Patientenorganisationen sind wichtige Netzwerkpartner und der richtige Zugang für kollektive Vertretung — aber keine obligatorischen Intermediäre für individuelle PPI-Beteiligung.

**Entscheid 4 — Minimalmodell zuerst**  
Die kleinstmögliche funktionierende Einheit: 50–80 aktive Mitwirkende, 20–40 Projekte pro Jahr, 20–30 Stellenprozent Koordination, Technologiekosten unter 100 CHF/Monat. Skalierung folgt, wenn das Modell sich bewährt hat.

### 1.3 Kernaussagen auf einen Blick

| Frage | Antwort |
|---|---|
| Plattform oder Clearingstelle? | Clearingstelle mit leichter digitaler Unterstützung |
| Zentrale Matching-Logik? | Perspektivtyp → Vermittlungsweg → Person oder Organisation |
| Patientenorganisationen? | Wertvolle Partner, kein obligatorischer Zwischenschritt |
| Technologiebedarf Phase 1? | Formular + interne Datenbank + E-Mail |
| Minimale funktionierende Einheit? | 50–80 Mitwirkende, 20 Stp. Koordination |
| Grösste Herausforderung? | Governance, Datenqualität und Aktivierung — nicht Technik |
| Voraussetzung für Start? | Trägerschaft geklärt, Taxonomie definiert, Koordination finanziert |

---

## 2. Was ist PPI?

### 2.1 Definition

Patient and Public Involvement (PPI) bezeichnet die aktive Mitgestaltung von Forschungsprozessen durch Personen mit gelebter Erfahrung — nicht als Forschungssubjekte, sondern als Partnerinnen und Partner.

Die Referenzdefinition von INVOLVE/NIHR (UK):

> *"Research being carried out 'with' or 'by' members of the public rather than 'to', 'about' or 'for' them."*

**PPI ist:**
- Mitgestaltung von Forschungsfragen und -prioritäten
- Review von Studienprotokollen und Patienteninformationen
- Mitwirkung in Advisory Boards, Steering Committees, Ethikkonsultationen
- Beteiligung an Dissemination und Wissenschaftskommunikation

**PPI ist nicht:**
- Teilnahme als Probandin oder Proband in einer klinischen Studie
- Befragung von Patientinnen und Patienten als Datenquelle
- Patientenrekrutierung für klinische Trials

Diese Unterscheidung ist fundamental. Fast alle grossen bestehenden Matching-Systeme (NIHR Be Part of Research, ResearchMatch, Antidote) adressieren Studienteilnahme, nicht PPI. Das ist der Grund, warum eine spezifische PPI-Infrastruktur fehlt.

### 2.2 PPI ist ein Beziehungsmodell, kein Ereignis

PPI ist nicht ein einzelner Kontakt zwischen Forschenden und Betroffenen. Es ist ein Prozess, der idealerweise über die Dauer eines Projekts anhält, gegenseitiges Lernen ermöglicht und Vertrauen aufbaut. Eine Infrastruktur, die nur den Erstkontakt herstellt, löst das eigentliche Problem nicht.

### 2.3 Warum PPI häufig scheitert

Die internationale Forschung ist konsistent: Tokenismus ist das grösste strukturelle Problem. Echte Mitgestaltung findet in weniger als der Hälfte aller Projekte mit formalem PPI-Anspruch statt (BMC Medicine, 2020).

Ursachen sind nicht technischer Natur:
- PPI-Mitwirkende werden zu spät eingeladen
- Rollen und Erwartungen sind unklar
- Kein Rückfluss: was wurde mit dem Input gemacht?
- Fehlende Vorbereitung beider Seiten
- Kein organisatorischer Rückhalt für Mitwirkende

Eine Clearingstelle, die nur vermittelt, aber diese Qualitätsfragen nicht adressiert, reproduziert das Problem. Die Anfrage-Prüfung und das Feedback-System sind deshalb keine optionalen Features, sondern strukturelle Kernelemente.

### 2.4 Internationale Rahmenbedingungen

**NIHR/INVOLVE (UK):** Sechs UK Standards for Public Involvement: Inclusive Opportunities, Working Together, Support and Learning, Communications, Impact, Governance. Seit 2020 in NIHR integriert.

**SPOR Canada:** Patient Engagement Framework mit den Prinzipien Inclusion, Support, Mutual Respect, Co-building. Explizite Forderung nach finanzieller Entschädigung von PPI-Partnern.

**PCORI (USA):** Engagement Rubric (2016) mit Prinzipien Reciprocal Relationships, Co-Learning, Valued Partnership, Trust and Transparency.

**EUPATI (Europa):** 14-monatiges Ausbildungsprogramm für Patienten-Expertinnen und -Experten. Absolventen = EUPATI Fellows, zertifizierte PPI-Fachpersonen. 7. Jahrgang Oktober 2023: 80 Fellows aus 33 Ländern.

---

## 3. Das Problem in der Schweiz

### 3.1 Die vier Strukturprobleme

**Problem A — Infrastruktur fehlt**  
Es gibt kein nationales Register, keine Vermittlungsstelle, keine systematische Übersicht über PPI-Mitwirkende in der Schweiz.

**Problem B — Netzwerkverzerrung**  
Zugang zu PPI-Mitwirkenden ist netzwerkabhängig. Wer gut vernetzt ist, findet wen. Wer es nicht ist, findet niemanden. Das begünstigt bekannte, gut organisierte Gruppen und schränkt die Diversität der eingebrachten Perspektiven ein.

**Problem C — Kompetenz-Mismatch**  
Nicht jede Patientin und jeder Patient ist für jede PPI-Rolle geeignet. Ohne Transparenz über Kompetenzen und Erfahrungen entstehen Mismatches, die zu Tokenismus führen.

**Problem D — Keine gemeinsame Sprache**  
Was ein Forschungsteam unter "PPI" versteht, deckt sich oft nicht mit dem Verständnis eines anderen Teams. Taxonomien für Rollen, Kompetenzniveaus und Beitragsformate sind nicht standardisiert.

### 3.2 Marktgrösse Schweiz

*Schätzungen, keine gesicherten Zahlen. Methodische Grundlage: öffentliche Daten zu Forschungsförderung, institutionelle Forschungskapazitäten, Analogieschlüsse aus vergleichbaren Systemen.*

**Nachfrageseite (Projekte):**

| Quelle | Schätzung PPI-relevanter Projekte/Jahr |
|---|---|
| SNF-geförderte Gesundheitsforschung | 30–80 |
| Universitätsspitäler (klinische Forschung) | 20–50 |
| Industriegesponserte Studien mit PPI-Anforderung | 10–30 |
| Weitere (SAKK, Swiss TPH, Rare Diseases) | 5–15 |
| **Total realistisch** | **50–150** |

Für eine Anfangsphase realistisch erreichbar: **20–40 Projekte pro Jahr**.

**Angebotsseite (Mitwirkende):**

| Gruppe | Schätzung |
|---|---|
| EUPATI Fellows in der Schweiz (aktiv) | 20–45 |
| Erfahrene PPI-Mitwirkende ohne Formalausbildung | 50–200 |
| Patientenorg.-Vertreterinnen und -Vertreter (regelmässig aktiv) | 50–150 |
| **Total potenziell erreichbar** | **100–400** |

Für eine Anfangsphase aktivierbar: **50–80 Personen** (wenn Rekrutierung über bestehende Netzwerke erfolgt).

**Schlussfolgerung:** Der Schweizer Markt ist ein Nischenmarkt. Die kritische Schwelle für eine automatisierte Matching-Plattform (mehrere hundert Projekte, mehrere tausend Profile) ist auf absehbare Zeit nicht erreichbar. Ein kuratorisches Clearinghaus-Modell ist die angemessene Antwort auf diese Marktgrösse.

### 3.3 Was die Schweiz hat — und was fehlt

**Vorhanden:**
- Swiss Personalized Health Network (SPHN), CHF 20,7 Mio. 2025–2028, mit Patientenorganisations-Beteiligung
- SCTO-Netzwerk als klinische Forschungsinfrastruktur
- EUPATI-Netzwerk (europäisch, Schweizer Anteil vorhanden)
- Zahlreiche Patientenorganisationen in allen Sprachregionen
- nDSG (seit September 2023) als klarer Datenschutzrahmen

**Fehlend:**
- Koordinierte PPI-Vermittlungsinfrastruktur
- Nationale PPI-Taxonomie
- Systematische Qualitätsstandards für PPI-Engagements
- Ressourcen für PPI-Koordination an Forschungsinstitutionen

---

## 4. Lehren aus bestehenden Systemen

### 4.1 Die entscheidende Unterscheidung

Bestehende Plattformen werden oft als Referenz zitiert, sind aber für PPI-Beteiligung nur bedingt relevant. Der Unterschied:

| | Studienteilnahme | PPI-Beteiligung |
|---|---|---|
| Rolle | Proband (Forschungssubjekt) | Partner (Mitgestalter) |
| Matching-Basis | Diagnose, Eligibility-Kriterien | Perspektive, Kompetenz, Beitragstyp |
| Typisches Format | Intervention, Messung | Beratung, Review, Governance |

**Fast alle grossen Plattformen adressieren Studienteilnahme.** Ihre Erfahrungen sind übertragbar als Warnungen — nicht als Vorbilder.

### 4.2 Wichtigste Befunde

**NIHR Be Part of Research (UK, seit 2022):**  
528.000 registriert, ca. 50.000 aktiv teilgenommen — Aktivierungsquote unter 10%. Matching basiert auf Alter, Geschlecht, Ethnie, Standort, Erkrankungsinteressen. Primär Studienteilnahme, nicht PPI. Lehre: Registrierung ist einfach zu erreichen; echte Beteiligung ist das eigentliche Problem.

**ResearchMatch (USA, seit 2009):**  
National, an der Vanderbilt University betrieben. 1 von 5 kontaktierten Freiwilligen reagierte positiv auf Forscheranfragen. Privacy-by-Design-Modell: Forschende sehen de-identifizierte Profile; Freiwillige geben Kontaktdaten nur bei Interesse frei. Dieses Datenschutzmodell ist übertragbar.

**EUPATI Fellow-Netzwerk:**  
Das einzige Modell, das explizit kompetenzbasierte PPI-Rollen adressiert. Vermittlung erfolgt informell über persönliche Kontakte — keine systematische Infrastruktur. Lehre: Kompetenzorientierung funktioniert, aber braucht Koordinationsinfrastruktur.

**CUE (Consumers United for Evidence-based Healthcare):**  
Clearinghouse-Modell mit menschlicher Koordination: Anfragen von Gesundheitsorganisationen werden manuell mit kuratierten Verbraucherprofilen gematcht. Funktioniert gut für kleine kuratierte Netzwerke. Direkt übertragbares Modell.

**Gemeinsame Lehren aus allen Systemen:**  
Tokenismus ist ein Governance-Problem, kein Technikproblem. Profile ohne aktive Pflege verlieren schnell an Qualität. Vertrauen entsteht durch menschliche Begleitung. Die kritische Herausforderung ist Aktivierung nach der Registrierung, nicht die Registrierung selbst.

---

## 5. Die drei Perspektivtypen — das Kernmodell

### 5.1 Warum diese Unterscheidung entscheidend ist

"Patientenperspektive" ist kein einheitlicher Begriff. Er deckt drei inhaltlich verschiedene Beiträge ab, die für unterschiedliche Forschungsaufgaben relevant sind und über unterschiedliche Wege vermittelt werden.

Wenn diese Typen nicht unterschieden werden, entstehen drei Probleme:
- Falsches Matching: Das Projekt bekommt eine andere Perspektive als gesucht
- Exklusion: Menschen ohne Organisationsmitgliedschaft finden keinen Zugang
- Qualitätsverlust: Authentische gelebte Erfahrung wird durch organisierte Vertretung ersetzt

Das Matching beginnt deshalb nicht mit der Frage "welche Organisation?" — sondern mit: **"Welchen Perspektivtyp braucht dieses Projekt?"**

---

### 5.2 Typ A — Gelebte Erfahrung

**Was es ist:**  
Die persönliche, individuelle Erfahrung einer Erkrankung, eines Versorgungsweges oder einer Pflegesituation. Ungefiltert, nicht delegierbar, einzigartig.

**Wer es ist:**  
Patient, ehemalige Patientin, Angehörige/r, betreuende Person. Spricht ausschliesslich für sich selbst.

**Was es leistet:**  
Authentizität. Die direkte Erfahrungsrealität — was belastet, was fehlt, was nicht verstanden wird. Diese Perspektive ist in der Forschung am häufigsten unterrepräsentiert und am schwersten zu ersetzen.

**Typische Beiträge:**  
Fokusgruppe, Patienteninformation-Review, Entwicklung von Rekrutierungsmaterialien, Feedback zur Patientenrelevanz einer Forschungsfrage.

**Zugang zur Clearingstelle:**  
**Direkt** — ohne Organisationsmitgliedschaft.

---

### 5.3 Typ B — Kollektive Vertretung

**Was es ist:**  
Die Vertretung eines kollektiven Standpunkts, formuliert durch eine Gemeinschaft von Betroffenen und gebündelt durch eine Organisation. Die Person spricht mit einem kollektiven Mandat.

**Wer es ist:**  
Vorstandsmitglied einer Patientenorganisation, Delegierte/r einer Betroffenengemeinschaft. Kann, muss aber nicht selbst erkrankt sein.

**Was es leistet:**  
Politisches Gewicht und organisatorischen Rückhalt. Die kollektive Sichtweise: nicht "was ich erlebe", sondern "was unsere Gemeinschaft braucht".

**Typische Beiträge:**  
Advisory Board mit institutioneller Repräsentation, HTA-Konsultation, Forschungspriorisierungsprozesse, kollektive Stellungnahmen.

**Zugang zur Clearingstelle:**  
**Über Patientenorganisation** — dieses Mandat ist konstitutiv an eine Organisation gebunden.

---

### 5.4 Typ C — PPI-Expertise

**Was es ist:**  
Ausgebildetes Fachwissen über Forschungsprozesse, kombiniert mit Patientenperspektive (aktuell oder historisch). Eine professionelle Kompetenz, die über persönliche Erfahrung hinausgeht.

**Wer es ist:**  
EUPATI Fellow, langjährige PPI-Mitwirkende mit umfangreicher Forschungserfahrung, ausgebildete Patientenexpertin.

**Was es leistet:**  
Methodisches Brückenwissen. Die Person versteht sowohl Patientenperspektive als auch Forschungslogik. Sie kann Studienprotokolle substantiell kommentieren, Advisory Boards aktiv mitgestalten, regulatorische Anforderungen einschätzen.

**Typische Beiträge:**  
Protokoll-Review auf Fachebene, Steering Committee, EMA/Swissmedic-Konsultationen, Methodenberatung.

**Zugang zur Clearingstelle:**  
**Direkt** — Kompetenz ist personengebunden, nicht organisationsgebunden.

---

### 5.5 Die Vermittlungswege im Überblick

```
FORSCHUNGSPROJEKT
        │
        ▼
CLEARINGSTELLE klärt:
"Welchen Perspektivtyp braucht dieses Projekt?"
        │
        ├── TYP A gesucht ──────► direktes Register
        │   (gelebte Erfahrung)    individueller Mitwirkender
        │
        ├── TYP B gesucht ──────► Anfrage an
        │   (kollektive Vertretung) Patientenorganisation
        │
        └── TYP C gesucht ──────► direktes Register
            (PPI-Expertise)         PPI-Experten
```

**Patientenorganisationen als Netzwerkpartner — nicht als Gatekeeper:**  
Für Typ A kann die Clearingstelle Patientenorganisationen als Netzwerkzugang nutzen (Bekanntmachung unter Mitgliedern). Das ändert nichts am Direktzugang: Mitglieder entscheiden selbst über eine eigene Registrierung. Die Organisation empfiehlt — sie selektiert nicht.

---

## 6. Betriebsmodell: Clearingstelle

### 6.1 Der Modellentscheid

Drei Modelle wurden verglichen:

**Modell A — Matching-Plattform:**  
Digitale, selbstbedienbare Plattform mit automatisiertem Matching. Skalierbar, transparent — aber: erfordert kritische Masse, stabile Taxonomie, hohe Investition, und zeigt bei vergleichbaren Systemen unter 10% Aktivierungsquote. Für den Schweizer Markt zu gross gedacht.

**Modell B — Reine Clearingstelle:**  
Menschlich geführte Vermittlung mit minimaler digitaler Unterstützung. Hohe Qualität, niedrige Kosten, gutes Vertrauen — aber: skaliert nicht über Koordinationskapazität hinaus, Schlüsselpersonenrisiko.

**Modell C — Hybrides Modell (gewählt):**  
Clearingstelle mit leichter digitaler Unterstützung. Vermittlung bleibt menschlich. Technologie dient der Strukturierung, nicht der Automatisierung.

| Kriterium | Plattform (A) | Clearingstelle (B) | Hybrid (C) |
|---|---|---|---|
| Qualität | Datenabhängig | Hoch | Hoch |
| Vertrauen | Niedrig | Hoch | Hoch |
| Datenschutz | Aufwändig | Einfach | Einfach |
| Kosten | Hoch | Niedrig | Niedrig–Mittel |
| Skalierbarkeit | Hoch | Niedrig | Mittel |
| CH-Realismus Phase 1 | Niedrig | Hoch | Hoch |

### 6.2 Was die Clearingstelle tut — und was nicht

**Die Clearingstelle tut:**
- Anfragen von Forschenden entgegennehmen und auf Eignung prüfen
- Den Perspektivtyp und Beitragsbedarf klären
- Aus dem kuratierten Netzwerk geeignete Personen oder Organisationen vorschlagen
- Den Erstkontakt begleiten
- Feedback nach Engagements einsammeln und auswerten
- Das Netzwerk pflegen (Mitwirkende informieren, Organisationen einbinden)

**Die Clearingstelle tut nicht:**
- Forschende oder Mitwirkende bewerten
- Eigenständig PPI-Aktivitäten durchführen
- Als Anwalt einer Seite agieren
- Entscheiden, wer an einem Projekt teilnimmt (diese Entscheidung liegt bei den Mitwirkenden)

### 6.3 Technologie — bewusst einfach halten

| Funktion | Werkzeug | Kosten/Monat |
|---|---|---|
| Profil-Datenbank (intern) | Airtable / Notion | 0–25 CHF |
| Anfrage-Formular | Tally / Typeform | 0–25 CHF |
| Feedback-Formulare | Tally / Google Forms | 0 |
| Kommunikation | E-Mail (bestehend) | 0 |
| Netzwerk-Newsletter | Mailchimp (bis 500 Kontakte) | 0 |
| **Total** | | **0–50 CHF** |

**Keine eigene Plattformentwicklung in Phase 1.** Die Profilstruktur wird in einer einfachen Datenbank gepflegt, nicht öffentlich zugänglich gemacht. Erst wenn das Volumen es rechtfertigt, wird eine leichte Web-Oberfläche erwogen.

---

## 7. Fachmodell

### 7.1 Akteure

**Akteur 1 — PPI-Mitwirkende (Individuen)**  
Personen mit gelebter Erfahrung (Typ A) oder PPI-Expertise (Typ C), die sich direkt registrieren. Erscheinen im Clearingstellen-Netzwerk nach eigener Entscheidung. Vollständige Kontrolle über Profilsichtbarkeit und Kontaktfreigabe.

**Akteur 2 — Patientenorganisationen**  
Organisationen, die kollektive Interessen vertreten (Typ B-Quelle) und ihr Netzwerk als Rekrutierungskanal für Typ-A-Mitwirkende öffnen können. Eigenständige Akteure mit Organisationsprofil.

**Akteur 3 — Forschungsprojekte**  
Teams mit spezifischem PPI-Bedarf. Kunden des Dienstes. Müssen bei Anfrage nachweisen, dass PPI-Beiträge tatsächlich genutzt werden.

**Akteur 4 — Clearingstelle**  
Koordinierende Instanz. Kein Akteur in der Forschung selbst. Neutral gegenüber beiden Seiten.

### 7.2 PPI-Rollen (drei operative Stufen)

**Stufe 1 — Erfahrungsträger/in**  
Gelebte Erfahrung, keine PPI-Vorerfahrung erforderlich.  
Beiträge: Fokusgruppen, Patienteninformations-Review, Feedback zu Forschungsrelevanz.

**Stufe 2 — Erfahrene/r PPI-Mitwirkende/r**  
Nachgewiesene PPI-Beiträge in Forschungsprojekten.  
Beiträge: Protokoll-Review (einfach), Projektbegleitgruppen, wiederkehrende Beratungsrollen.

**Stufe 3 — PPI-Expertin / PPI-Experte**  
Formale Ausbildung (EUPATI Fellow oder äquivalent) und/oder langjährige Forschungserfahrung.  
Beiträge: Advisory Boards, Steering Committees, regulatorische Konsultationen, Protokoll-Review (substantiell).

*Patientenorganisations-Vertreterinnen und -Vertreter sind keine eigene Stufe. Sie stehen auf einer der drei Stufen — mit dem zusätzlichen Merkmal des kollektiven Mandats.*

### 7.3 Matching-Dimensionen (vier operative Fragen)

Das Matching ist vierdimensional. Alle vier Fragen werden gestellt — in dieser Reihenfolge:

**Frage 1 — Welchen Perspektivtyp braucht dieses Projekt?**  
A (gelebte Erfahrung) / B (kollektive Vertretung) / C (PPI-Expertise)  
→ Bestimmt den Vermittlungsweg.

**Frage 2 — Was soll die Person konkret tun?**  
Fokusgruppe / Review / Beratung / Advisory Board / Steering Committee / Dissemination  
→ Bestimmt die benötigte Stufe.

**Frage 3 — In welchem Themenfeld?**  
Breite Kategorien (Onkologie / Neurologie / Psychische Gesundheit / Seltene Erkrankungen / Herz-Kreislauf / Muskuloskeletal / Allgemein/Versorgung)  
→ Optional, kein Pflichtfeld für alle Typen.

**Frage 4 — Was sind die Rahmenbedingungen?**  
Sprache / Format (online, hybrid, Präsenz) / Zeitaufwand (einmalig, wiederkehrend) / Entschädigung (vorgesehen/nicht)  
→ Ausschlusskriterien wenn keine Übereinstimmung.

### 7.4 Profil-Felder (Individuum)

| Feld | Pflicht | Typ A | Typ C |
|---|---|---|---|
| Perspektivtyp | Ja | A | C |
| PPI-Stufe | Ja | 1 oder 2 | 2 oder 3 |
| Beitragstypen (Mehrfachauswahl) | Ja | ✓ | ✓ |
| Sprachen | Ja | ✓ | ✓ |
| Format-Präferenz | Ja | ✓ | ✓ |
| Zeitverfügbarkeit (grob) | Ja | ✓ | ✓ |
| Themenfeld (Mehrfachauswahl) | Nein | Optional | Optional |
| Verbundene Organisation | Nein | Optional | Optional |
| PPI-Nachweise / Portfolio | Nein | — | Optional |
| Entschädigungserwartung | Ja | ✓ | ✓ |

**Was explizit nicht erhoben wird:** Diagnosen, Medikamente, klinische Daten, detaillierter Krankheitsverlauf.

### 7.5 Profil-Felder (Patientenorganisation)

| Feld | Pflicht |
|---|---|
| Organisationsname und Rechtsform | Ja |
| Kontaktperson | Ja |
| Themenfelder | Ja |
| Sprachregion(en) | Ja |
| Bereitschaft für Typ-B-Anfragen | Ja |
| Bereitschaft zur Netzwerk-Weitergabe (Typ A) | Ja / Nein |
| Maximale Anfragen pro Jahr | Optional |

---

## 8. Service Blueprint

### 8.1 Grundprinzip

Der Wert entsteht nicht in der Technologie, sondern in den menschlichen Schritten. Der Blueprint zeigt, wo welche Arbeit geleistet wird und welche Schritte digital unterstützt werden können.

### 8.2 Die sieben Phasen

---

**Phase 1 — Bedarf entsteht**

Ein Forschungsteam erkennt, dass es Patientenperspektiven in sein Projekt einbeziehen will oder muss (Fördervoraussetzung, eigene Überzeugung, Empfehlung).

*Häufiges Problem:* Der Bedarf ist unklar. Das Team weiss nicht, welchen Perspektivtyp es braucht, wann PPI im Projektzyklus eingesetzt werden soll, und was eine faire Beteiligung bedeutet.

*Was die Clearingstelle leistet:* Beratungsgespräch zur Bedarfsklärung. Das ist kein optionales Add-on — es ist der wichtigste Qualitätsmoment des gesamten Prozesses.

*Braucht es Technologie?* Nein. Braucht es menschliche Kompetenz? Ja.

---

**Phase 2 — Anfrage**

Das Forschungsteam stellt eine strukturierte Anfrage.

*Pflichtangaben:*
- Perspektivtyp (A/B/C)
- Beitragstyp (was soll die Person tun?)
- Zeitaufwand (Stunden, Dauer)
- Projektzeitplan (wann wird der Beitrag gebraucht?)
- Ressourcen für PPI (Entschädigung vorgesehen, ja/nein/in Verhandlung)
- Sprachen
- Kurzbeschreibung des Forschungsprojekts (für Mitwirkende)

*Warum dieser Schritt wichtig ist:* Das Ausfüllen des Formulars erzwingt Klarheit beim Forschungsteam. Vage Anfragen ("wir suchen Patientinnen") werden nicht akzeptiert.

*Kann digitalisiert werden:* Ja. Einfaches Online-Formular.

---

**Phase 3 — Anfrage-Prüfung**

Die Clearingstelle prüft die Anfrage vor dem Weiterleiten.

*Prüfpunkte:*
- Ist die Anfrage PPI-geeignet (nicht Studienrekrutierung)?
- Ist der Zeitpunkt im Forschungsprozess sinnvoll?
- Ist der Aufwand für Mitwirkende realistisch eingeschätzt?
- Ist eine Entschädigung vorgesehen oder erklärt, warum nicht?
- Sind Vorbereitung und Begleitung der Mitwirkenden geplant?

*Bei problematischen Anfragen:* Rückfragen an Forschende oder Ablehnung mit Begründung.

*Braucht es Technologie?* Nein. Menschliche Einschätzung.

*Warum dieser Schritt zentral ist:* Die Anfrage-Prüfung ist der wichtigste Schutzmechanismus für PPI-Mitwirkende. Sie verhindert, dass die Clearingstelle Tokenismus reproduziert.

---

**Phase 4 — Vermittlung**

Die Clearingstelle sucht geeignete Personen oder Organisationen.

*Vorgehen nach Perspektivtyp:*

Typ A → Suche im individuellen Profil-Register nach Beitragstyp, Themenfeld, Sprache, Verfügbarkeit. 2–3 Profile vorausgewählt. Optional: Bekanntmachung über verbundene Patientenorganisationen.

Typ B → Anfrage an geeignete Patientenorganisation. Organisation entscheidet intern, wen sie für die Rolle vorschlägt.

Typ C → Suche im PPI-Experten-Register nach Kompetenzprofil.

*Braucht es Technologie?* Interne Datenbank erleichtert die Suche erheblich.

---

**Phase 5 — Kontakt**

PPI-Mitwirkende erhalten die Projektinformation und entscheiden selbst über Kontaktfreigabe.

*Datenschutzmodell:* Kontaktdaten werden nie automatisch weitergegeben. Mitwirkende erhalten zuerst anonymisierte Projektinformation. Erst wenn sie Interesse signalisieren, erfolgt die Kontaktfreigabe.

*Begleitung durch Clearingstelle:* Erste Kontaktaufnahme zwischen Forschungsteam und Mitwirkenden wird begleitet. Erwartungsklärung auf beiden Seiten.

*Kann digitalisiert werden:* E-Mail-basierter Prozess reicht.

---

**Phase 6 — Zusammenarbeit**

Forschungsteam und PPI-Mitwirkende arbeiten zusammen. Clearingstelle ist im Hintergrund verfügbar.

*Rolle der Clearingstelle in dieser Phase:* Passive Unterstützung bei Bedarf (Fragen, Konflikte, Unklarheiten). Kein aktiver Eingriff in die Zusammenarbeit.

*Nicht Aufgabe der Clearingstelle:* Die eigentliche PPI-Arbeit durchführen oder überwachen.

---

**Phase 7 — Feedback**

Nach dem Engagement: strukturiertes Feedback von beiden Seiten.

*An Forschende:*
- War der Beitrag wertvoll für das Projekt?
- Wurde der Input der Mitwirkenden tatsächlich genutzt?
- Würden Sie PPI-Mitwirkende wieder einladen?
- Was hat gut funktioniert / was würden Sie anders machen?

*An PPI-Mitwirkende:*
- Wurden Sie gut auf das Engagement vorbereitet?
- Hatten Sie das Gefühl, wirklich gehört zu werden?
- Haben Sie erfahren, was mit Ihrem Beitrag geschehen ist?
- Würden Sie sich wieder engagieren?

*Warum dieser Schritt nicht optional ist:* Rückfluss an Mitwirkende ist einer der drei wichtigsten Faktoren für langfristige Aktivität (neben Wirkungserfahrung und Gemeinschaft). Ohne Feedback verliert die Clearingstelle Mitwirkende nach dem ersten Engagement.

---

### 8.3 Wo braucht es zwingend Menschen?

| Phase | Mensch zwingend | Technologie möglich |
|---|---|---|
| 1. Bedarfsklärung | Ja | Nein |
| 2. Anfrage-Formular | Nein | Ja |
| 3. Anfrage-Prüfung | Ja | Nein |
| 4. Vermittlung | Ja | Unterstützend |
| 5. Kontakt | Ja (Begleitung) | Unterstützend |
| 6. Zusammenarbeit | Nein (Clearingstelle) | — |
| 7. Feedback | Nein | Ja |

4 von 7 Phasen erfordern zwingend menschliche Arbeit. Technologie unterstützt, ersetzt nicht.

---

## 9. Minimalmodell

### 9.1 Grundannahmen

```
Aktive PPI-Mitwirkende: 50–80 Personen
Verbundene Patientenorganisationen: 10–15
Projekte pro Jahr: 20–40
Koordinationsaufwand: 20–30 Stellenprozent
Technologiekosten: 0–50 CHF/Monat
Jahresbudget Phase 1: 70.000–130.000 CHF
```

### 9.2 Was das Minimalmodell leistet

- Strukturierte Vermittlung von 20–40 Projekten pro Jahr
- Kuratorisches Register mit validierten Profilen (Typ A, B-Kontakte, Typ C)
- Anfrage-Prüfung als Qualitätsfilter
- Feedback-System auf beiden Seiten
- 1–2 Netzwerkevents pro Jahr (Mitwirkende + Forschende)
- Einheitliche Taxonomie für Rollen und Beitragstypen
- Optional: PPI-Portfolio-Dokumentation für Mitwirkende

### 9.3 Was das Minimalmodell nicht leistet

- Automatisiertes Matching
- Öffentlich zugängliche Profile
- Mehrsprachige digitale Plattform
- Schulungsangebote
- Mehr als 40–50 Projekte pro Jahr

Diese Grenzen sind transparent zu kommunizieren.

### 9.4 Ressourcen für 20–30 Stellenprozent

| Aufgabe | Zeitbedarf/Monat |
|---|---|
| Anfragen prüfen und klären (3–5/Monat) | 6–10 Std. |
| Matching und Kontaktbegleitung | 4–6 Std. |
| Profil-Onboarding und -Pflege | 3–5 Std. |
| Feedback auswerten | 2–3 Std. |
| Netzwerkpflege (Patientenorganisationen, Netzwerkevents) | 4–6 Std. |
| Administration und Dokumentation | 2–3 Std. |
| **Total** | **21–33 Std./Monat** |

Das entspricht 20–30 Stellenprozent — realistisch, wenn die Koordinationsperson in eine bestehende Institution eingebettet ist.

### 9.5 Wachstumsschwellen

| Volumen | Modell | Voraussetzung |
|---|---|---|
| bis 40 Projekte/Jahr | Minimalmodell (20–30 Stp.) | Jetzt umsetzbar |
| 40–100 Projekte/Jahr | Erweitertes Clearinghaus (50–80 Stp.) | Nach 2–3 Jahren Betrieb |
| 100+ Projekte/Jahr | Leichte digitale Plattform | Nach 5+ Jahren, wenn Taxonomie stabil |

---

## 10. Governance

### 10.1 Trägerschaft

**Grundsatz:** Keine neue Organisation gründen. Die Clearingstelle wird in eine bestehende Institution eingebettet.

**Option A — Trägerschaft durch eine Patientenorganisation**  
Vorteil: Legitimation bei PPI-Mitwirkenden, Netzwerkzugang, Patientenperspektive im Betrieb verankert.  
Risiko: Wahrnehmung als thematisch einseitig (Krankheitsfokus der Trägerorganisation).

**Option B — Trägerschaft durch Dachorganisation / Verbund**  
2–3 grosse Schweizer Patientenorganisationen oder ein Dachverband (z.B. Ligue des patients, SAEZ-nahe Strukturen) teilen sich den Betrieb.  
Vorteil: Breite Legitimation, geringeres Einseitigkeitsrisiko.  
Risiko: Koordinationsaufwand.

**Option C — Einbettung in Forschungsinfrastruktur (SCTO, Universität)**  
Vorteil: Zugang zur Forschungsseite, Finanzierungsinfrastruktur.  
Risiko: Wahrnehmung als Forschungsdienstleistung; weniger Vertrauen auf PPI-Seite.

**Empfehlung:** Option A oder B. Die Clearingstelle muss auf der Patientenseite verankert sein, um Vertrauen auf dieser Seite zu verdienen. Forschungsinstitutionen als Kofinanziers und Netzwerkpartner, nicht als Träger.

### 10.2 Finanzierungsmodell Phase 1

| Quelle | Beitrag | Realisierbarkeit |
|---|---|---|
| SNF / Innosuisse (Infrastruktur) | 40.000–80.000 CHF/Jahr | Mittel |
| Träger-Organisation (Eigenleistung) | 20.000–30.000 CHF/Jahr | Hoch |
| Nutzungsbeitrag Forschungsinstitutionen | 10.000–20.000 CHF/Jahr | Niedrig anfänglich |
| **Total** | **70.000–130.000 CHF/Jahr** | Realistisch |

### 10.3 Qualitätssicherung — drei Mechanismen

1. **Anfrage-Prüfung:** Jede Anfrage wird geprüft, bevor Mitwirkende kontaktiert werden. Qualitätsfilter für die Clearingstelle.

2. **Feedback-System:** Standardisiertes Feedback nach jedem Engagement. Systematische Auswertung jährlich.

3. **Jährliches Netzwerk-Review:** Profile, Organisationskontakte und Engagement-Qualität werden einmal jährlich überprüft und aktualisiert.

### 10.4 Mehrsprachigkeit

Für eine nationale Schweizer Clearingstelle ist Mehrsprachigkeit keine Option, sondern Voraussetzung.

Phase 1-Minimum: Deutsch und Französisch (Koordinationsperson oder Team zweisprachig, oder zwei Koordinationspersonen).  
Phase 2: Inklusion Romandie-spezifischer Organisationskontakte.  
Phase 3: Italienisch (Tessin).

---

## 11. Datenschutz

### 11.1 Rechtlicher Rahmen

Das **neue Datenschutzgesetz (nDSG)** ist seit dem 1. September 2023 in Kraft. Für die Clearingstelle relevant:

**Besonders schützenswerte Personendaten** (Art. 5 lit. c nDSG): Gesundheitsdaten, genetische Daten, biometrische Daten. Auch abgeleitete oder offenkundige Gesundheitsinformationen fallen darunter.

**Datenprinzipien:** Verhältnismässigkeit (nur so viele Daten wie nötig), Zweckbindung, Richtigkeit, Datensicherheit.

**Datenschutz-Folgenabschätzung (DSFA):** Erforderlich bei voraussichtlich hohem Risiko. Für eine Clearingstelle mit kompetenzorientiertem Profil-Modell und ohne öffentliche Profile ist der DSFA-Aufwand erheblich geringer als für eine öffentliche Plattform.

Das **Humanforschungsgesetz (HFG)** ist zu prüfen, wenn die Clearingstelle selbst Daten über PPI-Engagement für Forschungszwecke auswertet. Juristischer Rat vor Go-live erforderlich.

### 11.2 Datenschutzmodell der Clearingstelle

**Grundprinzip:** Minimum an Daten, kein öffentlicher Zugang zu Profilen, Kontaktdaten nur mit expliziter Zustimmung.

**Was erhoben wird:**  
Beitragstypen, Perspektivtyp, Erfahrungsfelder (als Themenfelder, nicht Diagnosen), Sprachen, Verfügbarkeit, Entschädigungserwartung, Format-Präferenz. Intern gespeichert, nicht öffentlich.

**Was nicht erhoben wird:**  
Diagnosen, Medikamente, klinischer Verlauf, persönliche Krankengeschichte.

**Kontaktdaten:**  
Verschlüsselt gespeichert. Nie an Forschende weitergegeben ohne explizite Zustimmung der Mitwirkenden.

**Prozess der Kontaktfreigabe:**  
1. Mitwirkende erhalten anonymisierte Projektbeschreibung.  
2. Mitwirkende entscheiden über Interesse.  
3. Erst bei Interesse: Kontaktfreigabe für dieses spezifische Projekt.

**Recht auf Löschung:** Vollständige Datenlöschung auf Anfrage, jederzeit.

### 11.3 Datenschutz und Perspektivtyp

Der kompetenzorientierte Ansatz reduziert die Menge an Gesundheitsdaten — aber eliminiert sie nicht vollständig. Wer Typ A ist (gelebte Erfahrung einer Erkrankung) gibt implizit eine gesundheitsbezogene Information preis. Die Clearingstelle sollte:

- Erfahrungsbereiche nur auf Themenfeld-Ebene erfassen (z.B. "Onkologie", nicht "Brustkrebs, Stadium III")
- Klar kommunizieren, welche Daten zu welchem Zweck verarbeitet werden
- Mitwirkende über ihr Auskunfts- und Löschungsrecht informieren

---

## 12. Risiken

### 12.1 Kritische Risiken

**R1 — Keine gesicherte Trägerschaft (kritisch)**  
Ohne Träger kein Projekt. Priorität 1 vor jeder weiteren Entwicklung.  
*Mitigation:* Trägerschaftsfrage als Entscheid vor Projektbeginn fixieren.

**R2 — Minimalmodell bleibt dauerhaft minimal (hoch)**  
Wenn das System nie aus Phase 1 herauskommt, frustriert es Engagierte und verliert Legitimation.  
*Mitigation:* Klare Wachstumsmeilensteine mit messbaren Triggern (Projektvolumen, Profile) definieren.

**R3 — Schlüsselpersonenrisiko (hoch)**  
20–30 Stellenprozent in einer Person ist strukturell fragil.  
*Mitigation:* Dokumentierte Prozesse, Vertretungsregelung, Wissenstransfer als Qualitätsanforderung.

**R4 — Tokenismus-Reproduktion (mittel)**  
Die Clearingstelle kann Tokenismus nicht verhindern, wenn Forschende PPI nur als Pflichtübung betreiben.  
*Mitigation:* Anfrage-Prüfung mit Qualitätskriterien; Feedback der Mitwirkenden systematisch auswerten und bei Problemen eskalieren.

**R5 — Angebotsseite bleibt leer (hoch)**  
Eine Clearingstelle ohne ausreichend Mitwirkende ist nutzlos. Passive Plattform-Logik funktioniert nicht.  
*Mitigation:* Aktive Rekrutierungsstrategie über Patientenorganisationen, EUPATI-Netzwerk, Gesundheitsligen. Onboarding-Unterstützung für neue Mitwirkende.

**R6 — Mehrsprachigkeit nicht gelöst (hoch)**  
Eine nur deutschschweizerische Lösung ist keine nationale Lösung.  
*Mitigation:* Zweisprachigkeit (DE/FR) als Bedingung für Phase-1-Start, nicht als spätere Erweiterung.

### 12.2 Strukturelle Risiken des Clearinghaus-Modells

**Netzwerkverzerrung der Koordinatorin:**  
Die Clearingstelle reproduziert unwillkürlich die Netzwerke der Koordinationsperson. Dem begegnet nur eine systematische Breite der Organisations-Partnerschaften und explizite Diversitätsziele.

**Kapazitätsgrenze:**  
Bei über 40–50 Projekten pro Jahr übersteigt der Aufwand die Minimalbesetzung. Keine Automatisierung ohne stabile Taxonomie und Profilqualität.

---

## 13. Empfehlungen

### 13.1 Sofort (vor Projektbeginn)

1. **Trägerschaft entscheiden.** Ohne geklärte Trägerschaft kein weiterer Schritt. Sondierungsgespräche mit Dachverbänden und grossen Patientenorganisationen.

2. **Taxonomie mit Nutzerinnen und Nutzern entwickeln.** Perspektivtypen, Beitragstypen und Erfahrungsfelder in einem Workshop mit PPI-Mitwirkenden, Patientenorganisationen und Forschenden validieren. Keine finale Taxonomie am Schreibtisch.

3. **Juristischen Rat einholen.** nDSG-Compliance und HFG-Relevanz vor Go-live klären.

4. **Koordinationsperson definieren.** Zweisprachig (DE/FR), eingebettet in die Trägerorganisation, mit klaren 20–30 Stellenprozent.

### 13.2 Phase 1 (Monate 1–12): Pilotbetrieb

- Pre-MVP: Profil-Formulare (Word/PDF), manuelle Matching-Tabelle, E-Mail-Prozess. Keine eigene Software.
- Rekrutierungsziel: 30–50 Mitwirkende (Typ A und C), 8–12 verbundene Patientenorganisationen.
- Projektvolumen: 10–20 Projekte.
- Ergebnis: Taxonomie validiert, Prozesse erprobt, Feedback ausgewertet.

### 13.3 Phase 2 (Monate 13–36): Strukturierter Betrieb

- Einfache interne Datenbank (Airtable / Notion).
- Strukturiertes Online-Anfrage-Formular.
- Netzwerkveranstaltungen (1–2 pro Jahr).
- Erweiterung Romandie.
- Ergebnis: 50–80 Mitwirkende, 20–40 Projekte/Jahr, erste Qualitätsevaluation.

### 13.4 Phase 3 (ab Monat 37): Weiterentwicklung

- Evaluation: Hat das Modell funktioniert? Was muss angepasst werden?
- Entscheid: Leichte Web-Oberfläche wenn Volumen und Profilqualität es rechtfertigen.
- Internationalisierung: Verknüpfung mit europäischen PPI-Netzwerken (EUPATI, PFMD).

---

## 14. Kernfragen beantwortet

**1. Ist eine Clearingstelle fachlich geeigneter als eine Matching-Plattform?**  
Ja — für den Schweizer Kontext eindeutig. Eine Clearingstelle arbeitet mit den Stärken des Schweizer Systems: persönliche Netzwerke, Vertrauen, starke Patientenorganisationen. Eine Plattform setzt Marktgrössen und Taxonomiereife voraus, die in der Schweiz auf absehbare Zeit nicht erreicht werden.

**2. Welche Rolle spielen Patientenorganisationen tatsächlich?**  
Sie sind unverzichtbar für kollektive Vertretung (Typ B) und wertvolle Netzwerkpartner für den Zugang zu Typ-A-Mitwirkenden. Aber sie sind keine obligatorischen Intermediäre. Individuen registrieren sich direkt, ohne Organisationsmitgliedschaft. Das Matching beginnt mit dem Perspektivtyp, nicht mit der Organisation.

**3. Wie sieht das System aus Sicht der PPI-Mitwirkenden aus?**  
Sie erleben einen Dienst, der ihr Engagement auf eigene Bedingungen ermöglicht, sie vor ungeeigneten Anfragen schützt (Anfrage-Prüfung), ihnen Rückmeldung gibt (Feedback-System), sie in ein aktives Netzwerk einbindet und ihre Beiträge dokumentiert (PPI-Portfolio).

**4. Wie klein kann die Lösung sein und trotzdem funktionieren?**  
50–80 aktive Mitwirkende, 10–15 verbundene Organisationen, 20–40 Projekte pro Jahr, 20–30 Stellenprozent Koordination. Das ist die Minimaleinheit. Kleiner ist kein System mehr.

**5. Welche Infrastruktur ist wirklich notwendig?**  
Strukturiertes Profil-Register (intern, nicht öffentlich), Anfrage-Formular, Feedback-Formulare, E-Mail-Kommunikation, ein Netzwerk-Newsletter. Unter 100 CHF/Monat an Technologiekosten.

**6. Welche Elemente sind überdimensioniert?**  
Vollzeit-Koordination, automatisiertes Matching, öffentliche Profile, mehrsprachige digitale Plattform, komplexe Taxonomie-Governance, Security-Audits und API-Schnittstellen — alles für Phase 3 oder nie.

**7. Welches Betriebsmodell ist unter Schweizer Rahmenbedingungen realistisch?**  
20–30 Stellenprozent Koordination, eingebettet in eine bestehende Patientenorganisation oder einen Dachverband, finanziert durch SNF-Infrastrukturförderung plus Eigenleistung des Trägers, mit einfachster digitaler Unterstützung, ohne eigene Software-Entwicklung in Phase 1.

---

## 15. Quellennachweis

**Internationale PPI-Rahmenwerke**
- NIHR / INVOLVE (UK): UK Standards for Public Involvement — nihr.ac.uk
- NIHR Be Part of Research: 528.389 registrierte Freiwillige (Stand 2025) — bepartofresearch.nihr.ac.uk
- CIHR / SPOR: Patient Engagement Framework — cihr-irsc.gc.ca/e/48413.html
- PCORI: Engagement Rubric (2016) — pcori.org/sites/default/files/Engagement-Rubric.pdf
- EUPATI: Patient Expert Training Programme Guidelines 2023–2024 — learning.eupati.eu

**Wissenschaftliche Publikationen**
- Johnson et al. (2025): Understanding PPI Frameworks. Health Expectations. DOI: 10.1111/hex.70425
- BMC Medicine (2020): From tokenistic box ticking to valued team members. DOI: 10.1186/s12916-020-01544-7
- Røssvoll et al. (2023): PPI in health research from researchers' perspective. PMC10632614
- ResearchMatch: national registry to recruit volunteers. PubMed 22104055
- Exploring perceived barriers to public involvement. PMC4067891

**Plattformen**
- ResearchMatch — researchmatch.org
- Antidote — antidote.me
- NIHR Be Part of Research — bepartofresearch.nihr.ac.uk

**Schweizer Kontext**
- Swiss Personalized Health Network (SPHN), CHF 20,7 Mio. 2025–2028
- nDSG: in Kraft seit 1. September 2023 — sidd.swiss/einblicke/schweizer-datenschutzgesetz-leitfaden
- Besonders schützenswerte Personendaten — pwc.ch/de/insights/regulierung/besonders-schuetzenswerte-personendaten.html

**Qualitätshinweis**  
Alle Marktgrössenangaben für die Schweiz basieren auf Schätzungen aus öffentlichen Förderdaten und Analogieschlüssen. Keine gesicherten empirischen Erhebungen verfügbar. Eine Primärerhebung bei Forschungsinstitutionen und Patientenorganisationen ist für die Trägerschaftsphase empfohlen.

---

*Nationales PPI-Clearingstelle Schweiz | Fachkonzept V3 (integral) | 18. Juni 2026*  
*Dieses Dokument integriert und ersetzt V1, V2 und die Modellkorrektur Patientenorganisationen.*  
*Es ist als konsolidierte Arbeitsgrundlage für die Trägerschafts- und Pilotphase bestimmt.*
