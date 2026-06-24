# Fachkonzept V1
## Nationale PPI-Matching-Plattform Schweiz

**Version:** 1.0  
**Datum:** 17. Juni 2026  
**Status:** Entwurf zur Diskussion  
**Erstellt durch:** Senior Business Analyst / PPI-Fachexperte / Informationsarchitekt / Solution Architect  

---

> **Hinweis zur Methodik**  
> Dieses Konzept wurde auf Basis der beigefügten Arbeitszusammenfassung und einer vertieften Recherche zu internationalen PPI-Plattformen, Rahmenwerken und Evidenz erstellt. Zwischen Fakten, Schlussfolgerungen und Empfehlungen wird konsequent unterschieden. Quellen werden benannt. Annahmen werden kritisch geprüft.

---

## Inhaltsverzeichnis

1. [Executive Summary](#1-executive-summary)
2. [Fachlicher Hintergrund](#2-fachlicher-hintergrund)
3. [Problemdefinition](#3-problemdefinition)
4. [Analyse bestehender Ansätze](#4-analyse-bestehender-ansätze)
5. [Zielbild](#5-zielbild)
6. [Fachmodell](#6-fachmodell)
7. [Matching-Modell](#7-matching-modell)
8. [Governance](#8-governance)
9. [Datenschutz](#9-datenschutz)
10. [Technische Implikationen](#10-technische-implikationen)
11. [Risiken](#11-risiken)
12. [Empfehlungen](#12-empfehlungen)
13. [Beantwortung der Kernfragen](#13-beantwortung-der-kernfragen)
14. [Kritische Prüfung der Arbeitshypothesen](#14-kritische-prüfung-der-arbeitshypothesen)
15. [Quellennachweis](#15-quellennachweis)

---

## 1. Executive Summary

### 1.1 Kernaussagen

Die Grundidee einer nationalen PPI-Matching-Plattform für die Schweiz ist **fachlich tragfähig**, aber in ihrer bisherigen Formulierung an mehreren Punkten unvollständig und stellenweise unscharf.

Drei Erkenntnisse sind für das Gesamturteil entscheidend:

**Erstens: Die Arbeitszusammenfassung konfundiert zwei unterschiedliche Aktivitäten.** Klinische Forschung kennt zwei fundamental verschiedene Formen der Personenbeteiligung: die **Teilnahme als Forschungssubjekt** (Probandinnen und Probanden in klinischen Studien) und die **Beteiligung als Forschungspartner** (PPI-Mitwirkende, die Forschungsprozesse mitgestalten). Die meisten bestehenden Matching-Plattformen — darunter NIHR Be Part of Research, ResearchMatch und Antidote — adressieren primär das erstgenannte Modell. Eine Plattform, die PPI-Mitwirkende für Beratungsrollen, Review-Aufgaben, Advisory Boards und Governance-Funktionen vermittelt, existiert auf nationaler Ebene so gut wie nirgends. Darin liegt der genuine Innovationsgehalt des Vorhabens, aber auch sein spezifisches Risiko.

**Zweitens: Die technische Umsetzung ist das kleinste Problem.** Internationale Erfahrungen aus vergleichbaren Systemen belegen einheitlich: Governance-Probleme, Taxonomie-Unsicherheiten, unvollständige Profile, mangelnde Nutzeraktivität und fehlende Qualitätssicherungsprozesse sind die eigentlichen Herausforderungen. Die NIHR Be Part of Research hat 528.000 registrierte Personen, aber nur rund 50.000 haben tatsächlich an Forschung teilgenommen — eine Aktivierungsquote von unter 10 Prozent. Ohne systematische Datenpflege und klare Governance wird eine Schweizer Plattform dasselbe Problem haben.

**Drittens: Der Schweizer Kontext stellt spezifische Anforderungen.** Die Schweiz ist ein kleines, mehrsprachiges Land mit einer vergleichsweise kleinen Forschungsgemeinschaft. Der Markt für ausgebildete PPI-Mitwirkende ist begrenzt. Das revidierte Datenschutzgesetz (nDSG, in Kraft seit 1. September 2023) stellt hohe Anforderungen an die Verarbeitung von Gesundheitsdaten. Eine nationale Plattform muss diese Realitäten von Anfang an einplanen.

### 1.2 Wichtigste Erkenntnisse

| Thema | Befund | Bewertung |
|---|---|---|
| Grundidee | Tragfähig, echter Bedarf | Bestätigt |
| Marktgrösse Schweiz | Klein, Nischenmarkt | Unterschätzt |
| Bestehende Plattformen | Fokus auf Teilnahme, nicht PPI | Wichtige Lücke |
| Hypothese 1 (Perspektiven statt Personen) | Teilweise korrekt, zu vereinfacht | Angepasst |
| Hypothese 2 (vier Matching-Dimensionen) | Unvollständig, wichtige Dimensionen fehlen | Ergänzt |
| Hypothese 3 (Datenschutz) | Korrekt in der Richtung, zu vereinfacht | Nuanciert |
| Hypothese 4 (Governance > Technik) | Stark belegt | Bestätigt |
| MVP-Tauglichkeit | Ja, mit Einschränkungen | Empfohlen |

### 1.3 Empfehlungen (Zusammenfassung)

1. **Schärfung der Problemdefinition**: Die Plattform muss klar als PPI-Beratungs- und Beteiligungsplattform (nicht als Studienrekrutierungs-Plattform) positioniert werden.
2. **Kleine, kuratierte Lösung zuerst**: Ein MVP mit manuell gepflegten Profilen und direkter Vermittlung durch eine Koordinationsstelle — bevor Automatisierung skaliert.
3. **Governance vor Technik**: Trägerschaftsfrage und Taxonomie-Entscheide müssen vor der technischen Entwicklung getroffen werden.
4. **Mehrsprachigkeit einplanen**: Deutsch, Französisch, Italienisch sind für eine nationale Schweizer Lösung zwingend.
5. **Datenschutzkonzept von Beginn**: nDSG-Konformität und Datenschutz-Folgenabschätzung müssen bereits in der Konzeptphase adressiert werden.

---

## 2. Fachlicher Hintergrund

### 2.1 Was ist Patient and Public Involvement (PPI)?

Patient and Public Involvement (PPI) bezeichnet die aktive Einbeziehung von Patientinnen und Patienten, Angehörigen und der Öffentlichkeit in Forschungsprozesse — nicht als Forschungssubjekte, sondern als Partnerinnen und Partner.

Die präziseste Definition stammt von INVOLVE/NIHR (UK):

> *"Research being carried out 'with' or 'by' members of the public rather than 'to', 'about' or 'for' them."*

Diese Unterscheidung ist fundamental. PPI bedeutet:
- **Mitgestaltung** von Forschungsfragen und -prioritäten
- **Mitarbeit** bei Studiendesign und Protokollerstellung
- **Review** von Patienteninformationen und Einwilligungserklärungen
- **Beteiligung** an Ethikkommissionen, Advisory Boards und Steering Committees
- **Mitwirkung** bei der Dissemination von Forschungsergebnissen

PPI bedeutet ausdrücklich **nicht** die Teilnahme als Probandin oder Proband in einer klinischen Studie. Diese Unterscheidung ist in der Praxis oft unklar — auch in der vorliegenden Arbeitszusammenfassung.

### 2.2 Internationale Entwicklungen

**Vereinigtes Königreich — NIHR/INVOLVE**  
Das UK ist international führend in der Institutionalisierung von PPI. INVOLVE (1996 gegründet) hat PPI-Prinzipien und Standards entwickelt, die weltweit als Referenz gelten. Die UK Standards for Public Involvement definieren sechs Qualitätsdimensionen: Inclusive Opportunities, Working Together, Support and Learning, Communications, Impact und Governance. Seit 2020 ist INVOLVE in das NIHR integriert.

**Kanada — SPOR (Strategy for Patient-Oriented Research)**  
Das Canadian Institutes of Health Research (CIHR) hat mit SPOR einen nationalen Rahmen für patientenorientierte Forschung geschaffen. Der SPOR Patient Engagement Framework definiert vier Prinzipien: Inclusion, Support, Mutual Respect und Co-building. SPOR betont explizit, dass Patientinnen und Patienten als Partner an Governance, Prioritätensetzung und Forschungsdesign beteiligt werden — und sieht dafür eine finanzielle Entschädigung vor.

**USA — PCORI (Patient-Centered Outcomes Research Institute)**  
PCORI wurde 2010 durch den Affordable Care Act gegründet. Das PCORI Engagement Rubric (2016/2017) definiert Prinzipien für patientenzentrierte Forschungspartnerschaften: Reciprocal Relationships, Co-Learning, Valued Partnership sowie Trust and Transparency. PCORI verlangt von geförderten Projekten nachweisliche Patientenbeteiligung und hat eigene Methodik-Standards für patientenzentrierte Forschung entwickelt.

**Europa — EUPATI**  
Die European Patients' Academy on Therapeutic Innovation (EUPATI) wurde im Rahmen der Innovative Medicines Initiative (IMI) gegründet. EUPATI bietet ein strukturiertes 14-monatiges Ausbildungsprogramm für Patienten-Expertinnen und -Experten an — bestehend aus Online-Modulen und Präsenzveranstaltungen. Absolventen erhalten den Titel EUPATI Fellow und tragen damit zur Arzneimittelentwicklung bei: als Beraterinnen und Berater von Pharmaunternehmen, Aufsichtsbehörden (EMA), Universitäten und HTA-Stellen. Im Oktober 2023 schloss der 7. Jahrgang mit 80 Fellows aus 33 Ländern ab.

**PFMD — Patient Focused Medicines Development**  
PFMD ist eine internationale Multi-Stakeholder-Initiative zur Förderung patientenorientierter Medizinentwicklung. PFMD hat Qualitätsguidelines für PPI entwickelt, die Kriterien wie Shared Purpose, Respect, Accessibility, Transparency und Sustainability umfassen. PFMD-Materialien werden international als praxisorientiertes Ergänzungswerk zu NIHR- und PCORI-Standards verwendet.

### 2.3 Aktuelle Herausforderungen

Die internationale Forschung zu PPI zeigt konsistent folgende Probleme:

**Tokenismus**  
Die Qualität von PPI ist häufig tokenistisch. Tokenismus bezeichnet eine oberflächliche, symbolische Einbeziehung, die vorrangig dazu dient, formale Anforderungen zu erfüllen, nicht aber zu echter Mitgestaltung führt. Eine 2020 publizierte Übersicht ergab, dass in nur rund 50% der Gesundheitsforschung eine bedeutungsvolle PPI stattfindet (BMC Medicine, 2020).

**Organisatorische Barrieren**  
Tokenismus entsteht häufig nicht aus böser Absicht, sondern aus strukturellen Defiziten: unklare Rollen, mangelnde Vorbereitung der PPI-Mitwirkenden, fehlende Ressourcen, keine systematische Evaluation. Barriers sind konzeptueller und praktischer Natur (Exploring Perceived Barriers, PMC 2014; Delphi study). Eine angemessen finanzierte, unterstützende Organisationsinfrastruktur ist laut Literatur die Voraussetzung für bedeutungsvolle PPI.

**Fehlende Infrastruktur**  
Viele Länder verfügen über keine systematische Infrastruktur zur Vermittlung von PPI-Mitwirkenden. Die Suche erfolgt über persönliche Netzwerke, Patientenorganisationen und informelle Kontakte. Dies führt zu strukturellen Verzerrungen: gut vernetzte, eloquente, primär englischsprachige Patientenvertreterinnen und -vertreter aus bestimmten Krankheitsgebieten werden wiederholt eingebunden, während andere Perspektiven systematisch unterrepräsentiert bleiben.

**Evaluation und Wirkungsnachweis**  
Die Wirkung von PPI auf Forschungsqualität und -relevanz ist schwer messbar. Obwohl qualitative Befunde auf positive Effekte hinweisen, fehlen robuste quantitative Evidenz und standardisierte Evaluationsinstrumente.

---

## 3. Problemdefinition

### 3.1 Welches Problem soll gelöst werden?

Die Arbeitszusammenfassung beschreibt das Problem wie folgt: Forschungsprojekte und PPI-Mitwirkende finden nicht systematisch zusammen. Die Suche erfolgt über persönliche Netzwerke und Einzelanfragen.

Diese Beschreibung ist korrekt, aber zu allgemein. Eine präzisere Problemdefinition ergibt sich aus der kritischen Analyse:

**Problem A — Strukturelle Intransparenz**  
Forschungsteams in der Schweiz wissen nicht, welche qualifizierten PPI-Mitwirkenden in welchen Themengebieten und mit welchen Kompetenzen verfügbar sind. Es gibt kein Register, kein Verzeichnis, keine systematische Übersicht.

**Problem B — Einseitige Netzwerkeffekte**  
Wer Zugang zu bestimmten Netzwerken hat (z.B. Universitätsspitäler, Patientenorganisationen, EUPATI-Netzwerk), findet Mitwirkende. Wer diesen Zugang nicht hat, findet keine. Dies begünstigt strukturell bestehende Machtverhältnisse und schränkt die Diversität der eingebrachten Perspektiven ein.

**Problem C — Kompetenz-Mismatch**  
Nicht jede Patientin und jeder Patient mit einer bestimmten Erkrankung ist geeignet für jede PPI-Rolle. Ein Steering Committee eines multizentrischen Phase-III-Trials braucht andere Kompetenzen als eine Fokusgruppe zur Entwicklung von Rekrutierungsmaterialien. Mangels Transparenz über Kompetenzen entstehen Mismatches, die zu Tokenismus führen.

**Problem D — Fehlende Koordinationsinfrastruktur**  
In der Schweiz gibt es keine dedizierte Koordinationsstelle, die PPI-Vermittlung systematisch unterstützt, Mitwirkende begleitet und Qualitätsstandards durchsetzt.

### 3.2 Für wen?

**Primäre Zielgruppen:**
- Forschungsteams an Schweizer Universitäten und Universitätsspitälern
- Forschungsnetzwerke (SAKK, SCTO-Netzwerk, Swiss-PH, Swiss Rare Diseases)
- Forschungsförderinstitutionen (SNF, SNSF, Innosuisse)
- Klinische Trialinitiatoren (Investigator Initiated Trials)
- Regulatorische und HTA-Prozesse mit PPI-Anforderungen

**Sekundäre Zielgruppen:**
- Patientenorganisationen (als kollektive PPI-Partner)
- EUPATI Fellows in der Schweiz
- Personen mit gelebter Erfahrung einer Erkrankung ohne formale PPI-Ausbildung
- Angehörige

### 3.3 Warum besteht dieses Problem?

Das Problem ist strukturell bedingt und nicht das Resultat fehlender Motivation einzelner Akteure.

Ursache 1 — **Fehlende nationale Institutionalisierung**: Förderorganisationen (SNF) erwähnen PPI zunehmend in Förderkriterien, ohne eine Infrastruktur zur Umsetzung bereitzustellen.

Ursache 2 — **Keine gemeinsame Sprache**: Taxonomien für PPI-Rollen, Kompetenzniveaus und Beitragsformate sind nicht standardisiert. Was ein Team als "PPI" versteht, deckt sich nicht notwendigerweise mit dem Verständnis eines anderen Teams.

Ursache 3 — **Kleinheit des Schweizer Kontexts**: Die Schweiz hat ~8,7 Millionen Einwohner und vier Sprachregionen. Der Pool ausgebildeter PPI-Mitwirkender ist begrenzt. Einzelne bekannte Personen werden wiederholt angegangen.

Ursache 4 — **Datenschutz als Hemmnis**: Die bisherige Zurückhaltung beim Aufbau von Registern ist teilweise auf Unsicherheiten bezüglich des Datenschutzes zurückzuführen.

---

## 4. Analyse bestehender Ansätze

### 4.1 Kritische Vorbemerkung: Die Unterscheidung zwischen Teilnahme und Beteiligung

Bevor bestehende Plattformen bewertet werden, muss eine fundamentale Unterscheidung etabliert werden, die in der Arbeitszusammenfassung nicht ausreichend gemacht wird:

| Merkmal | Klinische Studienteilnahme | PPI-Beteiligung |
|---|---|---|
| Rolle der Person | Forschungssubjekt (Proband) | Forschungspartner (Advisor, Co-Researcher) |
| Zweck | Daten für Forschungsfrage erheben | Forschungsprozess mitgestalten |
| Typisches Format | Intervention, Beobachtung, Messung | Sitzung, Review, Advisory Board, Workshop |
| Datenschutzlage | Klinische Daten, Probandendaten | Kompetenz- und Erfahrungsdaten |
| Primäre Passung | Diagnose, Eligibility-Kriterien | Perspektive, Kompetenz, Verfügbarkeit |

**Fast alle bekannten grossen Matching-Plattformen adressieren Studienteilnahme, nicht PPI-Beteiligung.** Dies ist ein kritischer Befund, der die Übertragbarkeit von Lessons Learned erheblich einschränkt.

### 4.2 NIHR Be Part of Research (UK)

**Was es ist:** UK-weites Freiwilligenregister, gestartet Juli 2022. Erstes Register, das alle Gesundheitsspezialitäten abdeckt, inkl. Public Health und Social Care.

**Fakten (Stand 2025):**
- 528.389 registrierte Freiwillige
- Ziel: 1 Million Registrierungen bis April 2025
- Ca. 50.000 haben tatsächlich an Forschung teilgenommen (Aktivierungsquote: ~9%)
- Kostenloser Zugang für Forschende
- Matching-Dimensionen: Alter, Geschlecht, ethnische Zugehörigkeit, geografischer Standort, Gesundheitsinteressen/-bereiche, Erkrankungen

**Was gelöst wurde:** Die grundlegende Infrastruktur für Freiwilligenregistrierung und Kontaktaufnahme durch Forschende.

**Was nicht gelöst wurde:**
- Das Verhältnis registriert/aktiv (91% passiv) zeigt ein strukturelles Aktivierungs- und Engagement-Problem
- Das System ist primär auf Studienteilnahme ausgelegt, nicht auf PPI-Beratungsrollen
- Keine differenzierte Kompetenzabbildung; Matching basiert auf demografischen und krankheitsbezogenen Daten
- Keine Qualitätssicherung der PPI-Beiträge

**Lessons Learned:** Registrierung ist einfach zu erreichen. Echte, kontinuierliche Beteiligung ist das eigentliche Problem. Eine Plattform löst keine Motivations- und Vertrauensbarrieren durch Technologie allein.

### 4.3 ResearchMatch (USA, Vanderbilt University)

**Was es ist:** Nationales elektronisches Web-Tool für klinische und translationale Forschung, gegründet 2009, betrieben an der Vanderbilt University Medical Center, finanziert durch das CTSA-Konsortium.

**Fakten:**
- 15.871 Freiwillige nach 19 Monaten (Stand Juni 2011); seither stark gewachsen
- 751 Forschende aus 61 CTSA-Institutionen nach 19 Monaten
- 540 aktive Studien nach 19 Monaten
- Ca. 1 von 5 kontaktierten Freiwilligen reagierte positiv auf Forscheranfragen
- Datenschutzmodell: Forschende sehen de-identifizierte Profile; Freiwillige geben Kontaktdaten nur bei Interesse frei

**Was gelöst wurde:** Erste skalierbare Infrastruktur zur Freiwilligenrekrutierung für klinische Forschung in den USA.

**Was nicht gelöst wurde:**
- Primär auf Studienteilnahme (klinische Trials) ausgelegt, nicht auf PPI-Beratungsrollen
- 80% Response-Rate bei Forschenden-Kontakten bedeutet auch 80% Abbruch
- Datenvollständigkeit und Profil-Qualität abhängig von Freiwilligen-Initiative
- Keine Kompetenzabbildung im PPI-Sinne

**Lessons Learned:** Die Infrastruktur für Erstkontakt ist lösbar. Das Konversionsrate-Problem (von Interesse zu aktiver Teilnahme) bleibt systemisch. Privacy-by-Design (de-identifizierte Profile, optionale Freigabe) ist ein wichtiges und übertragbares Modell.

### 4.4 Antidote.me (USA)

**Was es ist:** Kommerzielles Clinical-Trial-Matching-Unternehmen. Betreibt eine strukturierte Eligibility-Matching-Engine.

**Fakten:**
- Erreicht über 250 Patientengemeinschaften und Gesundheitsportale
- Über 15 Millionen Patienten pro Monat
- Vollständige eligibility-basierte Trefferliste aus strukturierten Einschlusskriterien
- Über 100 abgeschlossene Rekrutierungsprojekte

**Relevanz für PPI-Plattform:** Gering. Antidote ist ein klinisches Rekrutierungsinstrument auf Basis medizinischer Eligibility-Kriterien. Das Matching-Modell ist diagnose- und eligibility-basiert. Es ist das Gegenteil des angestrebten kompetenzorientierten Ansatzes.

**Lessons Learned:** Strukturierte eligibility-Kriterien ermöglichen hohe Matching-Präzision für klinische Trials. Für PPI-Beteiligung, wo Kompetenzen und Perspektiven im Vordergrund stehen, ist dieses Modell nicht direkt übertragbar.

### 4.5 Fox Trial Finder (USA, Michael J. Fox Foundation)

**Was es ist:** Plattform zur Vermittlung von Parkinson-Patientinnen und -Patienten zu klinischen Studien.

**Relevanz:** Das System zeigt, dass krankheitsspezifische Matching-Plattformen aufgebaut werden können, aber nachhaltige Finanzierung und aktives Curation-Management voraussetzen. Der Fokus liegt auf Studienteilnahme.

### 4.6 EUPATI Fellow-Netzwerk (Europa)

**Was es ist:** Informelles Netzwerk von EUPATI-Absolventen, die als zertifizierte Patienten-Expertinnen und -Experten für Beratungsrollen in der Arzneimittelentwicklung zur Verfügung stehen.

**Fakten:**
- 7 Jahrgänge, zuletzt Oktober 2023: 80 Fellows aus 33 Ländern
- Fellows sind nachweislich kompetenzorientiert: Ausbildung umfasst klinische Forschung, Regulatorik, HTA, Pharmakologie
- Engagements bei: Pharmaunternehmen, EMA-Komitees, Universitäten, HTA-Stellen
- Kein zentrales öffentliches Matching-System; Vermittlung erfolgt über EUPATI-Netzwerk und persönliche Kontakte

**Was gelöst wurde:** Definition eines Kompetenzprofils für den "PPI-Experten" — eine eigenständige Rolle, die über gelebte Erfahrung hinausgeht.

**Was nicht gelöst wurde:** Keine systematische, transparente Vermittlungsinfrastruktur. Zugang weiterhin netzwerkabhängig. Keine Schweiz-spezifische Lösung.

**Lessons Learned:** Das EUPATI-Modell belegt, dass kompetenzbasierte PPI-Rollen existieren und gut funktionieren — aber nicht auf eine breite Plattform skaliert sind.

### 4.7 CUE (Consumers United for Evidence-based Healthcare)

**Relevanz:** CUE betreibt eine Clearinghouse-Funktion: Gesundheitsorganisationen können Verbrauchervertreterinnen und -vertreter für Forschungsprojekte anfragen. Das Modell basiert auf kuratierten Profilen und manuellem Matching durch eine Koordinationsstelle.

**Lessons Learned:** Das Clearinghouse-Modell mit menschlicher Koordination funktioniert für kleine, kuratierte Netzwerke. Es skaliert nicht automatisch, ist aber qualitativ hochwertiger als rein automatisiertes Matching.

### 4.8 Zusammenfassung: Gemeinsame Erfolgsfaktoren und Misserfolgsfaktoren

| Erfolgsfaktoren | Misserfolgsfaktoren |
|---|---|
| Klares Nutzenversprechen für beide Seiten (Forschende und Mitwirkende) | Fehlende Aktivierung nach Registrierung |
| Nachhaltige Finanzierung und Institutionalisierung | Overengineering der Technik vor Lösung der Governance-Fragen |
| Datenschutz by Design (de-identifizierte Profile, opt-in Kontaktfreigabe) | Diagnose-only-Matching ohne Kompetenzabbildung |
| Menschliche Koordination und Qualitätssicherung | Fehlende Pflegeprozesse für Profile |
| Klare Rollen- und Kompetenz-Taxonomie | Unklare Rollendefinition (Teilnahme vs. Beteiligung) |
| Einbindung von Patientenorganisationen als Gateway | Mangelnde Diversität der Mitwirkenden |
| Feedback-Schleifen und Evaluation | Kein Qualitätsmonitoring nach erfolgtem Matching |

---

## 5. Zielbild

### 5.1 Vision

Eine Schweizer PPI-Plattform, die Forschungsprojekte und PPI-Mitwirkende auf der Basis von Perspektiven, Erfahrungen, Kompetenzen und Rahmenbedingungen systematisch, datenschutzkonform und qualitätsorientiert zusammenführt — und damit PPI in der Schweiz von einer informellen Netzwerkpraxis zu einer transparenten, zugänglichen und qualitätssichernden Infrastruktur entwickelt.

### 5.2 Mission

Die Plattform schafft die infrastrukturellen Voraussetzungen dafür, dass Forschende in der Schweiz geeignete PPI-Mitwirkende für spezifische Beitragsrollen finden — und PPI-Mitwirkende geeignete Projekte, bei denen ihre Perspektiven und Kompetenzen gezielt eingebracht werden können.

### 5.3 Zielgruppen

**Zielgruppe A — Forschungsseite (Nachfrager)**
- Akademische Forschungsteams (Universitäten, Universitätsspitäler)
- Forschungsnetzwerke und Koordinationszentren
- Forschungsförderinstitutionen (SNF/SNSF, Innosuisse)
- Klinische Trialinitiatoren (IIT-Sponsoren)
- Industriegesponsorte Studien mit PPI-Anforderungen

**Zielgruppe B — PPI-Mitwirkende (Anbieter)**
- Personen mit gelebter Erfahrung einer Erkrankung (Patienten, ehemalige Patienten)
- Angehörige und betreuende Personen
- Vertreterinnen und Vertreter von Patientenorganisationen
- EUPATI Fellows und andere ausgebildete Patienten-Expertinnen und -Experten
- Personen ohne Erkrankung mit relevantem Erfahrungshintergrund (Pflegepersonen, Berufstätige im Gesundheitswesen mit Patientensicht)

**Zielgruppe C — Intermediäre (Gateways)**
- Patientenorganisationen
- Regionale Patientennetzwerke
- Gesundheitsligen
- Universitätsspitäler mit bestehenden PPI-Programmen

### 5.4 Nutzenversprechen

**Für Forschende:**
- Systematischer Zugang zu qualifizierten PPI-Mitwirkenden mit dokumentierten Kompetenzen
- Transparenz über verfügbare Perspektiven und Erfahrungen
- Zeitersparnis im Suchprozess
- Diversifikation der PPI-Mitwirkenden über bestehende Netzwerke hinaus

**Für PPI-Mitwirkende:**
- Sichtbarkeit der eigenen Erfahrungen und Kompetenzen
- Zugang zu Forschungsprojekten, die zu den eigenen Möglichkeiten passen
- Kontrolle über die eigene Profilsichtbarkeit und Kontaktfreigabe
- Würdigung der eigenen PPI-Beiträge durch ein vertrauenswürdiges System

**Für das Forschungssystem:**
- Verbesserung der Qualität und Relevanz von Forschung
- Förderung der Diversität in PPI
- Aufbau einer dokumentierten PPI-Community in der Schweiz

---

## 6. Fachmodell

### 6.1 Akteure und Rollen

Das Fachmodell kennt drei primäre Akteurstypen und mehrere Rollen.

#### 6.1.1 PPI-Mitwirkende

PPI-Mitwirkende sind Personen, die ihre Perspektiven, Erfahrungen und Kompetenzen in Forschungsprozesse einbringen. Sie sind keine Forschungssubjekte.

Das Rollenmodell unterscheidet nach Beitragstyp, nicht nach Diagnose:

**Rolle 1 — Erfahrungsträger/in (Lived Experience Contributor)**
- Bringt gelebte Erfahrung einer Erkrankung oder eines Versorgungswegs ein
- Keine PPI-Vorerfahrung erforderlich
- Geeignet für: Fokusgruppen, Entwicklung von Patienteninformationen, Feedback zu Rekrutierungsmaterialien, Patientenpräferenzen

**Rolle 2 — Erfahrene/r PPI-Mitwirkende/r (Experienced PPI Contributor)**
- Hat bereits an PPI-Aktivitäten in Forschungsprojekten mitgewirkt
- Vertraut mit Forschungskontext und PPI-Prozessen
- Geeignet für: Review von Studienprotokollen, Mitwirkung in Projektbegleitgruppen, wiederkehrende Beratungsrollen

**Rolle 3 — PPI-Expertin / PPI-Experte (Expert PPI Partner)**
- Ausgebildete Kompetenz in Forschungsmethodik, Regulatorik oder HTA
- Beispiele: EUPATI Fellows, Personen mit formaler PPI-Ausbildung
- Geeignet für: Advisory Boards, Steering Committees, Studienprotokoll-Review auf Fachebene, regulatorische Konsultationen

**Rolle 4 — Patientenorganisations-Vertretung (Patient Organisation Representative)**
- Vertritt eine Patientenorganisation und bringt eine kollektive Perspektive ein
- Kann eigene Erkrankungserfahrung haben oder nicht
- Geeignet für: Governance-Rollen, kollektive Interessenvertretung, Netzwerkmobilisierung

**Wichtige Präzisierung zur Rollenüberschneidung:** Eine Person kann mehrere Rollen gleichzeitig innehaben (z.B. EUPATI Fellow und Patientenorganisationsvertreterin). Das Profil sollte alle Rollen abbilden.

#### 6.1.2 Forschungsprojekte

Forschungsprojekte sind die Nachfrageseite. Sie werden durch ein Forschungsteam repräsentiert. Jedes Projekt hat spezifische PPI-Bedarfe, die sich nach Forschungsphase, Aufgabentyp und erforderlichen Beiträgen unterscheiden.

#### 6.1.3 Plattformkoordination

Die Koordinationsstelle ist ein essenzieller, in der Arbeitszusammenfassung **fehlender** Akteur. Erfahrungen aus vergleichbaren Systemen (CUE, NIHR Involvement-Koordination) zeigen: Eine rein technische Vermittlung ohne menschliche Koordination führt zu qualitativ schlechten Matches und hohem Dropout.

Die Koordinationsstelle übernimmt:
- Profilvalidierung und Qualitätssicherung
- Unterstützung bei der Definition des PPI-Bedarfs (Forschungsseite)
- Begleitung von PPI-Mitwirkenden (Onboarding, Vorbereitung, Nachbereitung)
- Konfliktmanagement und Qualitätsmonitoring

### 6.2 Perspektiven-Dimensionen

Der Begriff "Perspektive" wird in der Arbeitszusammenfassung eingeführt, aber nicht vollständig differenziert. Folgende Differenzierung schlägt das Fachmodell vor:

**Erfahrungstyp-Perspektive (primär):**
- Gelebte Krankheitserfahrung (akut oder chronisch)
- Gelebte Angehörigen-/Betreuungserfahrung
- Patientenorganisations-Perspektive (kollektiv, politisch)
- Beruflicher Erfahrungshintergrund mit Patientensicht (z.B. Pflege, Sozialarbeit)

**Relationale Perspektive (sekundär):**
- Betroffene Person selbst
- Ehemalige Betroffene (Remission, Heilung)
- Elternteil oder Erziehungsberechtigte/r
- Partner/in oder nahe Angehörige/r
- Professionelle Begleitung (Pflegeperson, Sozialarbeitende)

**Kollektive vs. individuelle Perspektive:**
- Individuelle Perspektive: eigene gelebte Erfahrung
- Kollektive Perspektive: Vertretung einer Gruppe oder Organisation

Diese Unterscheidung ist für das Matching relevant: Ein Forschungsprojekt, das kollektive Patienteninteressen für eine Konsultation braucht, hat andere Anforderungen als eines, das individuelle gelebte Erfahrung für eine Fokusgruppe sucht.

### 6.3 Erfahrungs-Dimensionen

Erfahrung wird in zwei Subdimensionen differenziert:

**Erkrankungs-/Themenbereich:**  
Welcher Krankheitsbereich oder Versorgungsbereich ist relevant? (z.B. Onkologie, Neurologie, seltene Erkrankungen, psychische Gesundheit, Versorgungsübergang)

**Erfahrungstiefe und -art:**
- Akute Krankheitserfahrung
- Chronische Langzeiterfahrung
- Erfahrung mit bestimmten Behandlungsformen oder Versorgungswegen
- Erfahrung mit klinischen Studien (als Proband)

**Wichtige Anmerkung:** Erfahrungstiefe ist keine Qualitätshierarchie. Unterschiedliche Erfahrungsarten sind für unterschiedliche PPI-Aufgaben relevant.

### 6.4 PPI-Kompetenz-Dimensionen

Dies ist das Herzstück des kompetenzorientierten Ansatzes und bedarf der grössten Sorgfalt in der Taxonomie-Entwicklung.

**Aufgabenkompetenz:** Was kann die Person in einem Forschungskontext tun?
- Review von Patienten-Informationsmaterialien
- Beteiligung an Fokusgruppen oder Workshops
- Review von Studienprotokollen (einfach bis komplex)
- Mitarbeit in Projektbegleitgruppen
- Advisory Board Mitgliedschaft
- Steering Committee Mitgliedschaft
- Mitwirkung bei Dissemination / Öffentlichkeitsarbeit
- HTA-Konsultation
- Ethikkommission oder Reviewpanel

**Methodenkompetenz (erworben):**
- Grundlagenwissen über klinische Forschung
- Kenntnisse über Studiendesign
- EUPATI-Ausbildung oder äquivalente Qualifikation
- Erfahrung mit regulatorischen Prozessen

**PPI-Prozesserfahrung:**
- Anzahl bisheriger PPI-Engagements (keines / 1-3 / >3)
- Art bisheriger Engagements (Beratung / Review / Governance)
- Bisherige Forschungsbereiche

**Kommunikationskompetenz:**
- Sprachen (Deutsch, Französisch, Italienisch, Englisch) — in der Schweizer Sprachsituation kritisch
- Fähigkeit zur schriftlichen und mündlichen Kommunikation in wissenschaftlichem Kontext

### 6.5 Rahmenbedingungen

**Verfügbarkeit:**
- Stunden pro Monat verfügbar
- Zeitliche Flexibilität (Wochentag, Tageszeit)
- Maximale Projektdauer

**Format:**
- Online
- Hybrid
- Präsenz (mit Reisebereitschaft)

**Geografie:**
- Sprachregion (Deutschschweiz, Romandie, Ticino)
- Bereitschaft zur Reisetätigkeit

**Vergütung:**
- Erwartung bzgl. Aufwandsentschädigung (ja / nach Absprache / keine Erwartung)

**Zugänglichkeit:**
- Spezifische Zugänglichkeitsbedürfnisse (z.B. Barrierefreiheit, Übersetzungsunterstützung)

### 6.6 Fehlende Dimension: Forschungsphase

Die Arbeitszusammenfassung erwähnt diese Dimension nicht. Sie ist aber für die Matching-Qualität entscheidend.

PPI ist in unterschiedlichen Forschungsphasen relevant — und erfordert unterschiedliche Beiträge:

| Forschungsphase | Typischer PPI-Beitrag |
|---|---|
| Prioritätensetzung / Forschungsfragenentwicklung | Fokusgruppe, Konsultation, Co-Design |
| Grundlagenforschung (vorklinisch) | Begrenzte PPI-Relevanz; Wissenschaftskommunikation |
| Klinische Phase I-II | Studienprotokoll-Review, Rekrutierungsmaterialien |
| Klinische Phase III | Steering Committee, Patient Advisory Group |
| Systemrelevante Forschung / HTA | Kollektive Patientenvertretung, Organisationsvertreter |
| Dissemination | Öffentlichkeitsarbeit, Laienverständliche Zusammenfassungen |

Diese Dimension muss in die Matching-Logik integriert werden.

---

## 7. Matching-Modell

### 7.1 Matching-Dimensionen (revidiertes Modell)

Das revidierte Matching-Modell erweitert die vier Dimensionen der Arbeitszusammenfassung um zwei weitere:

```
FORSCHUNGSBEDARF (Input)
│
├── 1. Beitragstyp        (Was soll die Person tun?)
├── 2. Forschungsphase    (Wo im Forschungsprozess?)
├── 3. Perspektive        (Welche Sichtweise wird gesucht?)
├── 4. Erfahrungsbereich  (Welches Erkrankungs-/Themengebiet?)
├── 5. PPI-Kompetenz      (Welche Kompetenzen werden benötigt?)
└── 6. Rahmenbedingungen  (Sprache, Verfügbarkeit, Format)
        │
        ▼
MATCHING-SYSTEM
        │
        ▼
GEEIGNETE PPI-MITWIRKENDE (Output)
```

### 7.2 Matching-Logik

Das Matching-Modell unterscheidet zwischen Muss-Kriterien und Kann-Kriterien:

**Muss-Kriterien (Mindestvorraussetzungen):**
- Sprachkompetenz (Übereinstimmung mit Projektsprache)
- Beitragstyp-Kompetenz (hat die Person vergleichbare Beiträge geleistet?)
- Verfügbarkeit (zeitlich und geografisch)

**Kann-Kriterien (erhöhen die Matching-Qualität):**
- Direkter thematischer Erfahrungsbezug
- Forschungsphasenerfahrung
- Höheres PPI-Kompetenzniveau

### 7.3 Matching-Verfahren (MVP vs. Zielsystem)

**MVP-Ansatz (Phase 1): Kuratorisches Matching**

Das Matching erfolgt durch eine menschliche Koordinationsstelle auf Basis strukturierter Profile. Kein Algorithmus in dieser Phase. Die Koordinationsstelle:
- Empfängt Anfragen von Forschungsteams
- Prüft Profile gegen definierte Kriterien
- Erstellt eine Vorschlagsliste
- Begleitet die erste Kontaktaufnahme

Rationale: Automatisches Matching setzt voraus, dass Taxonomien stabil, Profile vollständig und die Matching-Dimensionen valide sind. Dies kann in einer frühen Phase nicht garantiert werden.

**Zielsystem (Phase 2-3): Regelbasiertes Matching mit menschlicher Qualitätssicherung**

Automatische Vorfilterung nach Muss-Kriterien, gefolgt von einer Rangliste geeigneter Profile. Forschungsteam wählt aus der Liste. PPI-Mitwirkende geben Kontaktfreigabe. Koordinationsstelle begleitet weiterhin.

**Warum kein vollautomatisches algorithmisches Matching:**
Matching auf Basis von Perspektiven und Kompetenzen hat eine qualitative Dimension, die rein regelbasiertes Matching nicht abbilden kann. Die Forschung zu Therapeuten-Patienten-Matching (Talkspace, 2023) zeigt, dass selbst für sehr gut strukturierbare Matching-Probleme menschliche Qualitätssicherung weiterhin Mehrwert erbringt.

### 7.4 Bewertung der alternativen Matching-Ansätze

| Ansatz | Vorteil | Nachteil | Empfehlung |
|---|---|---|---|
| Vollautomatisch (Algorithmus) | Skalierbar, schnell | Erfordert saubere Taxonomien und vollständige Profile; Qualitätsrisiko | Nicht für MVP |
| Vollmanuell (Koordinator entscheidet) | Hohe Qualität, flexibel | Nicht skalierbar | Geeignet für MVP |
| Regelbasiert + menschliche QS | Balanciert | Erfordert stabile Taxonomien | Geeignet ab Phase 2 |
| KI-gestützt | Potentiell sehr gut | Erfordert Trainingsdaten, hohe Datenmenge, Erklärbarkeit | Nicht vor Phase 3 |

### 7.5 Feedback und Qualitätsschleifen

Das Matching-Modell ist ohne Feedback-Schleifen unvollständig. Das System muss lernen:

- Hat das Matching zu einer tatsächlichen Zusammenarbeit geführt? (Konversionsrate)
- War der Beitrag aus Sicht des Forschungsteams wertvoll? (Qualitäts-Feedback)
- War die Erfahrung für die PPI-Mitwirkenden positiv? (Engagement-Feedback)
- Führte das Matching zu echten Veränderungen im Forschungsprozess? (Impact-Tracking)

Diese Feedback-Daten sind nicht nur für die Qualitätssicherung wichtig, sondern auch für die Weiterentwicklung der Matching-Taxonomien.

---

## 8. Governance

### 8.1 Trägerschaft

Die Trägerschaftsfrage ist die kritischste und in der Arbeitszusammenfassung fehlende Dimension. Ohne einen definierten Träger mit langfristiger Finanzierungsperspektive ist das Konzept nicht umsetzbar.

**Option A — Akademische Trägerschaft (z.B. SCTO, Swiss TPH)**  
Vorteil: Institutionelle Stabilität, Forschungsnähe, Glaubwürdigkeit  
Nachteil: Mögliche Wahrnehmung als zu forscherseitig; begrenzte Ressourcen für Plattformbetrieb

**Option B — Patientenorganisations-Trägerschaft (z.B. Dachorganisation)**  
Vorteil: Unabhängigkeit von Forschungsseite, Vertrauen der PPI-Mitwirkenden  
Nachteil: Ressourcenknappheit, potenzielle Interessenkonflikte bei bestimmten Organisationen

**Option C — Gemischte Trägerschaft (Multistakeholder)**  
Vorteil: Balanciert Interessen beider Seiten; legitimiert Governance  
Nachteil: Governance-Komplexität; Entscheidungsträgheit bei Konflikten

**Empfehlung:** Multistakeholder-Governance mit einer unabhängigen Koordinationsstelle als Betriebseinheit. Finanzierung initial durch Forschungsförderung (SNF/Innosuisse), mittelfristig durch Nutzungsgebühren und institutionelle Beiträge.

### 8.2 Qualitätsmanagement

**Profilvalidierung:**  
Profile von PPI-Mitwirkenden müssen validiert werden. Self-reporting allein reicht nicht. Anforderungen:
- Basisvalidierung: Identitätsverifizierung (kein fake accounts)
- Kompetenzvalidierung: Referenz von Patientenorganisation, Bestätigung durch frühere Forschungsteams, oder Vorlage von Ausbildungsnachweisen (z.B. EUPATI-Zertifikat)

**Projekt-Anfragen-Qualität:**  
Forschungsteams müssen einen strukturierten Bedarfsbogen ausfüllen. Vage Anfragen ("wir suchen Patienten") werden nicht akzeptiert. Anforderungen umfassen: geplanter Beitragstyp, Forschungsphase, Ressourcen für PPI-Vorbereitung und -Begleitung.

**Matching-Qualitätssicherung:**  
Regelmässige Auswertung der Feedback-Daten (s. 7.5). Qualitätsprobleme werden systematisch erfasst und an die Governance-Gremien gemeldet.

### 8.3 Rollen und Verantwortlichkeiten

| Rolle | Träger | Aufgaben |
|---|---|---|
| Strategische Steuerung | Trägergremium (multistakeholder) | Strategie, Qualitätsstandards, Taxonomie-Entscheide, Finanzierung |
| Betriebliche Koordination | Koordinationsstelle | Matching, Profil-QS, Begleitung, Reporting |
| Technischer Betrieb | IT-Dienstleister oder interner IT | Plattformbetrieb, Datensicherheit |
| Datenschutz | Datenschutzbeauftragter | nDSG-Compliance, DSFA, Datenpflege |
| Wissenschaftliche Beratung | Advisory Board | Taxonomie-Entwicklung, PPI-Qualitätsstandards |

### 8.4 Taxonomie-Governance

Die Entwicklung und Pflege der Taxonomie ist eine Daueraufgabe, keine einmalige Designentscheidung. Taxonomien veralten, wenn neue Beitragsformen entstehen oder das Forschungsfeld sich verändert.

Anforderungen an die Taxonomie-Governance:
- Klare Verantwortlichkeit für Taxonomie-Entscheide
- Jährlicher Review-Zyklus
- Einbindung der Nutzerinnen und Nutzer (Forschende und PPI-Mitwirkende) in Taxonomie-Updates
- Mehrsprachige Taxonomie (DE/FR/IT/EN)

---

## 9. Datenschutz

### 9.1 Rechtlicher Rahmen Schweiz

**Neues Datenschutzgesetz (nDSG)**  
Das vollständig revidierte Datenschutzgesetz ist seit dem 1. September 2023 in Kraft. Es stellt deutlich höhere Anforderungen als das Vorgängergesetz.

Für die PPI-Plattform relevante Elemente:

**Besonders schützenswerte Personendaten:**  
Gesundheitsdaten, genetische Daten und biometrische Daten zählen zu den "besonders schützenswerten Personendaten" (Art. 5 lit. c nDSG). Auch genetische und biometrische Daten sind seit 2023 neu explizit erfasst.

Für die Bearbeitung dieser Daten gelten:
- Erhöhte Anforderungen an die Rechtfertigungsgründe
- Explizite Einwilligung für Profiling mit hohem Risiko
- Pflicht zur Datenschutz-Folgenabschätzung (DSFA) bei voraussichtlich hohem Risiko

**Datenprinzipien:**
- **Verhältnismässigkeit** (Art. 6 nDSG): Nur so viele Daten erheben wie notwendig
- **Zweckbindung**: Daten nur für angegebene Zwecke verwenden
- **Richtigkeit**: Aktualität und Korrektheit der Daten sicherstellen
- **Datensicherheit**: Technische und organisatorische Massnahmen

**Humanforschungsgesetz (HFG):**  
Je nach konkreter Ausgestaltung könnte das HFG für einzelne Aspekte des Plattformbetriebs relevant sein — insbesondere wenn Daten über PPI-Mitwirkende für Forschungszwecke ausgewertet werden. Diese Frage bedarf juristischer Klärung.

### 9.2 Datenkategorien und Schutzklassifikation

| Datenkategorie | Schutzklasse | Erforderlichkeit | Empfehlung |
|---|---|---|---|
| Name und Kontaktdaten | Standard | Nur intern, nie an Forschende ohne Einwilligung | Nicht in öffentlichem Profil |
| Sprachkompetenz | Standard | Ja, für Matching | Im Profil anzeigen |
| Region / Kanton | Standard | Ja, für Matching | Im Profil anzeigen |
| PPI-Erfahrung (Beitragstypen, Anzahl) | Standard | Ja, Kernkomponente | Im Profil anzeigen |
| Verfügbarkeit | Standard | Ja, für Matching | Im Profil anzeigen |
| Erkrankungsbereich (Themenbereich) | Grenzfall | Nein, wenn kompetenzorientiert | Nur als Freitext-Option, nicht Pflichtfeld |
| Konkrete Diagnose | Besonders schützenswert | In einem Kompetenzmodell nicht erforderlich | Nicht erheben |
| Persönliche Krankengeschichte | Besonders schützenswert | Nicht erforderlich | Nicht erheben |

### 9.3 Hypothese 3 — Kritische Prüfung

Die Arbeitszusammenfassung behauptet, eine kompetenzorientierte Plattform sei datenschutzfreundlicher als eine diagnoseorientierte. Diese Aussage ist grundsätzlich korrekt, muss aber nuanciert werden:

**Korrekt:**  
Das Prinzip der Datensparsamkeit (Art. 6 nDSG) spricht eindeutig für einen kompetenzorientierten Ansatz. Wenn eine Plattform Diagnosen nicht erhebt und Matching auf Basis von Kompetenzen, Beitragstypen und Erfahrungsbereichen durchführt, verarbeitet sie deutlich weniger sensible Gesundheitsdaten.

**Nuancierung:**  
Kompetenz und gelebte Erfahrung implizieren oft eine Erkrankung. "Expertise im Umgang mit Typ-2-Diabetes aus Patientenperspektive" legt eine Diagnose nahe. Das nDSG schützt auch abgeleitete oder offenkundige Gesundheitsdaten. Die Plattform schützt sich nicht vollständig durch das Weglassen expliziter Diagnosefelder.

**Empfehlung:**  
Erfahrungsbereiche sollten auf der Ebene von Themenfeldern (z.B. "chronische Erkrankungen des Stoffwechsels") statt konkreter Diagnosen erfasst werden. Das reduziert den Grad der Gesundheitsdaten-Spezifität, ohne die Matching-Qualität wesentlich zu beeinträchtigen. Ein Datenschutz-Experte sollte die endgültige Taxonomie prüfen.

### 9.4 Privacy by Design — Empfehlungen

1. **Opt-in Kontaktfreigabe:** PPI-Mitwirkende erscheinen in Suchergebnissen anonym. Kontaktdaten werden erst nach expliziter Freigabe durch die Mitwirkenden an Forschende weitergegeben.

2. **Minimale Profil-Sichtbarkeit:** Das öffentliche Profil enthält nur Nicht-Identifikations-Daten. Kontaktdaten werden ausschliesslich über die Koordinationsstelle vermittelt.

3. **Granulare Einwilligung:** Klare Unterscheidung zwischen: (a) Profil im System gespeichert haben, (b) in Suchergebnissen erscheinen, (c) Kontaktfreigabe für spezifische Anfragen.

4. **Recht auf Löschung:** Vollständige Daten-Löschung auf Anfrage jederzeit möglich.

5. **DSFA durchführen:** Bereits in der Konzeptphase (nicht erst vor Go-live) eine Datenschutz-Folgenabschätzung initiieren.

6. **Kein Profiling mit hohem Risiko:** Automatisiertes Scoring oder Ranking von PPI-Mitwirkenden durch Algorithmen ist zu vermeiden, solange kein juristischer Rahmen dafür geklärt ist.

---

## 10. Technische Implikationen

### 10.1 Grundsatz: Technische Komplexität ist nicht das Problem

Die Arbeitszusammenfassung hat Recht: Das technische Problem ist lösbar. Komplexere Herausforderungen liegen in Governance, Taxonomie und Datenpflege.

Das sollte jedoch nicht dazu führen, Technologie als trivial zu betrachten. Schlechte technische Entscheide in frühen Phasen führen zu teuren technischen Schulden.

### 10.2 Anforderungen

**Funktionale Anforderungen:**
- Profilerfassung und -verwaltung für PPI-Mitwirkende
- Anfrage-Erfassung für Forschungsprojekte
- Matching-Funktion (regelbasiert, Phase 1: manuell, Phase 2: semi-automatisch)
- Opt-in Kontaktfreigabe
- Feedback-Erhebung nach Matching
- Mehrsprachigkeit (DE, FR, IT, EN)
- Zugänglichkeit (WCAG 2.1 Level AA)

**Nicht-funktionale Anforderungen:**
- Datensicherheit (Verschlüsselung, Zugangskontrolle, Audit-Logs)
- Skalierbarkeit (MVP: wenige hundert Profile; Zielsystem: mehrere tausend)
- Datenschutz by Design
- Exportierbarkeit der Daten (Vendor-Lock-in vermeiden)
- Offline-Fähigkeit für Koordinationsstelle (fallback bei Systemausfall)

### 10.3 MVP-Architektur

Für das MVP empfehlen wir einen bewusst einfachen Ansatz:

**Stufe 0 — Pre-MVP (Papier-Prototype):**  
Strukturierte Profil-Formulare (Word/PDF). Manuelle Matching-Tabelle in Excel oder Airtable. Keine Software-Entwicklung. Ziel: Taxonomie-Validierung und Prozess-Erprobung in 3-6 Monaten.

**Stufe 1 — Einfaches MVP:**  
Datenbankgestützte Profil-Verwaltung (z.B. auf Basis einer einfachen Webanwendung). Anfrage-Formular für Forschende. Koordinationsstelle führt Matching manuell durch. Einfaches Kontaktfreigabe-Workflow per E-Mail.

**Stufe 2 — Strukturiertes System:**  
Semi-automatisches Matching (Vorfilterung nach Muss-Kriterien, manuelle Endauswahl durch Koordination). Feedback-Modul. Admin-Dashboard für Koordinationsstelle. Mehrsprachige Oberfläche.

**Stufe 3 — Produktives System:**  
Vollständige Plattform mit Selbstverwaltung der Profile, automatisiertem Matching-Vorschlag und systematischem Qualitätsmonitoring.

### 10.4 Zielarchitektur

```
┌────────────────────────────────────────────────────────┐
│                    NUTZEREBENE                         │
├─────────────────────┬──────────────────────────────────┤
│  PPI-Mitwirkende    │  Forschungsteams                 │
│  (Profil-Portal)    │  (Anfrage-Portal)                │
├─────────────────────┴──────────────────────────────────┤
│              KOORDINATIONS-DASHBOARD                   │
│     (Matching, QS, Kommunikation, Reporting)           │
├────────────────────────────────────────────────────────┤
│                  KERNFUNKTIONEN                        │
│  Profil-DB │ Anfrage-DB │ Matching-Engine │ Feedback   │
├────────────────────────────────────────────────────────┤
│            QUERSCHNITTSFUNKTIONEN                      │
│  Authentifizierung │ Verschlüsselung │ Audit-Log       │
└────────────────────────────────────────────────────────┘
```

**Technologie-Empfehlung:** Keine proprietären Systeme ohne Datenexport. Open-Source-Basis bevorzugen (z.B. auf Basis von Django/Python oder ähnlichem). Hosting in der Schweiz (nDSG-Konformität). Standardisierte APIs für spätere Integration mit nationalen Forschungsregistern.

---

## 11. Risiken

### 11.1 Fachliche Risiken

**Risiko F1 — Falsches Problem gelöst (KRITISCH)**  
Wenn die Plattform hauptsächlich von Forschenden genutzt wird, die Probanden für klinische Studien suchen (anstatt PPI-Partner für Beratungsrollen), verfehlt sie ihren Zweck komplett.  
*Mitigation: Klare Positionierung und Zugangskriterien; Schulung der Forschenden; regelmässiges Monitoring der Anfrage-Typen*

**Risiko F2 — Tokenismus-Reproduktion (HOCH)**  
Eine Plattform kann Tokenismus nicht verhindern, wenn Forschende PPI-Mitwirkende nur anfragen, um Förderkriterien zu erfüllen. Die Plattform könnte Tokenismus sogar vereinfachen.  
*Mitigation: Anfragen müssen PPI-Prozessplanung nachweisen; Feedback der Mitwirkenden wird systematisch ausgewertet*

**Risiko F3 — Unzureichende Angebotssseite (HOCH)**  
Die Schweiz hat eine begrenzte Anzahl ausgebildeter PPI-Mitwirkender. Ohne aktive Rekrutierung und Onboarding-Unterstützung bleibt das Register leer.  
*Mitigation: Partnerschaft mit Patientenorganisationen, EUPATI, Gesundheitsligen; aktive Rekrutierungsstrategie*

**Risiko F4 — Taxonomie-Instabilität (MITTEL)**  
Unausgereifte Taxonomien führen zu schlechtem Matching und sinkender Plattformakzeptanz.  
*Mitigation: Pilotphase mit kleiner Nutzergruppe; iterative Taxonomie-Entwicklung; externe Fachberatung (PPI-Experten, Datenschutz)*

### 11.2 Organisatorische Risiken

**Risiko O1 — Keine nachhaltige Trägerschaft (KRITISCH)**  
Ohne klare langfristige Trägerschaft und Finanzierung wird die Plattform nach Ende der Pilotfinanzierung eingestellt. Dies schädigt das Vertrauen der PPI-Mitwirkenden dauerhaft.  
*Mitigation: Trägerschaftsfrage muss vor Projektbeginn geklärt sein; Finanzierungsplan über 5 Jahre*

**Risiko O2 — Mehrsprachigkeit unterschätzt (HOCH)**  
Ein nationales Schweizer Produkt ohne Französisch und Italienisch erreicht wesentliche Teile der Forschungslandschaft und der PPI-Mitwirkenden nicht.  
*Mitigation: Mehrsprachigkeit als MVP-Mindestanforderung festlegen, nicht als spätere Erweiterung*

**Risiko O3 — Koordinationsstelle nicht finanziert (HOCH)**  
Ohne ausreichend finanzierte Koordination degeneriert das System zu einer unvermittelten Datenbank.  
*Mitigation: Ressourcenplan für Koordinationsstelle als Bedingung für Go-live*

**Risiko O4 — Interessenkonflikte in der Governance (MITTEL)**  
Bei Multistakeholder-Governance können Interessenkonflikte (Forschungsseite vs. Patientenseite) Entscheide blockieren.  
*Mitigation: Klare Governance-Struktur mit Eskalationspfaden; Neutralität der Koordinationsstelle sicherstellen*

### 11.3 Technische Risiken

**Risiko T1 — Datenschutzverletzung (KRITISCH)**  
Eine Datenpanne bei einer Plattform, die Gesundheitsdaten verarbeitet, hat erhebliche rechtliche und reputationelle Konsequenzen.  
*Mitigation: DSFA vor Go-live; technische Sicherheitsmassnahmen; minimale Datenhaltung; regelmässige Security-Audits*

**Risiko T2 — Vendor-Lock-in (MITTEL)**  
Proprietäre Systeme ohne Datenexport binden die Plattform an einen Dienstleister.  
*Mitigation: Open-Source-Anforderung oder vertragliche Datenexport-Garantie*

**Risiko T3 — Skalierbarkeitsprobleme (NIEDRIG für MVP)**  
Bei sehr kleiner Nutzergruppe kein Problem. Bei unerwartetem Wachstum möglich.  
*Mitigation: Architektur von Anfang an auf Skalierbarkeit ausgelegt; Cloud-basiertes Hosting*

---

## 12. Empfehlungen

### 12.1 Kurzfristig (0–12 Monate)

**Priorität 1 — Klärung der Trägerschaftsfrage**  
Ohne Träger kein Projekt. Stakeholder-Analyse und Sondierungsgespräche mit potenziellen Trägern (SCTO, Patientenorganisationen-Dachverbände, SNF, Swissmedic, Kantone) müssen als erstes stattfinden.

**Priorität 2 — Entwicklung der Taxonomie**  
Vor jeder technischen Entwicklung muss die Taxonomie (Rollen, Kompetenzen, Erfahrungsbereiche, Beitragstypen) in einem strukturierten Fachprozess mit PPI-Expertinnen und -Experten, Patientenorganisationen und Forschenden erarbeitet werden. Internationale Referenztaxonomien (NIHR, PCORI, EUPATI) sind als Ausgangspunkt zu nutzen und an den Schweizer Kontext anzupassen.

**Priorität 3 — Pilotprojekt mit manuellem Matching**  
Ein 6-monatiger Pilot mit 10–20 Forschungsprojekten und 30–50 PPI-Mitwirkenden, durchgeführt manuell durch eine Koordinationsstelle. Ziel: Taxonomie-Validierung, Prozess-Erprobung, Aufdeckung unbekannter Anforderungen.

**Priorität 4 — Datenschutzkonzept**  
Rechtliche Prüfung der Plattform-Konzeption durch einen auf nDSG und HFG spezialisierten Juristen. DSFA-Vorentwurf.

**Priorität 5 — Mehrsprachigkeitskonzept**  
Festlegung, welche Sprachen von Anfang an unterstützt werden (Empfehlung: DE und FR als MVP-Minimum; IT in Phase 2).

### 12.2 Mittelfristig (12–36 Monate)

**Aufbau des MVP-Systems:** Basierend auf den Erkenntnissen des Pilots, Entwicklung einer einfachen technischen Plattform (Stufe 1/2 gemäss Abschnitt 10.3).

**Aufbau der Angebotsseite:** Aktive Partnerschaft mit Patientenorganisationen, EUPATI-Netzwerk, Gesundheitsligen. Onboarding-Unterstützung für neue PPI-Mitwirkende. Evaluation und Anpassung der Taxonomie nach dem ersten Betriebsjahr.

**Integration mit bestehender Schweizer Infrastruktur:** Anbindung an SCTO-Netzwerk, Swiss Personalized Health Network (SPHN), kantonale Ethikkommissionen (wo relevant).

**Qualitätssicherungssystem:** Implementierung des Feedback-Systems. Erste Qualitätsbericht-Erstattung an Träger.

### 12.3 Langfristig (36+ Monate)

**Skalierung:** Erweiterung auf Stufe 3-System mit semi-automatischem Matching, wenn Taxonomie stabil, Profil-Qualität hoch und Nutzerzahlen ausreichend.

**Internationale Einbindung:** Vernetzung mit europäischen PPI-Netzwerken (EUPATI-Netzwerk, PFMD, NIHR-Kooperationen). Möglichkeit, Schweizer EUPATI-Absolventinnen und -Absolventen systematisch zu erfassen.

**Wirkungsevaluation:** Systematische Messung, ob und wie PPI über die Plattform die Forschungsqualität verbessert. Publikation von Erkenntnissen.

---

## 13. Beantwortung der Kernfragen

**1. Ist die Grundidee fachlich tragfähig?**  
Ja. Der Bedarf ist real, und eine nationale PPI-Matching-Infrastruktur fehlt tatsächlich in der Schweiz. Der Ansatz ist fachlich fundierbar und schliessen an internationale Entwicklungen an. Die Tragfähigkeit ist jedoch an Vorbedingungen geknüpft: eine klare Trägerschaft, eine stabile Taxonomie und eine finanzierte Koordinationsstelle.

**2. Welches Problem wird tatsächlich gelöst?**  
Das gelöste Problem ist die strukturelle Intransparenz und die netzwerkabhängige Vermittlung von PPI-Mitwirkenden für Beratungs- und Beteiligungsrollen in der Schweizer Forschung. Die Plattform ist kein klinisches Rekrutierungsinstrument. Wer diese Unterscheidung nicht klar trifft, wird das falsche System bauen.

**3. Wie sollte ein realistisches Zielbild aussehen?**  
Realistisch und zielführend ist eine kleine, kuratierte, national zugängliche Plattform mit ~200–500 aktiven PPI-Mitwirkenden und ~30–80 Forschungsprojekten pro Jahr — unterstützt durch eine professionelle Koordinationsstelle. Nicht: ein vollautomatisches System mit tausenden Profilen. Qualität vor Quantität.

**4. Welche Mindestanforderungen sind notwendig?**
- Klare Trägerschaft mit langfristiger Finanzierung
- Stabile, mehrsprachige Taxonomie
- Professionelle Koordinationsstelle (min. 50–80 Stellenprozent)
- Datenschutzkonformes Profil- und Kontaktmodell (Privacy by Design)
- Aktiver Aufbau der Angebotsseite durch Partnerschaft mit Patientenorganisationen
- Mehrsprachigkeit (DE/FR minimum)

**5. Wie könnte ein MVP aussehen?**  
MVP = manuell kuratierte Datenbank (kein komplexes System), betrieben durch eine Koordinationsstelle. Strukturierte Profil-Formulare, strukturierte Anfrage-Formulare, manuelles Matching, E-Mail-basierte Kontaktfreigabe. Laufzeit 12 Monate, 30–50 Mitwirkende, 10–20 Projekte. Ziel: Taxonomie-Validierung und Prozesslernen, nicht Skalierung.

**6. Welche Risiken wurden bisher unterschätzt?**
- **Marktgrösse**: Der Pool ausgebildeter PPI-Mitwirkender in der Schweiz ist klein. Die Plattform muss aktiv Angebote aufbauen, nicht passiv warten.
- **Mehrsprachigkeit**: Für eine nationale Schweizer Lösung ist dies eine Grundvoraussetzung, keine Option.
- **Koordinationsstelle**: Die Arbeitszusammenfassung geht implizit von einem selbstlaufenden System aus. Das ist nicht realistisch.
- **Tokenismus-Risiko**: Die Plattform könnte Tokenismus vereinfachen, wenn sie keine Qualitätsmechanismen enthält.
- **Trägerschaft und Nachhaltigkeit**: Ohne gesichertes Finanzierungsmodell über 5+ Jahre wird jede Plattform zu einem Risiko für das Vertrauen der PPI-Mitwirkenden.

**7. Welche Annahmen sollten bestätigt, angepasst oder verworfen werden?**  
Siehe Abschnitt 14.

---

## 14. Kritische Prüfung der Arbeitshypothesen

### Hypothese 1 — "Die Plattform vermittelt primär Perspektiven, Erfahrungen und Kompetenzen und nicht Personen."

**Urteil: Teilweise korrekt — als Designprinzip wertvoll, als operative Aussage unvollständig.**

**Was korrekt ist:**  
Als Framing und Designprinzip ist die Aussage richtig und strategisch wertvoll. Sie verhindert, dass die Plattform zu einem Diagnose-Register degeneriert. Sie fokussiert die Taxonomie auf Beitragskompetenzen statt auf Krankheitsbilder. PCORI, SPOR und EUPATI bestätigen alle, dass kompetenz- und rollenorientierte PPI-Frameworks die richtungsweisenden internationalen Standards sind.

**Was fehlt:**  
Perspektiven und Kompetenzen können nicht von Personen abstrahiert werden. Am Ende sucht ein Forschungsteam eine konkrete Person, die an einem Meeting teilnimmt, ein Dokument reviewt oder in einem Gremium mitarbeitet. Die Plattform vermittelt Personen — auf Basis ihrer Kompetenzen, nicht ihrer Diagnosen. Die Formulierung "nicht Personen" ist irreführend und kann zu falschen Erwartungen an die technische Umsetzung führen.

**Empfehlung:** Anpassen zu: "Die Plattform vermittelt Personen auf Basis ihrer Perspektiven, Erfahrungen und Kompetenzen — nicht auf Basis ihrer Diagnosen."

### Hypothese 2 — "Perspektive, Erfahrung, PPI-Kompetenz und Rahmenbedingungen bilden die zentralen Matching-Dimensionen."

**Urteil: Grundsätzlich korrekt, aber unvollständig. Zwei wichtige Dimensionen fehlen.**

**Was korrekt ist:**  
Die vier genannten Dimensionen sind relevante und gut begründbare Matching-Dimensionen. Sie finden Entsprechung in internationalen Frameworks (PCORI Engagement Rubric, SPOR Framework, EUPATI-Kompetenzmodell).

**Was fehlt:**
1. **Beitragstyp / Aufgabenformat**: Was soll die Person konkret tun? (Review, Advisory Board, Fokusgruppe, Steering Committee). Dies ist für das Matching mindestens so wichtig wie die Kompetenz-Dimension.
2. **Forschungsphase**: In welchem Stadium des Forschungsprozesses wird PPI benötigt? Dies bestimmt massgeblich, welche Kompetenzen und Perspektiven gefragt sind.

**Empfehlung:** Zwei weitere Dimensionen ergänzen. Das Modell sollte sechs Dimensionen umfassen: Beitragstyp, Forschungsphase, Perspektive, Erfahrung, PPI-Kompetenz, Rahmenbedingungen.

### Hypothese 3 — "Eine kompetenzorientierte Plattform ist datenschutzfreundlicher als eine diagnoseorientierte Plattform."

**Urteil: Korrekt in der Richtung — aber rechtlich differenziert zu betrachten.**

**Was korrekt ist:**  
Das Prinzip der Datensparsamkeit (Art. 6 nDSG) spricht klar für das kompetenzorientierte Modell. Wenn keine Diagnosen erhoben werden, werden weniger besonders schützenswerte Personendaten verarbeitet. Diese Aussage ist fachlich und rechtlich plausibel.

**Was zu nuancieren ist:**  
Kompetenzen im Kontext von Erkrankungserfahrung implizieren oft eine Erkrankung. "Ich habe Erfahrung mit der Perspektive von Parkinson-Betroffenen" ist de facto eine Diagnose-Angabe. Das nDSG schützt auch ableitbare Gesundheitsinformationen. Die Plattform ist datenschutzfreundlicher, aber nicht datenschutzfrei.

**Empfehlung:** Hypothese bestätigen mit der Nuancierung, dass (a) die Taxonomie auf Erfahrungsbereiche (Themenfelder) statt spezifische Diagnosen ausgerichtet wird und (b) ein vollständiges Datenschutzkonzept unabhängig vom gewählten Matching-Modell erforderlich ist.

### Hypothese 4 — "Die grösste Herausforderung liegt in Governance, Datenqualität und Taxonomien und nicht in der Technik."

**Urteil: Stark belegt und zu bestätigen.**

**Evidenzbasis:**
- NIHR Be Part of Research: 528.000 registriert, aber nur 50.000 aktiv. Das ist ein Governance- und Engagement-Problem, kein Technik-Problem.
- ResearchMatch: 1 von 5 Kontaktierungen führt zu einer Antwort. Das ist ein Engagement- und Datenpflege-Problem.
- Klinische Trial-Registries (z.B. CTRI, 2019 evaluiert): Datenfehler entstehen durch Nutzer-Self-Reporting ohne ausreichende Validierung.
- PPI-Literatur allgemein: Tokenismus ist ein Governance- und Prozess-Problem, kein Technologie-Problem.
- CUE-Modell: Funktioniert gut — mit einem Menschen in der Koordinationsrolle, nicht dank Algorithmus.

**Empfehlung:** Hypothese bestätigen. Budgetplanung und Projektzeitplan sollten diese Priorität widerspiegeln: Mindestens 60% der Ressourcen für Governance, Taxonomie-Entwicklung und Koordinationsstelle; maximal 40% für technische Entwicklung.

---

## 15. Quellennachweis

### Primäre Quellen (verifiziert)

**Internationale PPI-Rahmenwerke:**
- NIHR (UK): Be Part of Research — https://bepartofresearch.nihr.ac.uk/ (Stand: 2025, 528.389 registrierte Freiwillige)
- NIHR: PPI Resource Pack for Senior Investigators — https://www.nihr.ac.uk/patient-and-public-involvement-and-engagement-resource-pack-senior-investigators
- CIHR/SPOR: Strategy for Patient-Oriented Research — Patient Engagement Framework — https://cihr-irsc.gc.ca/e/48413.html
- PCORI: Engagement Rubric — https://www.pcori.org/sites/default/files/Engagement-Rubric.pdf (2016)
- EUPATI: Guidelines on Patient Involvement — PMC6236003 — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6236003/
- EUPATI: Patient Expert Training Programme Guidelines 2023-2024 — https://learning.eupati.eu/

**Wissenschaftliche Publikationen:**
- Johnson et al. (2025): Understanding the Scope, Intent and Extent of Published Conceptual Frameworks for PPI. Health Expectations. DOI: 10.1111/hex.70425
- Røssvoll et al. (2023): Patient and public involvement in health research from researchers' perspective. Health Expectations. PMC10632614
- Systematic review on benefits, challenges, and best practice for PPI in evidence synthesis (2023). PMC10349234
- Evaluation of public involvement in research: time for a major re-think? PMC4904347
- From tokenism to empowerment: progressing patient and public involvement (Ocloo & Matthews). PMC4975844
- BMC Medicine (2020): Patient and public involvement in research — from tokenistic box ticking to valued team members. DOI: 10.1186/s12916-020-01544-7
- Frameworks for supporting PPI in research: systematic review (2019). PMC6737756
- ResearchMatch: a national registry to recruit volunteers for clinical research. PubMed 22104055

**Plattformen:**
- ResearchMatch — https://www.researchmatch.org/
- Antidote.me — https://www.antidote.me/
- NIHR Be Part of Research — https://bepartofresearch.nihr.ac.uk/

**Schweizer Kontext:**
- Swiss Personalized Health Network (SPHN) — Wikipedia / SPHN.ch (CHF 20.7M für 2025-2028, staatliche Förderung durch SBFI und BAG)
- nDSG: neues Datenschutzgesetz, in Kraft seit 1. September 2023 — https://www.sidd.swiss/einblicke/schweizer-datenschutzgesetz-leitfaden/
- nDSG für Gesundheitswesen — https://www.hin.ch/de/blog/2023/ndsg-gesundheitswesen-teil-1.cfm
- nDSG besonders schützenswerte Personendaten — https://www.pwc.ch/de/insights/regulierung/besonders-schuetzenswerte-personendaten.html

**Klinische Studienrekrutierung (Kontextwissen):**
- Successes and Challenges in Clinical Trial Recruitment (PMC11348161)
- 5 common clinical trial patient recruitment challenges — https://www.antidote.me/blog/5-common-clinical-trial-patient-recruitment-challenges-and-solutions
- Current challenges in clinical trial patient recruitment and enrollment — ResearchGate

### Abgrenzung: Quellen, die nicht verfügbar waren

Die folgenden Quellen konnten aufgrund von Zugangsbeschränkungen (HTTP 403) nicht direkt abgerufen werden. Die verwendeten Informationen basieren auf publizierten Abstracts, Suchresultaten und Wikipedia-Zusammenfassungen:
- Volltext PMC-Artikel (PMC10632614, PMC10349234, PMC6737756)
- Volltext NIHR Be Part of Research Webseiten
- Volltext SCTO-Webseiten (keine öffentliche Seite zu Patient Engagement gefunden)
- PFMD-Kompetenztaxonomie (kein direkter Zugang)

Wo Informationen aus Suchresultaten und Wikipedia entnommen wurden, ist dies durch die Formulierung erkennbar. Fakten, die nicht durch mindestens eine verifizierbare Quelle belegt werden konnten, wurden als Annahmen oder Schlussfolgerungen markiert.

---

*Fachkonzept V1 | Nationale PPI-Matching-Plattform Schweiz | Stand: 17. Juni 2026 | Entwurf zur Diskussion*

*Dieses Konzept wurde auf Basis einer vertieften Recherche und kritischen Analyse erstellt. Es ist als Diskussionsgrundlage zu verstehen und ersetzt keine rechtliche, regulatorische oder medizinische Fachberatung. Die Inhalte sind periodisch zu aktualisieren, da sich das internationale PPI-Umfeld und die Schweizer Gesetzgebung weiterentwickeln.*
