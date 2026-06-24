# Fachkonzept V2
## Nationale PPI-Clearingstelle Schweiz

**Version:** 2.0  
**Datum:** 18. Juni 2026  
**Status:** Entwurf zur Diskussion  
**Grundlage:** Fachkonzept V1 (17. Juni 2026) + Reviewauftrag V2  

---

> **Leitfrage dieser Version**  
> Wie kann die Schweiz mit begrenzten Ressourcen eine wirksame PPI-Vermittlungsinfrastruktur aufbauen, ohne eine grosse Plattformorganisation schaffen zu müssen?

---

## Was hat sich gegenüber V1 geändert?

V1 war fachlich solide, aber dachte stellenweise zu gross. Es orientierte sich implizit an einem professionell finanzierten Infrastrukturmodell mit mehreren Mitarbeitenden, einem komplexen Matching-System und einer aufwändigen Taxonomie-Governance. Für die Schweizer Realität — kleiner Markt, begrenzte Mittel, starke Netzwerkorientierung — ist das der falsche Massstab.

V2 korrigiert vier grundlegende Haltungen:

**1. Vom Forscherprojekt zum PPI-Mitwirkenden-Dienst**  
V1 beschreibt den Nutzen für Forschende sehr detailliert. V2 beginnt mit der Frage: Was brauchen PPI-Mitwirkende? Was motiviert sie? Was hält sie aktiv?

**2. Von der Plattform zur Clearingstelle**  
V1 beschreibt eine digitale Matching-Plattform mit automatisierter Vermittlung. V2 bewertet drei Modelle und kommt zum Schluss, dass ein Clearinghaus-Modell mit leichter digitaler Unterstützung für den Schweizer Kontext angemessener ist.

**3. Von Patientenorganisationen als Gateway zu Patientenorganisationen als Träger**  
V1 behandelt Patientenorganisationen als Zulieferer von Mitwirkenden. V2 stellt sie ins Zentrum des Betriebsmodells.

**4. Von der professionellen Infrastruktur zum Minimalmodell**  
V1 entwirft eine skalierbare Plattform mit Vollzeit-Koordination. V2 entwickelt explizit das kleinstmögliche funktionierende System.

---

## Inhaltsverzeichnis

1. [Executive Summary](#1-executive-summary)
2. [Fachlicher Hintergrund](#2-fachlicher-hintergrund)
3. [PPI-Mitwirkende im Zentrum](#3-ppi-mitwirkende-im-zentrum)
4. [Marktgrösse Schweiz](#4-marktgrösse-schweiz)
5. [Modellentscheid: Clearingstelle, Plattform oder Hybrid](#5-modellentscheid-clearingstelle-plattform-oder-hybrid)
6. [Patientenorganisationen als primäre Akteure](#6-patientenorganisationen-als-primäre-akteure)
7. [Fachmodell](#7-fachmodell)
8. [Service Blueprint](#8-service-blueprint)
9. [Minimalmodell](#9-minimalmodell)
10. [Governance und Betrieb](#10-governance-und-betrieb)
11. [Datenschutz](#11-datenschutz)
12. [Risiken](#12-risiken)
13. [Beantwortung der Kernfragen](#13-beantwortung-der-kernfragen)
14. [Überdimensionierte Elemente aus V1](#14-überdimensionierte-elemente-aus-v1)

---

## 1. Executive Summary

### 1.1 Kernaussagen

**Die richtige Frage**  
Das Konzept stellte bisher die Frage: Wie bauen wir eine Matching-Plattform? Die richtige Frage lautet: Wie schafft die Schweiz einen wirksamen PPI-Vermittlungsdienst, der ohne grosse Organisation funktioniert?

**Das Modell**  
Eine nationale PPI-Clearingstelle ist geeigneter als eine Matching-Plattform. Der Unterschied ist nicht semantisch, sondern strukturell: Eine Clearingstelle vermittelt auf Basis menschlicher Einschätzung, baut Vertrauen durch persönliche Beziehungen auf und skaliert nicht durch Automatisierung, sondern durch Netzwerkwachstum. Für einen Markt mit 50–200 PPI-relevanten Projekten pro Jahr in der Schweiz ist das der richtige Ansatz.

**Die zentrale Erkenntnis**  
Patientenorganisationen sind nicht Zulieferer für die Clearingstelle. Sie sind das eigentliche Netzwerk. Eine Clearingstelle, die auf Patientenorganisationen aufsetzt statt neben ihnen zu operieren, hat von Anfang an Reichweite, Vertrauen und Struktur.

**Das Minimalmodell funktioniert**  
50–100 aktive PPI-Mitwirkende, wenige Dutzend Projekte pro Jahr, 20–30 Stellenprozent Koordination: Das reicht, um einen relevanten Beitrag zur PPI-Infrastruktur der Schweiz zu leisten — wenn die Qualität stimmt.

### 1.2 Wichtigste Änderungen gegenüber V1

| Thema | V1 | V2 |
|---|---|---|
| Kernmodell | Matching-Plattform | PPI-Clearingstelle mit digitaler Unterstützung |
| Perspektive | Forscherseitig | PPI-Mitwirkende im Zentrum |
| Patientenorganisationen | Gateway / Zulieferer | Primäre Akteure und potenzielle Träger |
| Markt | Grob eingeschätzt | Differenziert bewertet |
| Betriebsmodell | Vollzeit-Koordination | 20–30 Stellenprozent realistisch für Phase 1 |
| Technologie | MVP-Plattform | Leichte digitale Unterstützung (Liste/Datenbank) |
| Komplexität | Hoch (6 Matching-Dimensionen, Taxonomie-Governance) | Reduziert auf das Wirksame |

### 1.3 Empfehlungen (Zusammenfassung)

1. **Clearinghaus-Modell wählen**, nicht Matching-Plattform — zumindest für Phase 1.
2. **Patientenorganisationen als Träger prüfen**, nicht nur als Partner.
3. **Mit dem Minimalmodell starten** — 50 Personen, 20 Projekte, 20 Stellenprozent, kein eigenes System.
4. **Nutzenversprechen für PPI-Mitwirkende formulieren**, nicht nur für Forschende.
5. **Vertrauen durch persönliche Begleitung** aufbauen — Technologie kommt danach.

---

## 2. Fachlicher Hintergrund

### 2.1 PPI — Kurze Wiederholung der Grundlagen

Patient and Public Involvement (PPI) bezeichnet die aktive Mitgestaltung von Forschungsprozessen durch Personen mit gelebter Erfahrung — nicht als Forschungssubjekte, sondern als Partner. INVOLVE/NIHR definiert es als Forschung, die "with or by" statt "to, about or for" Menschen stattfindet.

Für V2 relevant ist eine zusätzliche Präzisierung: PPI ist kein einmaliges Ereignis. Es ist ein Beziehungsmodell. Forschende und PPI-Mitwirkende arbeiten idealerweise über Zeit zusammen, entwickeln gegenseitiges Verständnis und bauen aufeinander auf. Eine Infrastruktur, die PPI nur als Vermittlungsvorgang betrachtet, greift zu kurz.

### 2.2 Warum PPI scheitert — ergänzende Befunde

Tokenismus bleibt das grösste strukturelle Problem in PPI weltweit. Auch in gut ausgestatteten Systemen. Die Ursachen sind gut dokumentiert:

- Forschende laden PPI-Mitwirkende zu spät ein (wenn Entscheide bereits gefallen sind)
- Rollen sind unklar definiert
- PPI-Mitwirkende erhalten keinen systematischen Rückfluss (was wurde mit ihrem Input gemacht?)
- Aufwandsentschädigungen sind inkonsistent oder fehlen
- Kein Vertrauen zwischen den Parteien, weil keine Zeit war, es aufzubauen

Eine Vermittlungsinfrastruktur, die diese Probleme ignoriert und nur den Erstkontakt herstellt, löst das eigentliche Problem nicht.

---

## 3. PPI-Mitwirkende im Zentrum

### 3.1 Die Frage, die V1 nicht ausreichend gestellt hat

V1 fragt: Was brauchen Forschende? V2 beginnt mit der anderen Seite: Was brauchen PPI-Mitwirkende? Warum sollte eine Person mit Erkrankungserfahrung ihr Profil pflegen, auf Anfragen warten und Zeit investieren?

Ohne eine überzeugende Antwort auf diese Frage wird jedes System zu einer leeren Datenbank.

### 3.2 Was PPI-Mitwirkende brauchen

Auf Basis der internationalen PPI-Literatur (INVOLVE, PCORI, SPOR) und der Erfahrungen aus bestehenden Systemen (NIHR Be Part of Research, EUPATI-Netzwerk) lassen sich fünf Bedürfnisse identifizieren:

**Bedürfnis 1 — Sinn und Wirkung**  
PPI-Mitwirkende wollen wissen: Hat mein Beitrag etwas bewirkt? Systeme ohne Rückmeldung an Mitwirkende verlieren diese systematisch. SPOR Canada fordert explizit, dass Forschende PPI-Partner über die Verwendung ihrer Inputs informieren.

**Bedürfnis 2 — Würde und Respekt**  
Schlechte PPI-Erfahrungen entstehen häufig aus mangelndem Respekt: Experten-Sprache ohne Erklärung, Entscheide vor der Sitzung bereits getroffen, kein echtes Zuhören. Eine Clearingstelle, die Forschende in guter PPI-Praxis begleitet, schützt PPI-Mitwirkende vor diesen Erfahrungen.

**Bedürfnis 3 — Vorbereitung und Begleitung**  
Unerfahrene PPI-Mitwirkende fühlen sich ohne Vorbereitung überfordert. Erfahrene PPI-Mitwirkende wollen wissen, worauf sie sich einlassen. Beide brauchen Information vor dem Engagement und Begleitung während.

**Bedürfnis 4 — Netzwerk und Gemeinschaft**  
Viele PPI-Mitwirkende berichten, dass der Austausch mit anderen Mitwirkenden genauso wertvoll ist wie das Engagement selbst. Ein PPI-Netzwerk, das auch ausserhalb konkreter Projekte Austausch ermöglicht, schafft einen Grund zum Aktiv-Bleiben.

**Bedürfnis 5 — Kontrolle und Autonomie**  
PPI-Mitwirkende müssen selbst entscheiden können, wann, wie und mit wem sie sich engagieren. Systeme, die Profile öffentlich sichtbar machen oder Kontaktdaten weitergeben ohne explizite Zustimmung, widersprechen diesem Bedürfnis fundamental.

### 3.3 Nutzenversprechen für PPI-Mitwirkende (überarbeitet)

Das Nutzenversprechen muss für jede Gruppe spezifisch sein:

**Personen mit gelebter Erkrankungserfahrung (Patienten, Angehörige)**  
"Deine Erfahrung zählt in der Forschung. Wir helfen dir, Forschungsprojekte zu finden, bei denen dein Beitrag wirklich gefragt ist — auf deine eigenen Bedingungen."

**Erfahrene PPI-Mitwirkende**  
"Du hast bereits PPI-Beiträge geleistet. Wir machen deine Kompetenzen sichtbar, helfen dir, gezielt Projekte mit echtem Mitgestaltungspotenzial zu finden, und vernetzen dich mit anderen Mitwirkenden."

**EUPATI Fellows**  
"Deine Ausbildung verdient ein Netzwerk. Wir verbinden dich gezielt mit Projekten, die deine Expertise brauchen, und helfen dir, deinen PPI-Beitrag zu dokumentieren und weiterzuentwickeln."

**Patientenorganisations-Vertreterinnen und -Vertreter**  
"Wir stärken deine Stimme in der Forschung — nicht als Einzelperson, sondern als Vertreterin deiner Gemeinschaft. Wir unterstützen dich beim Navigieren von Forschungsanfragen und schützen dich vor Überforderung."

### 3.4 Warum Personen langfristig aktiv bleiben

Drei Faktoren halten PPI-Mitwirkende aktiv — und keiner davon ist technologisch:

1. **Erlebte Wirkung**: Sie sehen, dass ihr Beitrag Forschung verändert hat.
2. **Gemeinschaft**: Sie gehören zu einem Netzwerk von Gleichgesinnten.
3. **Wertschätzung**: Sie werden von Forschenden und vom System respektvoll behandelt.

Eine Clearingstelle, die diese drei Faktoren aktiv pflegt — durch Feedback-Kultur, Netzwerkevents und Qualitätssicherung bei Forschenden — ist wirksamer als jedes Matching-Algorithmus.

---

## 4. Marktgrösse Schweiz

### 4.1 Nachfrageseite — Wie viele PPI-relevante Projekte entstehen?

*Anmerkung: Präzise Zahlen für Schweizer PPI-spezifische Projekte liegen nicht vor. Die folgenden Schätzungen basieren auf öffentlich verfügbaren Daten zu Forschungsförderung und institutioneller Forschungskapazität sowie Analogieschlüssen aus vergleichbaren Systemen.*

**SNF-Förderung (klinisch und gesundheitsbezogen):**  
Der SNF fördert jährlich mehrere hundert Projekte im Bereich klinische Medizin, Grundlagenmedizin und Public Health. Nicht alle sind PPI-relevant. Ein konservativer Schätzwert: 5–15% der SNF-geförderten Gesundheitsprojekte könnten sinnvoll PPI einsetzen. Das ergibt eine Grössenordnung von 30–100 Projekten pro Jahr.

**Universitätsspitäler (Insel Bern, CHUV, USB, USZ, KSSG, EOC):**  
Die sechs universitären Spitäler generieren eine erhebliche klinische Forschungsaktivität. Schätzung: 20–50 Projekte pro Jahr mit echtem PPI-Potenzial.

**Industrie-gesponserte klinische Forschung:**  
Novartis, Roche, Johnson & Johnson und weitere Unternehmen führen Schweizer Studien durch. PPI-Anforderungen entstehen hier zunehmend durch regulatorische und HTA-seitige Vorgaben (EMA, Swissmedic). Schätzung: 10–30 Projekte mit PPI-Bedarf.

**Weitere Institutionen:**  
SAKK, Swiss TPH, Forschungsnetzwerke im Bereich seltene Erkrankungen, Innosuisse-Projekte mit Patientenbezug.

**Realistische Gesamtschätzung Nachfrage:**  
50–150 Projekte pro Jahr, die von einer PPI-Clearingstelle profitieren könnten. Davon sind realistisch 20–50 Projekte für eine Anfangsphase erreichbar.

### 4.2 Angebotsseite — Wie viele PPI-Mitwirkende gibt es?

**EUPATI Fellows in der Schweiz:**  
EUPATI hat über 7 Jahrgänge ca. 80 Fellows pro Jahr aus 33 Ländern ausgebildet. Der Schweizer Anteil bei einer Bevölkerung von 8,7 Mio. (vs. EU-Bevölkerung ~450 Mio.) liegt schätzungsweise bei 3–6 Fellows pro Jahrgang, also 20–45 aktive Schweizer EUPATI Fellows — mit erheblicher Unsicherheit, da keine Schweizer Statistik publiziert ist.

**Erfahrene PPI-Mitwirkende ohne EUPATI-Ausbildung:**  
Personen, die bereits an PPI-Aktivitäten in Schweizer Forschungsprojekten teilgenommen haben, ohne formale Ausbildung. Schätzung: 50–200 Personen, basierend auf der Grösse bestehender Netzwerke.

**Patientenorganisations-Vertreterinnen und -Vertreter:**  
Personen in Dachverbänden, Gesundheitsligen und Patientenorganisationen, die regelmässig Forschungskontakte pflegen. Schätzung: 50–150 aktive Personen.

**Realistische Gesamtschätzung Angebot:**  
100–400 potenziell erreichbare PPI-Mitwirkende. Davon sind 50–100 für eine Anfangsphase realistisch aktivierbar — wenn die Rekrutierung über Patientenorganisationen und bestehende Netzwerke erfolgt.

### 4.3 Fazit: Ist eine Plattform notwendig?

**Antwort:** Nein — für 50–100 Projekte und 50–100 Mitwirkende ist keine Plattform notwendig. Ein kuratorisches Netzwerk mit leichter digitaler Unterstützung reicht vollständig.

Die kritische Schwelle, ab der sich eine automatisierte Matching-Plattform rechnet, liegt deutlich höher — erfahrungsgemäss bei mehreren hundert Projekten und mehreren tausend Mitwirkenden. Das ist der Massstab von NIHR Be Part of Research (528.000 registrierte Personen), nicht der Schweizer Realität.

**Konsequenz:** Das Betriebsmodell muss für die tatsächliche Marktgrösse entworfen werden, nicht für eine hypothetische Skalierung.

---

## 5. Modellentscheid: Clearingstelle, Plattform oder Hybrid

### 5.1 Modell A — Matching-Plattform

**Beschreibung:**  
Eine digitale Plattform mit strukturierten Profilen auf beiden Seiten, algorithmisch oder regelbasiertem Matching, automatisierter Vorschlagsliste, Kontaktfreigabe durch PPI-Mitwirkende.

**Vorteile:**
- Transparent und skalierbar
- Forschende können selbstständig suchen
- Sichtbarkeit des Angebots

**Nachteile:**
- Erfordert kritische Masse an Profilen und Projekten
- Setzt eine stabile, validierte Taxonomie voraus
- Datenschutz aufwändig zu gestalten (besonders schützenswerte Personendaten)
- Profilqualität ohne Curation-Aufwand niedrig
- Vertrauen entsteht nicht durch Technologie
- Hohe Initialinvestition, bevor das System Wert liefert
- Aktivierungsquoten bei vergleichbaren Systemen unter 10%

**Eignung für Schweizer Kontext:** Niedrig für Phase 1. Möglicherweise relevant ab Phase 3.

---

### 5.2 Modell B — Clearingstelle

**Beschreibung:**  
Eine koordinierende Stelle (Person oder kleines Team), die Anfragen von Forschenden entgegennimmt, den Bedarf klärt, aus einem kuratierten Netzwerk von PPI-Mitwirkenden geeignete Kandidatinnen und Kandidaten vorschlägt, den Erstkontakt begleitet und Feedback einsammelt. Digitale Unterstützung: einfache Datenbank oder strukturierte Liste.

**Vorteile:**
- Funktioniert mit 20–50 aktiven Profilen
- Qualitätssicherung durch menschliche Einschätzung
- Vertrauensaufbau durch persönliche Beziehung
- Datenschutz einfach zu gestalten (keine öffentliche Profilsichtbarkeit)
- Niedrige Infrastrukturkosten
- Flexibel und lernend

**Nachteile:**
- Nicht skalierbar über Kapazität der Koordinationsstelle hinaus
- Abhängig von einer Schlüsselperson
- Wenig Transparenz für Aussenstehende (wer ist in diesem Netzwerk?)
- Kann Netzwerk-Verzerrungen der Koordinatorin reproduzieren

**Eignung für Schweizer Kontext:** Hoch. Das entspricht dem, was heute bereits informell über persönliche Netzwerke funktioniert — nur systematisiert.

---

### 5.3 Modell C — Hybrides Modell (Empfehlung)

**Beschreibung:**  
Eine Clearingstelle mit leichter digitaler Unterstützung. Die Vermittlung bleibt menschlich geleitet. Die digitale Komponente dient der Strukturierung, Transparenz und Entlastung der Koordination — nicht der Automatisierung.

```
FORSCHUNGSTEAM
     │
     │ Anfrage (strukturiertes Formular)
     ▼
CLEARINGSTELLE
     │
     ├── prüft Anfrage, klärt Bedarf
     │
     ├── durchsucht kuratorische Datenbank
     │   (strukturierte Profile, nicht öffentlich)
     │
     ├── schlägt 2–3 geeignete Personen vor
     │
     └── begleitet Kontaktaufnahme
          │
          ▼
     PPI-MITWIRKENDE
     (entscheiden über Teilnahme)
          │
          ▼
     ZUSAMMENARBEIT
          │
          ▼
     FEEDBACK (an beide Seiten und an Clearingstelle)
```

**Digitale Komponente (einfach halten):**
- Strukturierte Profil-Datenbank (Airtable, Notion oder ähnlich) — intern, nicht öffentlich
- Anfrage-Formular (Typeform, Google Forms oder ähnlich) — für Forschende
- E-Mail-basierte Kontaktfreigabe
- Einfaches Feedback-Formular nach Engagement

**Vorteile gegenüber reiner Clearingstelle:**
- Profile sind strukturiert und durchsuchbar (auch nach Urlaub der Koordinatorin)
- Transparenz nach innen
- Erweiterbar, wenn Volumen steigt

**Vorteile gegenüber reiner Plattform:**
- Kein komplexes System nötig
- Datenschutz einfach (keine öffentliche Sichtbarkeit)
- Vertrauen durch Begleitung

### 5.4 Vergleich nach Bewertungskriterien

| Kriterium | Plattform (A) | Clearingstelle (B) | Hybrid (C) |
|---|---|---|---|
| Qualität des Matchings | Abhängig von Datenlage | Hoch durch menschliche QS | Hoch |
| Vertrauensaufbau | Niedrig | Hoch | Hoch |
| Datenschutz | Aufwändig | Einfach | Einfach |
| Betriebskosten | Hoch | Niedrig | Niedrig–Mittel |
| Skalierbarkeit | Hoch | Niedrig | Mittel |
| Realisierbarkeit CH | Niedrig (Phase 1) | Hoch | Hoch |
| Eignung für 50–100 Profile | Ungeeignet | Geeignet | Geeignet |
| Eignung für 1.000+ Profile | Geeignet | Ungeeignet | Geeignet mit Ausbau |

**Empfehlung:** Modell C (Hybrid) für Phase 1 und 2. Modell A nur dann evaluieren, wenn das System nachweislich über 500 aktive Profile und 100+ Projekte pro Jahr wächst.

---

## 6. Patientenorganisationen als primäre Akteure

### 6.1 Was Patientenorganisationen heute bereits tun

Patientenorganisationen sind nicht passive Ressourcenhalter. Sie leisten heute informell bereits Kernfunktionen einer PPI-Clearingstelle:

- Sie kennen ihre Mitglieder und wissen, wer erfahren, engagiert und belastbar ist
- Sie erhalten regelmässig Anfragen von Forschenden (oft zu viele, oft unstrukturiert)
- Sie entscheiden faktisch, wen sie weiterempfehlen
- Sie geben PPI-Mitwirkenden Sicherheit und Rückhalt in der Forschungsbeziehung
- Sie bündeln Perspektiven und vertreten kollektive Interessen
- Sie haben Vertrauen ihrer Mitglieder

Das ist nicht "Gateway-Funktion". Das ist bereits Clearing — ohne formale Struktur, ohne Ressourcen, ohne Anerkennung.

### 6.2 Das revidierte Beziehungsmodell

V1 modellierte die Beziehung als:

```
Projekt ↔ Person
```

V2 modelliert sie korrekt als:

```
Projekt ↔ Organisation ↔ Person
```

**Was das bedeutet:**  
Ein Forschungsprojekt wendet sich nicht primär an Einzelpersonen. Es wendet sich an eine Patientenorganisation, die — auf Basis ihrer Kenntnis ihrer Mitglieder und des Projekts — entscheidet, wen sie vorschlägt oder ob sie kollektiv Stellung nimmt.

Diese Struktur ist nicht nur realistischer. Sie ist datenschutzfreundlicher, qualitätssichernder und vertrauensbildender. Die Patientenorganisation als Intermediär schützt Einzelpersonen vor ungeeigneten oder überfordernden Anfragen.

### 6.3 Rollen von Patientenorganisationen im neuen Modell

**Rolle 1 — Netzwerk und Reichweite**  
Patientenorganisationen haben direkten Zugang zu Mitgliedern. Sie sind die wirkungsvollste Rekrutierungsinfrastruktur für PPI-Mitwirkende — weit wirksamer als eine öffentliche Plattform.

**Rolle 2 — Vorselektion und Qualitätssicherung**  
Eine Patientenorganisation kennt ihre Mitglieder. Sie weiss, wer die Belastung eines Advisory Board tragen kann, wer für eine Fokusgruppe geeignet ist, wer besondere Unterstützung braucht. Diese Kenntnis ist wertvoll und nicht replizierbar durch Profilfelder.

**Rolle 3 — Schutz der Mitwirkenden**  
Eine Patientenorganisation als Intermediär schützt Einzelpersonen. Sie kann Anfragen ablehnen, die ungeeignet sind. Sie kann Bedingungen stellen. Sie kann Nachfragen stellen. Das ist ein Qualitäts- und Schutzmechanismus, den eine Plattform nicht bietet.

**Rolle 4 — Kollektive Stimme**  
Für bestimmte PPI-Formate (Policy-Konsultationen, HTA-Inputs, kollektive Interessenvertretung) sind Organisationen, nicht Einzelpersonen, die geeigneten Akteure.

**Rolle 5 — Trägerschaft**  
Patientenorganisationen oder ihre Dachverbände sind mögliche Träger der Clearingstelle. Sie haben Legitimität, Netzwerk und Vertrauen — die drei wichtigsten Zutaten.

### 6.4 Konsequenzen für das System

**Governance:**  
Die Clearingstelle wird nicht von Forschenden geführt. Sie ist in Patientenorganisationen verankert oder zumindest von ihnen gleichberechtigt mitgesteuert.

**Datenschutz:**  
Personendaten bleiben primär bei den Patientenorganisationen. Die Clearingstelle führt ein schlankes Register von Personen, die sich für direkte Anfragen geöffnet haben — alle anderen werden über Organisationen angefragt.

**Matching:**  
Das Matching wird zweistufig: Zuerst wird die geeignete Organisation identifiziert. Dann, innerhalb der Organisation, die geeigneten Personen. Die Clearingstelle führt die erste Stufe; die Organisation führt die zweite.

**Betriebsmodell:**  
Dezentralisierter Betrieb. Die Clearingstelle koordiniert; die Organisationen aktivieren. Das reduziert den operativen Aufwand der Clearingstelle erheblich.

---

## 7. Fachmodell

### 7.1 Akteure

Das revidierte Fachmodell kennt vier Akteure — nicht drei.

**Akteur 1 — PPI-Mitwirkende (Individuen)**  
Personen mit gelebter Erfahrung, PPI-Kompetenz oder Forschungswissen, die sich individuell für Engagements zur Verfügung stellen. Erscheinen im Clearingstellen-Register nach eigener Entscheidung.

**Akteur 2 — Patientenorganisationen**  
Organisierte Zusammenschlüsse, die ihre Mitglieder vertreten, Forschungsanfragen filtern und geeignete Personen vorschlagen. Eigenständige Akteure, nicht Ressourcenhalter.

**Akteur 3 — Forschungsprojekte**  
Teams, die PPI-Beiträge für konkrete Forschungsaufgaben suchen. Kunden des Dienstes — aber nicht die primäre Perspektive.

**Akteur 4 — Clearingstelle**  
Die koordinierende Instanz. Sie vermittelt, begleitet, sichert Qualität und pflegt das Netzwerk. Kein eigener Akteur in der Forschung.

### 7.2 PPI-Rollen (vereinfacht)

V1 hatte vier Rollen. V2 vereinfacht auf drei — operativ handhabbar, fachlich ausreichend differenziert:

**Stufe 1 — Erfahrungsträger/in**  
Gelebte Erfahrung als Patient, Angehörige/r, betreuende Person. Keine PPI-Vorerfahrung erforderlich. Geeignet für: Fokusgruppen, Materialienreview, Patienteninformation.

**Stufe 2 — PPI-Mitwirkende/r**  
Erfahrene Person mit nachgewiesenen PPI-Beiträgen. Vertraut mit Forschungskontext. Geeignet für: Projektbegleitung, Protokoll-Review, Workshops, wiederkehrende Beratungsrollen.

**Stufe 3 — PPI-Expertin / PPI-Experte**  
Ausgebildete Kompetenz (EUPATI Fellow oder äquivalent) und/oder langjährige PPI-Erfahrung. Geeignet für: Advisory Boards, Steering Committees, regulatorische Konsultationen, HTA-Inputs.

*Patientenorganisations-Vertreterinnen und -Vertreter sind keine eigene Stufe, sondern können auf jeder Stufe stehen — mit dem zusätzlichen Merkmal der kollektiven Vertretung.*

### 7.3 Matching-Dimensionen (auf das Wesentliche reduziert)

V1 definierte 6 Dimensionen. V2 reduziert auf 4 operative Kernfragen:

1. **Was soll die Person tun?** (Beitragstyp: Fokusgruppe / Review / Advisory / Steering)
2. **Welche Perspektive wird gesucht?** (Patient / Angehörige / Patientenvertreter / Experte)
3. **In welchem Themenbereich?** (Breit: Onkologie / Neurologie / seltene Erkrankungen / psychische Gesundheit / generisch)
4. **Was sind die Rahmenbedingungen?** (Sprache / Online oder Präsenz / Zeitaufwand)

Die Forschungsphase (aus V1) bleibt relevant, wird aber nicht als eigenes Pflichtfeld erhoben. Sie ergibt sich aus dem Beitragstyp.

---

## 8. Service Blueprint

### 8.1 Grundprinzip

Die Clearingstelle ist ein Dienst — kein System. Der Wert entsteht nicht in der Technologie, sondern in den menschlichen Schritten. Der Blueprint macht sichtbar, wo welche Arbeit geleistet wird.

### 8.2 Service-Phasen

```
PHASE 1 — BEDARF ENTSTEHT
────────────────────────────────────────────
Forschungsteam erkennt PPI-Bedarf.
Oft unklar: welche Rolle, welcher Umfang,
welcher Zeitpunkt.

→ Wo entsteht Wert? Clearingstelle hilft,
  den Bedarf zu präzisieren.
→ Braucht es Technologie? Nein. Braucht es
  menschliche Beratung? Ja.

─────────────────────────────────────────────

PHASE 2 — ANFRAGE
────────────────────────────────────────────
Forschungsteam füllt strukturiertes
Anfrage-Formular aus.

Pflichtangaben:
- Beitragstyp (was soll die Person tun?)
- Zeitaufwand
- Forschungskontext (kurze Beschreibung)
- Ressourcen für PPI (Zeit, Entschädigung)
- Sprachanforderungen

→ Wo entsteht Wert? Strukturierung erzwingt
  Klarheit beim Forschungsteam.
→ Kann digitalisiert werden: Ja. Einfaches
  Online-Formular reicht.

─────────────────────────────────────────────

PHASE 3 — KLÄRUNG
────────────────────────────────────────────
Clearingstelle prüft die Anfrage.
- Ist die Anfrage PPI-geeignet?
- Ist der Aufwand für Mitwirkende realistisch?
- Ist eine Entschädigung vorgesehen?
- In welchem Stadium ist das Projekt?

Bei Bedarf: Rückfragen an Forschende.

→ Wo entsteht Wert? Qualitätssicherung
  schützt PPI-Mitwirkende vor ungeeigneten
  Anfragen.
→ Braucht es Technologie? Nein. Menschliche
  Einschätzung.

─────────────────────────────────────────────

PHASE 4 — VERMITTLUNG
────────────────────────────────────────────
Clearingstelle identifiziert geeignete
Personen oder Organisationen.

Option A: Direktvermittlung
Clearingstelle fragt individuell registrierte
PPI-Mitwirkende an (mit Zustimmungsmodell).

Option B: Organisationsvermittlung
Clearingstelle wendet sich an geeignete
Patientenorganisation. Organisation schlägt
Personen vor.

→ Wo entsteht Wert? In der Einschätzung,
  wer geeignet ist — nicht im Algorithmus.
→ Braucht es Technologie? Interne
  Profildatenbank erleichtert Suche.

─────────────────────────────────────────────

PHASE 5 — KONTAKT
────────────────────────────────────────────
PPI-Mitwirkende erhalten Information über
das Projekt und entscheiden selbst, ob sie
Kontakt freigeben.

Clearingstelle begleitet erste Kontaktaufnahme.

→ Wo entsteht Wert? Schutz der Autonomie
  der Mitwirkenden.
→ Braucht es Technologie? E-Mail reicht.

─────────────────────────────────────────────

PHASE 6 — ZUSAMMENARBEIT
────────────────────────────────────────────
Forschungsteam und PPI-Mitwirkende arbeiten
zusammen. Clearingstelle ist im Hintergrund
verfügbar (bei Fragen, Konflikten).

→ Wo entsteht Wert? Im eigentlichen PPI-
  Prozess — ausserhalb der Clearingstelle.
→ Braucht es Technologie? Nein.

─────────────────────────────────────────────

PHASE 7 — FEEDBACK
────────────────────────────────────────────
Nach Engagement: strukturiertes Feedback
von beiden Seiten.

Fragen an Forschende:
- War der Beitrag wertvoll?
- Wurde der Input tatsächlich genutzt?
- Würden Sie wieder PPI-Mitwirkende einladen?

Fragen an PPI-Mitwirkende:
- Wurden Sie gut vorbereitet?
- Hatten Sie das Gefühl, gehört zu werden?
- Würden Sie sich wieder engagieren?

→ Wo entsteht Wert? Im Lernen des Systems
  und im Rückfluss an Mitwirkende.
→ Kann digitalisiert werden? Ja. Einfaches
  Formular.
```

### 8.3 Wo braucht es zwingend Menschen?

| Schritt | Mensch zwingend? | Technologie möglich? |
|---|---|---|
| Bedarfsklärung | Ja | Nein |
| Anfrage-Formular | Nein | Ja |
| Anfrage-Prüfung | Ja | Nein |
| Profil-Suche | Teilweise | Intern ja |
| Kontaktaufnahme | Ja | Begleitung |
| Zusammenarbeit | Nein (Clearingstelle) | — |
| Feedback | Nein | Ja |

**Fazit:** 4 von 7 Schritten erfordern zwingend menschliche Arbeit. Der Rest ist digitale Unterstützung, keine Automatisierung.

---

## 9. Minimalmodell

### 9.1 Grundannahmen

```
Aktive PPI-Mitwirkende: 50–80 Personen
Verbundene Patientenorganisationen: 10–15
Projekte pro Jahr: 20–40
Koordinationsaufwand: 20–30 Stellenprozent
Eigenes IT-System: keines
Budget Phase 1: 50.000–100.000 CHF/Jahr
```

### 9.2 Was das Minimalmodell leisten kann

**Leistbar:**
- Strukturierte Vermittlung von 20–40 Projekten pro Jahr
- Kuratorisches Register von 50–80 Mitwirkenden mit validierten Profilen
- Qualitätssicherung durch Anfrage-Prüfung und Feedback
- Netzwerkpflege über Patientenorganisationen (1–2 Events pro Jahr)
- Einheitliche Taxonomie für Rollen und Beitragstypen
- Dokumentation von PPI-Engagements für Mitwirkende (PPI-Portfolio)

**Nicht leistbar:**
- Automatisiertes Matching
- Öffentlich sichtbare Profile
- Mehrsprachige digitale Plattform
- Eigenständige Öffentlichkeitsarbeit
- Voluminöse Schulungsangebote

### 9.3 Werkzeuge für das Minimalmodell

| Funktion | Werkzeug | Kosten |
|---|---|---|
| Profil-Datenbank | Airtable Free / Notion | 0–20 CHF/Mt. |
| Anfrage-Formular | Typeform / Tally | 0–25 CHF/Mt. |
| Kommunikation | E-Mail (bestehend) | 0 |
| Dokumentenaustausch | Google Drive / iCloud | 0 |
| Feedback | Typeform / Google Forms | 0 |
| Newsletter/Netzwerk | Mailchimp (bis 500 Kontakte) | 0 |

**Gesamtkosten Technologie Phase 1: ~0–50 CHF/Monat**  
Die Hauptkosten sind Personalkosten der Koordinationsstelle — nicht IT.

### 9.4 Betrieb mit 20–30 Stellenprozent

**Was ist realistisch in 20–30 Stellenprozent?**

| Aufgabe | Zeitbedarf/Monat |
|---|---|
| Anfragen entgegennehmen und prüfen (3–5 Anfragen/Mt.) | 6–10 Stunden |
| Matching durchführen | 4–6 Stunden |
| Profil-Pflege und Onboarding neuer Mitwirkender | 3–5 Stunden |
| Feedback auswerten | 2–3 Stunden |
| Netzwerkpflege (E-Mails, Gespräche mit Patientenorganisationen) | 4–6 Stunden |
| Administration, Dokumentation | 2–3 Stunden |
| **Total** | **21–33 Stunden/Monat** |

Das entspricht 20–30 Stellenprozent — realistisch, wenn die Person eingebettet in eine bestehende Institution ist (Patientenorganisation, SCTO, Universität).

### 9.5 Was das Minimalmodell nicht löst

Das Minimalmodell erzeugt einen relevanten Nutzen — aber es hat strukturelle Grenzen:

- **Sprachregionen**: Ohne gezielten Aufbau in der Romandie und im Tessin bleibt die Reichweite primär deutschschweizerisch.
- **Schlüsselpersonenrisiko**: 20–30 Stellenprozent in einer Person ist ein Risiko. Ausfall oder Weggang gefährdet das System.
- **Wachstumsgrenze**: Mehr als 40–50 Projekte pro Jahr überlasten das Minimalmodell.

Diese Grenzen sind akzeptabel für eine Anfangsphase. Sie müssen transparent kommuniziert werden.

---

## 10. Governance und Betrieb

### 10.1 Trägerschaftsoptionen — neu bewertet

V1 diskutierte drei Trägerschaftsmodelle gleichwertig. V2 bewertet sie für den Schweizer Kontext:

**Option A — Bestehende Patientenorganisation als Träger**  
Geeignet, wenn eine grosse, gut aufgestellte Organisation (z.B. Krebsliga Schweiz, Pro Infirmis, eine Dachorganisation) die Funktion intern verankern kann. Vorteil: Keine neue Organisation nötig. Nachteil: Potenzielle Wahrnehmung als thematisch einseitig.

**Option B — Kooperationsmodell mehrerer Patientenorganisationen**  
2–4 grosse Schweizer Patientenorganisationen teilen sich den Betrieb. Rotationsprinzip oder klare Aufgabenteilung. Vorteil: Breite Legitimation. Nachteil: Koordinationsaufwand.

**Option C — Verankerung bei einer Forschungsinfrastruktur (SCTO, SNF)**  
Vorteil: Zugang zur Forschungsseite, Finanzierungsinfrastruktur. Nachteil: Wahrnehmungsproblem — wird als Forschungsdienstleistung wahrgenommen, nicht als PPI-Dienst.

**Empfehlung für Phase 1:** Option A oder B — Patientenorganisation als Träger. Forschungsinfrastruktur als Kofinanzier und Netzwerkpartner, nicht als Träger.

### 10.2 Finanzierungsmodell

Für eine Anfangsphase (3–5 Jahre) realistisch:

| Quelle | Beitrag | Wahrscheinlichkeit |
|---|---|---|
| SNF/Innosuisse (Infrastrukturförderung) | 40.000–80.000 CHF/Jahr | Mittel |
| Träger-Patientenorganisation (Eigenleistung) | 20.000–30.000 CHF/Jahr | Hoch |
| Forschungsinstitutionen (Nutzungsbeitrag) | 10.000–20.000 CHF/Jahr | Niedrig initial |
| Kantone / Gesundheitsdirektionen | 10.000–20.000 CHF/Jahr | Niedrig initial |

**Total realistisch für Phase 1: 70.000–130.000 CHF/Jahr**  
Das deckt: 20–30 Stellenprozent Koordination + Technologie + Netzwerkevents.

### 10.3 Qualitätssicherung (vereinfacht)

V1 hatte ein komplexes QS-Modell. V2 vereinfacht auf drei Kernmechanismen:

1. **Anfrage-Prüfung**: Jede Anfrage wird durch die Clearingstelle geprüft, bevor Mitwirkende kontaktiert werden.
2. **Feedback nach Engagement**: Standardisiertes Feedback von beiden Seiten nach jedem Engagement.
3. **Jährliches Netzwerk-Review**: Einmal jährlich werden alle Profile und Organisationskontakte aktualisiert und die Qualität der Engagements ausgewertet.

---

## 11. Datenschutz

### 11.1 Vereinfachtes Datenschutzmodell für Clearingstelle

Das Clearingstellen-Modell ist datenschutzrechtlich einfacher als eine öffentliche Matching-Plattform:

- **Keine öffentlichen Profile**: Personendaten bleiben intern in der Clearingstelle.
- **Zweistufiges Modell**: Für den grössten Teil der Anfragen werden zuerst Organisationen angefragt (keine Personendaten weitergegeben). Nur bei direkter Anfrage an Einzelpersonen: explizite Einwilligung zur Kontaktfreigabe.
- **Minimale Datenhaltung**: Die Profil-Datenbank enthält keine Diagnosen, keine klinischen Daten. Nur: Beitragstypen, Erfahrungsbereiche (als Themenfelder), Sprachen, Verfügbarkeit, Kontaktdaten (verschlüsselt).
- **Recht auf Löschung**: Sofort und vollständig auf Anfrage.

**nDSG-Relevanz:**  
Auch bei kompetenzorientiertem Ansatz verarbeitet die Clearingstelle Daten, die Gesundheitsinformationen implizieren. Eine Datenschutz-Folgenabschätzung ist erforderlich. Ein auf nDSG spezialisierter Jurist sollte das Modell vor Go-live prüfen.

**Vereinfachung gegenüber V1:**  
V1 behandelte Datenschutz detailliert aber für eine grössere Plattform. Für das Clearingstellen-Modell gilt: weniger Daten, weniger Risiken, einfachere Compliance-Anforderungen.

---

## 12. Risiken

### 12.1 Neue Risiken (nicht in V1)

**Risiko N1 — Clearingstelle wird zur informellen Netzwerkveranstaltung (MITTEL)**  
Ohne formale Strukturen und Mindeststandards degeneriert das System zu einem informellen Netzwerk — mit denselben Problemen wie heute (Netzwerkverzerrung, fehlende Diversität).  
*Mitigation: Strukturiertes Anfrage-Formular, dokumentiertes Matching, Feedback-Pflicht*

**Risiko N2 — Patientenorganisationen werden überlastet (MITTEL)**  
Wenn Clearingstelle-Anfragen an Organisationen kanalisiert werden, ohne ihre Kapazität zu berücksichtigen, werden grosse, bekannte Organisationen unverhältnismässig häufig kontaktiert.  
*Mitigation: Klare Limits pro Organisation; Förderung weniger bekannter Organisationen*

**Risiko N3 — Minimalmodell bleibt dauerhaft minimal (HOCH)**  
Wenn das Minimalmodell nie aus der Anfangsphase herauskommt, fehlt die langfristige Entwicklungsperspektive. Das frustriert Engagierte und gefährdet die Nachhaltigkeit.  
*Mitigation: Klare Meilensteine für die Weiterentwicklung von Phase 1 zu Phase 2*

### 12.2 Risiken aus V1 (bestätigt)

- **Schlüsselpersonenrisiko** (neu: besonders kritisch im Minimalmodell)
- **Mehrsprachigkeit** (noch nicht gelöst)
- **Nachhaltige Finanzierung** (kritischstes Risiko)
- **Tokenismus-Reproduktion** (bleibt strukturell)

---

## 13. Beantwortung der Kernfragen

**1. Ist eine Clearingstelle fachlich geeigneter als eine Matching-Plattform?**  
Ja — für den Schweizer Kontext und die absehbare Marktgrösse eindeutig. Eine Clearingstelle arbeitet mit dem, was in der Schweiz vorhanden ist: Netzwerke, Vertrauen, Patientenorganisationen. Eine Plattform arbeitet gegen die Realität: zu kleiner Markt, zu hohe Infrastrukturkosten, zu langes Anlaufen bis zur kritischen Masse.

**2. Welche Rolle spielen Patientenorganisationen tatsächlich?**  
Sie sind das eigentliche Netzwerk. Ohne sie gibt es keine Clearingstelle, sondern nur eine leere Datenbank. Sie übernehmen heute bereits informell Clearing-Funktionen, ohne Anerkennung und ohne Ressourcen. Das System muss auf ihnen aufbauen, nicht neben ihnen existieren.

**3. Wie sieht das System aus Sicht der PPI-Mitwirkenden aus?**  
Sie erfahren einen Dienst, der: ihr Engagement auf ihre eigenen Bedingungen ermöglicht, sie vor ungeeigneten Anfragen schützt, ihnen Rückmeldung gibt, was mit ihrem Beitrag geschehen ist, sie in ein Netzwerk einbindet, das über einzelne Projekte hinaus Bestand hat.

**4. Wie klein kann die Lösung sein und trotzdem funktionieren?**  
50–80 aktive Mitwirkende, 10–15 verbundene Organisationen, 20–40 Projekte pro Jahr, 20–30 Stellenprozent Koordination. Das ist die Minimaleinheit. Kleiner als das ist kein System mehr, sondern ein einzelnes informelles Netzwerk.

**5. Welche Infrastruktur ist wirklich notwendig?**  
Strukturiertes Profil-Register (intern, nicht öffentlich), Anfrage-Formular, Feedback-Formular, E-Mail-Kommunikation. Gesamtkosten Technologie: unter 100 CHF/Monat.

**6. Welche Elemente des bisherigen Konzepts sind überdimensioniert?**  
Siehe Abschnitt 14.

**7. Welches Betriebsmodell ist unter Schweizer Rahmenbedingungen realistisch?**  
20–30 Stellenprozent Koordination, eingebettet in eine bestehende Organisation (Patientenorganisation oder Forschungsinfrastruktur), mit Technologie-Kosten unter 100 CHF/Monat, finanziert durch SNF-Infrastrukturförderung + Eigenleistung des Trägers. Keine eigene Organisation aufbauen.

---

## 14. Überdimensionierte Elemente aus V1

Folgende Elemente aus V1 sind für Phase 1 überdimensioniert und sollten gestrichen oder auf spätere Phasen verschoben werden:

| Element aus V1 | Problem | V2-Empfehlung |
|---|---|---|
| Vollzeit-Koordinationsstelle | Nicht finanzierbar in Phase 1 | 20–30 Stellenprozent, eingebettet |
| 6 Matching-Dimensionen | Zu komplex für manuelle Vermittlung | 4 operative Fragen |
| Automatisiertes Matching (Phase 2) | Zu früh für Schweizer Markt | Erst ab 500+ Profilen evaluieren |
| Komplexe Taxonomie-Governance | Bindet Ressourcen ohne Mehrwert in Phase 1 | Einfache, lebende Kategorien |
| Multistakeholder-Trägergremium mit Eskalationspfaden | Governance-Komplexität zu hoch | Einfache Kooperation 2–3 Organisationen |
| Mehrsprachige digitale Plattform | Technisch und finanziell zu aufwändig für Start | Koordinationsstelle mehrsprachig besetzen; Plattform später |
| DSFA als Vorbedingung | Richtig in der Sache, aber: DSFA für einfache Datenbank viel weniger komplex | Juristische Prüfung ja, DSFA-Komplexität dem Modell anpassen |
| Security-Audits, API-Schnittstellen | Phase 3-Überlegungen | Streichen für Phase 1 |
| PPI-Portfolio-Dokumentation für Mitwirkende | Gute Idee, aber Mehraufwand für Koordination | Optional, nicht verpflichtend |

---

*Fachkonzept V2 | Nationale PPI-Clearingstelle Schweiz | Stand: 18. Juni 2026*  
*Dieses Konzept ersetzt V1 nicht — es entwickelt es weiter. V1 bleibt als fachlicher Hintergrundtext gültig, insbesondere für die internationale Kontextualisierung (Kapitel 2, 4) und die Datenschutzanalyse (Kapitel 9). V2 fokussiert auf das Betriebsmodell, das Minimalmodell und die Rolle von Patientenorganisationen.*
