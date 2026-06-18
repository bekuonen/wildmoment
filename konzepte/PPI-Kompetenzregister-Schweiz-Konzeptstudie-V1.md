# Nationales PPI-Kompetenz- und Engagementregister Schweiz
## Konzeptstudie V1

**Datum:** 18. Juni 2026  
**Status:** Konzeptphase — keine technische Umsetzung  
**Ausgangslage:** Weiterentwicklung der Überlegungen zur nationalen PPI-Matching-Plattform  
**Kernfrage:** Ist ein nationales PPI-Kompetenz- und Engagementregister ein sinnvoller, realistischer und finanzierbarer erster Schritt für die Schweiz?

---

## Inhalt

1. Executive Summary
2. Problemdefinition
3. Zielbild
4. Nutzenanalyse
5. Fachmodell
6. Datenmodell
7. Datenschutzanalyse (Schweiz)
8. Technische Architekturvarianten
9. Risiken
10. Empfehlungen
11. Kritische Würdigung der Grundidee
12. Schlussfrage: Register als erster Schritt?
13. Quellenverzeichnis

---

## 1. Executive Summary

**Die Ausgangshypothese ist fachlich tragfähig — mit vier Bedingungen.**

Ein nationales PPI-Kompetenz- und Engagementregister löst ein reales Problem: die gegenseitige Unsichtbarkeit zwischen PPI-willigen Personen und Forschenden in der Schweiz. Es ist proportionaler, schneller umsetzbar und günstiger als eine vollständige Matching-Plattform oder Clearingstelle.

Die internationale Evidenz belegt jedoch: Ein Register allein genügt nicht. NIHR Be Part of Research (UK) hat über 528.000 registrierte Personen — aber nur etwa 9,5 % haben je an einer Studie mitgewirkt (NIHR, September 2024). Im Vergleich dazu erreicht Join Dementia Research, ein krankheitsspezifisches Register mit aktiver Community, eine Aktivierungsrate von 67,9 % (PMC8659591, 2022).

Der Unterschied liegt nicht in der Technologie, sondern in der Community-Arbeit.

**Vier Bedingungen für ein funktionierendes Register:**

1. **Community vor Technologie.** Das Register wächst durch Vertrauen und persönliche Ansprache — nicht durch Registrierungsformulare.
2. **Thematische Fokussierung.** Ein breites Register (alle Erkrankungen, alle Kantone) aktiviert niemanden. Ein fokussiertes Register (3–5 Themenfelder) funktioniert.
3. **Datenschutz als Designprinzip.** Jedes Profil, das Erfahrungen mit Erkrankungen beschreibt, enthält implizite Gesundheitsdaten im Sinne des nDSG und der Rechtsprechung des EuGH. Das Alias-Modell ist die einzige datenschutzrechtlich belastbare Minimal-Architektur.
4. **Koordination mit SCTO.** Die Swiss Clinical Trial Organisation hat 50+ PPI-Initiativen kartiert (SCTO PPI Mapping, 2023) und baut nationale Infrastruktur auf. Parallelentwicklung ohne Koordination ist Ressourcenverschwendung.

**Fazit:** Ja, ein Register ist ein sinnvoller erster Schritt — aber nur wenn es als Community-Projekt konzipiert wird, nicht als Datenbank-Projekt. Technologie ist das letzte Problem, nicht das erste.

---

## 2. Problemdefinition

### 2.1 Das tatsächlich gelöste Problem

Die Arbeitshypothese benennt Sichtbarkeit als das zentrale Problem. Die Analyse zeigt: Es sind drei strukturell verschiedene Sichtbarkeitsprobleme, die unterschiedliche Lösungen brauchen.

**Problem 1 — Gegenseitige Unsichtbarkeit**

Forschende in der Schweiz wissen nicht, welche Personen bereit und in der Lage wären, PPI-Beiträge zu leisten. PPI-willige Personen wissen nicht, wie und wo sie sich einbringen können. Diese Unsichtbarkeit ist das primäre Problem. Ein Register löst es direkt.

Evidenz: Die SCTO-PPI-Mapping-Studie (2023) identifizierte 50+ PPI-Initiativen in der Schweiz — aber ohne systematischen Überblick über die beteiligten Personen oder ihre Kompetenzen. Der SNF empfiehlt PPI für geförderte Projekte, ohne jedoch auf bestehende Infrastruktur zu verweisen (SNF PPI Factsheet, 2024).

**Problem 2 — Fehlende Kompetenzlandkarte**

Selbst wenn Forschende PPI-willige Personen kennen, wissen sie nicht, welche Beitragskompetenzen diese mitbringen. Wer hat EUPATI-Ausbildung? Wer hat Erfahrung mit Studienprotokoll-Reviews? Wer spricht Französisch und Deutsch und ist für Online-Teilnahme verfügbar?

Ein Register mit strukturiertem Profil löst dieses Problem. Freitext-Datenbanken oder informelle Netzwerke lösen es nicht.

**Problem 3 — Nicht vorhandene datenschutzkonforme Kontaktinfrastruktur**

Selbst wenn Forschende jemanden finden, fehlt ein datenschutzkonformer Weg zur ersten Kontaktaufnahme. Direkte E-Mail-Weitergabe ohne Einwilligung ist unter dem nDSG problematisch. Ein Register kann dieses Problem durch eine opt-in-basierte Kontaktanbahnung lösen.

### 2.2 Was das Register nicht löst

- **Qualität der PPI-Beteiligung:** Ein Register macht Personen sichtbar — es stellt keine Qualität des Matchings sicher. Ein Projekt, das jemanden mit falscher Perspektive einbindet, hat tokenistisches PPI produziert, nicht gutes.
- **Nachhaltige Einbindung:** Registrierung ist kein Engagement. Die Lücke zwischen Registrierung und aktivem Beitrag ist gut belegt und bleibt ein Problem.
- **Organisationsrepräsentation:** Kollektive Interessenvertretung (Typ B, Patientenorganisationen) kann ein Register nicht ersetzen.

### 2.3 Schweizer Kontext

Die Schweiz hat keine nationale PPI-Registrierungsinfrastruktur. Der SNF fördert PPI in Forschungsprojekten (SNF PPI Factsheet, 2024), die SCTO koordiniert und kartiert PPI-Aktivitäten (SCTO PPI Mapping), aber weder SNF noch SCTO betreiben ein Verzeichnis von PPI-Mitwirkenden.

Das Ökosystem ist:
- Klein (50–150 PPI-relevante Projekte/Jahr, Schätzung Vorarbeit V3)
- Fragmentiert (Initiativen an Universitätsspitälern, Patientenorganisationen, Forschungsinstitutionen ohne zentrale Koordination)
- Grundsätzlich bereit (SCTO-Mapping belegt aktive Initiativen)
- Noch nicht vernetzt (keine gemeinsame Infrastruktur)

---

## 3. Zielbild

### 3.1 Was ein Register leisten soll

Ein PPI-Kompetenz- und Engagementregister ist eine strukturierte, datenschutzkonforme Sammlung von Profilen von Personen, die bereit sind, ihre Erfahrungen, Perspektiven und Kompetenzen in PPI-Prozesse einzubringen.

**Das Register macht sichtbar:**

| Sichtbarkeitsdimension | Konkrete Information |
|---|---|
| Erfahrungsperspektive | Welche Lebenserfahrung bringt die Person mit? (Erkrankungsbereich, Versorgungserfahrung) |
| Beitragskompetenzen | Was kann die Person tun? (Protokoll-Review, Fokusgruppe, Beirat) |
| PPI-Expertise | Welche Ausbildung / welchen Erfahrungshintergrund hat die Person? |
| Verfügbarkeit | Wann und in welchem Format ist die Person verfügbar? |
| Sprachen | Welche Sprachen werden gesprochen? |
| Region | Wo ist die Person geografisch verortet? |

**Das Register ermöglicht:**
- Selbstverwaltung der Profile durch Registrierte
- Opt-in-basierte Kontaktanfragen durch Forschende
- Dokumentation vergangener PPI-Engagements (Portfolio)
- Freiwillige Vernetzung innerhalb des Registers

**Das Register leistet bewusst nicht:**
- Automatisiertes Matching ohne menschliche Prüfung
- Qualitätszertifizierung von PPI-Beiträgen
- Vermittlung kollektiver Interessenvertretung (diese Funktion verbleibt bei Patientenorganisationen)
- Ergebnismonitoring von PPI-Beteiligungen

### 3.2 Abgrenzung zum Vorgänger-Konzept (Clearingstelle)

Die in V3 entwickelte Clearingstelle hat eine aktive Vermittlungsfunktion: Sie nimmt Anfragen entgegen, klärt den Bedarf, sucht aktiv passende Personen und begleitet die Zusammenarbeit. Das ist ein Vollzeitjob-Äquivalent (20–30 Stellenprozent).

Das Register ist passiver: Es schafft die Voraussetzung dafür, dass Forschende selbst suchen und direkt Kontakt aufnehmen können. Es braucht eine leichtere Betriebsinfrastruktur (5–10 Stellenprozent für Pflege, Moderation, Qualitätssicherung).

Beides schliesst sich nicht aus. Das Register kann die Phase-1-Infrastruktur sein, auf der eine spätere Clearingstelle aufbaut.

```
Phase 1 — Register:          Phase 2 — Clearingstelle:
Sichtbarkeit schaffen        Aktive Vermittlung
Selbstorganisation           Moderierte Zusammenarbeit
Infrastruktur aufbauen       Prozessbegleitung
5–10 Stellenprozent          20–30 Stellenprozent
```

### 3.3 Prüfung der Grundhypothese

> "Die Plattform macht Erfahrungen, Perspektiven, Kompetenzen, Engagements und Beteiligungsbereitschaft von PPI-Mitwirkenden sichtbar und unterstützt die datenschutzkonforme Kontaktanbahnung innerhalb des Schweizer PPI-Ökosystems."

**Prüfung:**

| Aspekt | Bewertung |
|---|---|
| "Erfahrungen sichtbar machen" | Fachlich korrekt — ist die Kernleistung eines Registers. Umsetzbar. |
| "Perspektiven sichtbar machen" | Korrekt — wenn Perspektivtyp als Profil-Dimension erfasst wird. |
| "Kompetenzen sichtbar machen" | Korrekt — setzt jedoch eine validierte Taxonomie voraus, die noch entwickelt werden muss. |
| "Engagements sichtbar machen" | Korrekt — als optionales Portfolio-Element. Nicht als Pflichtfeld. |
| "Beteiligungsbereitschaft sichtbar machen" | Korrekt — ist der einfachste Teil (binäre Bereitschaftsangabe + Verfügbarkeit). |
| "Datenschutzkonforme Kontaktanbahnung" | Korrekt als Ziel — aber datenschutzrechtlich anspruchsvoll. Braucht explizite Einwilligung, Alias-Option und DSFA. |
| "Innerhalb des Schweizer PPI-Ökosystems" | Richtige Einschränkung — kein Anspruch auf internationale Vermittlung. |

**Ergebnis:** Die Hypothese ist fachlich tragfähig. Sie muss jedoch um drei Präzisierungen ergänzt werden: (1) Taxonomie muss bestehenden Frameworks folgen, (2) Datenschutz-by-Design von Anfang an, (3) Koordination mit SCTO als Grundbedingung.

---

## 4. Nutzenanalyse

### 4.1 Nutzen für PPI-Mitwirkende

**Sichtbarkeit und Anerkennung**

Das grösste Hemmnis für PPI-Beteiligung ist laut NIHR-Forschung (Oxford BRC Guide, 2017) die mangelnde Bekanntheit von Beteiligungsmöglichkeiten, nicht mangelnde Bereitschaft. Ein Register löst das Bekanntheitsproblem für jene, die sich bereits registriert haben — es löst es nicht für jene, die noch nicht wissen, dass es PPI gibt.

Für registrierte Personen: Anerkennung durch Sichtbarkeit, Möglichkeit, Kompetenzen zu dokumentieren und ein PPI-Portfolio aufzubauen. Dies ist besonders wertvoll für Typ-C-Mitwirkende (EUPATI Fellows, erfahrene PPI-Experten), deren Kompetenzprofil anderweitig nicht systematisch dokumentiert wird.

**Vernetzung**

Ein Register kann (optional) Vernetzung innerhalb der Community ermöglichen: Wer ähnliche Erfahrungsbereiche hat, kann sich austauschen. Dies ist eine Nebenfunktion — kein Kern des Registers.

**Kompetenzentwicklung**

Indirekt: Durch die Taxonomie-Struktur des Registers erfahren Mitwirkende, welche Beitragsformen existieren und welche Kompetenzen für welche Beiträge relevant sind. Das hat eine orientierungsstiftende Funktion, auch wenn das Register selbst keine Ausbildung anbietet.

**Kritische Bewertung:**

Der Hauptnutzen für Mitwirkende ist gering, wenn das Register inaktiv ist. Ein Profil in einem Register, das niemand besucht, bringt nichts. Der Nutzen entsteht erst, wenn Forschende das Register aktiv nutzen und Kontaktanfragen eingehen. Dies ist die klassische Henne-Ei-Problematik zweiseitiger Register.

### 4.2 Nutzen für Forschende

**Primärnutzen: Auffindbarkeit**

Forschende gewinnen erstmals einen strukturierten Zugang zu PPI-willigen Personen in der Schweiz. Bisher ist dies nur über persönliche Netzwerke, Patientenorganisationen oder ad-hoc-Ausschreibungen möglich — mit jeweils hohem Transaktionsaufwand.

**Sekundärnutzen: Kompetenz-Transparenz**

Das Profil zeigt nicht nur Bereitschaft, sondern auch Beitragskompetenzen, Verfügbarkeit und Sprachkenntnisse. Dies erlaubt eine zielgerichtete Anfrage statt eines Gieskannen-Ansatzes.

**Kritische Bewertung:**

Forschende nutzen Register nur, wenn die Suche einfacher ist als bestehende Alternativen (Netzwerk, Patientenorganisationen). Dies ist nicht selbstverständlich. Ein Register mit 20 Profilen bietet weniger Wert als ein persönliches Netzwerk. Kritische Masse ist Voraussetzung für Forschenden-Nutzen.

### 4.3 Nutzen für Patientenorganisationen und Institutionen

Patientenorganisationen gewinnen einen Überblick über das PPI-Kompetenzprofil ihrer Mitglieder und der Schweizer PPI-Community insgesamt. Sie können Mitglieder auf die Registrierungsmöglichkeit hinweisen.

Forschungsinstitutionen (Universitätsspitäler, SNF-Abteilungen) erhalten ein Argument für strukturierteres PPI: statt "wir haben informell jemanden gefragt" kann nun "wir haben das nationale Register konsultiert" dokumentiert werden.

### 4.4 Nutzen für das PPI-Ökosystem

**Kompetenzlandkarte:** Das Register erzeugt aggregierte, anonymisierte Erkenntnisse: Wie viele EUPATI Fellows gibt es in der Schweiz? In welchen Erkrankungsbereichen gibt es viele, in welchen wenige PPI-willige Personen? Welche Regionen sind unterversorgt?

**Nachwuchsförderung:** Durch Sichtbarkeit entsteht Nachfrage. Durch Nachfrage entstehen Engagementmöglichkeiten. Durch Engagementmöglichkeiten wächst PPI-Kompetenz.

**Quantifizierter Vergleich:** Wo Ökosysteme mit aktiver Register-Infrastruktur funktionieren (JDR, UK), ist PPI in Forschungsanträgen signifikant häufiger dokumentiert. In Journals mit strikter PPI-Reporting-Anforderung (BMJ) ist PPI-Rate von 5,9 % (2015) auf 44,4 % (2022) gestiegen (Journal of Clinical Epidemiology, 2024).

### 4.5 Hauptnutzen-Bewertung

**Wer hat tatsächlich den Hauptnutzen?**

Kurzfristig: **Forschende** — wenn das Register Auffindbarkeit von PPI-Mitwirkenden erleichtert.  
Mittelfristig: **PPI-Mitwirkende** — wenn durch das Register mehr und bessere Engagementmöglichkeiten entstehen.  
Langfristig: **Das Ökosystem** — wenn das Register Transparenz und Qualitätsentwicklung der Schweizer PPI-Praxis unterstützt.

Der Risikofall: Das Register hat keinen Hauptnutzen-Träger, weil keine Seite es aktiv nutzt (Aktivierungsproblem).

---

## 5. Fachmodell

### 5.1 Perspektivtypen als Grundstruktur

Das Register übernimmt die in der Modellkorrektur (PPI-Modellkorrektur-Patientenorganisationen.md) entwickelte Typisierung. Nicht alle PPI-Mitwirkenden sind gleich — das Register muss drei grundlegend verschiedene Profile unterscheiden:

| Typ | Bezeichnung | Zugang | Org-Mitgliedschaft |
|---|---|---|---|
| A | Gelebte Erfahrung (Lived Experience) | Direkt | Nicht erforderlich |
| B | Kollektive Vertretung | Via Patientenorganisation | Konstitutiv |
| C | PPI-Expertise (Expert Engagement) | Direkt | Optional |

**Typ A** registriert sich selbst, ohne Organisationsmitgliedschaft. Spricht ausschliesslich für sich selbst.  
**Typ B** wird durch Patientenorganisations-Profile repräsentiert, nicht durch Einzelpersonen. Das Register enthält für Typ B Organisationsprofile, keine Personenprofile.  
**Typ C** registriert sich selbst. Hat ausgebildetes PPI-Fachwissen (z.B. EUPATI Fellow, langjährige Erfahrung in Steering Committees).

### 5.2 Individuelle Profile (Typ A und C)

Das Profil orientiert sich an den validierten Feldern des NIHR Oxford Nuffield PPI Register (phc.ox.ac.uk) und ist an den Schweizer Kontext angepasst.

#### Pflichtfelder

| Feld | Format | Anmerkung |
|---|---|---|
| Perspektivtyp (A / C) | Auswahl | Selbstangabe; erklärender Text vorhanden |
| Erfahrungsbereich | Mehrfachauswahl (Taxonomie) | ICD-10-Kapitel als Grundlage, vereinfacht |
| Beitragstypen | Mehrfachauswahl (Taxonomie) | Aus validierter PPI-Beitragsklassifikation |
| Sprachen | Mehrfachauswahl | DE, FR, IT, EN + weitere |
| Region | Kanton oder Sprachregion | Kantonsauswahl oder D/F/I/R |
| Format-Präferenz | Mehrfachauswahl | Online / Hybrid / Präsenz |
| Verfügbarkeit (grob) | Auswahl | < 2h/Monat / 2–8h / > 8h |
| Bereitschaftsstatus | Binär (aktiv / inaktiv) | Selbst aktualisiert |

#### Optionale Felder

| Feld | Format | Anmerkung |
|---|---|---|
| PPI-Expertise (Typ C) | Freitext (begrenzt) | EUPATI-Status, Erfahrung, Ausbildungen |
| Engagementportfolio | Strukturierte Einträge | Siehe Abschnitt 5.3 |
| Verbundene Organisation | Freitext (optional) | Für Mitwirkende die auch Org-Mitglied sind |
| Kurzprofil | Freitext, max. 300 Zeichen | Persönliche Beschreibung der eigenen Perspektive |
| Erreichbarkeit | Opt-in | Kontaktanfragen via Register erlaubt (Ja/Nein) |

**Nicht enthaltene Felder:**
- Vollanschrift (nur Kanton / Sprachregion)
- Arbeitgeber / Institution
- Diagnose-Informationen (Erfahrungsbereich ersetzt Diagnose)
- Behandlungsdetails
- Soziodemografische Pflichtangaben

#### Alias-Option

Registrierte können einen Alias verwenden. Im Register erscheint der Alias, nicht der bürgerliche Name. Reale Identität ist nur bei Kontaktaufnahme über den opt-in-Kanal sichtbar und nur nach eigener Freigabe.

### 5.3 Engagementportfolio

Freiwillige Dokumentation abgeschlossener oder laufender PPI-Engagements. Dient der Kompetenz-Sichtbarkeit und dem persönlichen Nachweis.

| Feld | Format | Pflicht |
|---|---|---|
| Themenbereich | Aus Taxonomie | Ja (bei Portfolio-Eintrag) |
| Beitragstyp | Aus Taxonomie | Ja |
| Jahr | Jahreszahl | Ja |
| Status | Abgeschlossen / Laufend / Unterbrochen | Ja |
| Organisation | Freitext, optional | Nein |
| Kurzbeschreibung | Max. 200 Zeichen | Nein |

Das Portfolio enthält keine Bewertungen oder Qualitätsurteile. Es ist ein Selbstauskunft-Instrument.

### 5.4 Organisationsprofile (Typ B)

Patientenorganisationen sind im Register als Organisationen erfasst, nicht als Personenaggregate.

| Feld | Format |
|---|---|
| Organisationsname | Freitext |
| Themenfeld(er) | Mehrfachauswahl (Taxonomie) |
| Kontaktperson für PPI | Name + Kontakt |
| Sprachregion(en) | Mehrfachauswahl |
| Kurzbeschreibung | Max. 300 Zeichen |
| Website | URL |
| Aktiv für PPI-Anfragen | Ja/Nein |

Organisationsprofile sind keine Substitute für Personenprofile. Sie lösen das Problem der kollektiven Repräsentation (Typ B), nicht das Problem der gelebten Erfahrung (Typ A).

### 5.5 Taxonomien

Das Register braucht valide, wartbare Taxonomien. Zu entwickeln auf Basis bestehender Frameworks:

**Erfahrungsbereiche (Erkrankungsfelder)**

Empfohlen: vereinfachte ICD-10-Kapitel (18 Hauptkategorien) + relevante Querschnittsthemen (Seltene Erkrankungen, Chronische Erkrankungen, Psychische Gesundheit, Pflege/Caregiving). Keine Diagnosen, keine ICD-Codes in Profilen — nur Kapitel-Ebene.

Beispiel: Nicht "Diabetes mellitus Typ 2" (ICD E11), sondern "Erkrankungen des endokrinen Systems und Stoffwechsel".

**Beitragstypen**

Abgeleitet aus GRIPP2 Short Form (Staniszewska et al., 2017, PMC5539518) und INVOLVE-Klassifikation:

| Beitragstyp | Ebene | Beispiel |
|---|---|---|
| Fokusgruppe / Interview | Konsultation | Feedbackrunde zur Forschungsfrage |
| Patienteninformation-Review | Konsultation | Überprüfung von Informationsmaterialien |
| Protokoll-Review | Mitarbeit | Rückmeldung zu Studienprotokoll |
| Advisory Board | Beteiligung | Wissenschaftlicher Beirat |
| Steering Committee | Partnerschaft | Steuerungsgremium |
| Prioritätensetzung | Partnerschaft | Forschungspriorisiierungsprozess (z.B. JLA) |
| Co-Forschung | Partnerschaft | Aktive Mitwirkung in Forschungsprojekt |
| Regulatorische Konsultation | Expert Engagement | EMA, Swissmedic, HTA |
| Öffentlichkeitsarbeit | Kommunikation | Laiensummaries, Medienarbeit |

**Forschungsphasen** (optional als Zusatzfeld)

Konzeption / Planung → Protokoll / Design → Durchführung / Rekrutierung → Datenanalyse → Dissemination / Wissenstransfer

---

## 6. Datenmodell

### 6.1 Grundprinzipien

- **Taxonomiebasiert:** Freitext so weit wie möglich durch Auswahlfelder ersetzen
- **Selbstverwaltung:** Profile werden ausschliesslich durch die registrierten Personen gepflegt
- **Minimaldatenerhebung:** Kein Feld, das nicht einem klaren Zweck dient
- **Alias-First:** Reale Identität nie öffentlich, nur nach expliziter Freigabe für konkrete Kontaktanfragen
- **Kein kontinuierliches Tracking:** Keine Verhaltens- oder Nutzungsdaten der Registrierten

### 6.2 Entitäten

#### Tabelle: Profile

```
Profile
├── id (intern, nicht öffentlich)
├── alias (öffentlich sichtbarer Name)
├── perspektiv_typ (A | C)
├── erfahrungsbereiche (Array, FK → Taxonomie_Erfahrungsfelder)
├── beitragstypen (Array, FK → Taxonomie_Beitragstypen)
├── sprachen (Array, FK → Taxonomie_Sprachen)
├── region (FK → Taxonomie_Regionen)
├── format_praeferenz (Array: online | hybrid | praesenz)
├── verfuegbarkeit (enum: minimal | moderat | aktiv)
├── bereitschaftsstatus (bool: aktiv | inaktiv)
├── kontaktanfragen_erlaubt (bool)
├── kurzprofil (text, max. 300 Zeichen, optional)
├── ppi_expertise_text (text, max. 500 Zeichen, optional, nur Typ C)
├── verbundene_organisation (text, optional)
├── erstellt_am (date)
├── zuletzt_aktualisiert (date)
└── [verschlüsselt, nur intern]
    ├── echter_name (text, optional)
    └── kontakt_email (text)
```

#### Tabelle: Engagements (Portfolio)

```
Engagements
├── id
├── profil_id (FK → Profile)
├── themenbereich (FK → Taxonomie_Erfahrungsfelder)
├── beitragstyp (FK → Taxonomie_Beitragstypen)
├── jahr (integer)
├── status (abgeschlossen | laufend | unterbrochen)
├── organisation (text, optional)
└── kurzbeschreibung (text, max. 200 Zeichen, optional)
```

#### Tabelle: Organisationen (Typ B)

```
Organisationen
├── id
├── name (text)
├── themenfelder (Array, FK → Taxonomie_Erfahrungsfelder)
├── kontakt_name (text)
├── kontakt_email (text)
├── sprachregionen (Array, FK → Taxonomie_Regionen)
├── kurzbeschreibung (text, max. 300 Zeichen)
├── website (URL)
├── aktiv_fuer_anfragen (bool)
├── erstellt_am (date)
└── zuletzt_aktualisiert (date)
```

#### Tabelle: Taxonomien (Verwaltungstabellen)

```
Taxonomie_Erfahrungsfelder (id, label_de, label_fr, label_it, label_en, icd10_kapitel, aktiv)
Taxonomie_Beitragstypen (id, label_de, label_fr, label_it, label_en, ebene, beschreibung_de, aktiv)
Taxonomie_Sprachen (id, iso_code, label_de)
Taxonomie_Regionen (id, kuerzel, sprachregion, label_de)
```

### 6.3 Nicht-Entitäten (bewusste Entscheidungen)

**Keine Matching-Tabelle:** Matching-Anfragen sind kein Teil des Datenmodells in Phase 1. Kontaktanfragen laufen über E-Mail-Weiterleitung (opt-in).

**Kein Bewertungssystem:** Keine Bewertung von PPI-Mitwirkenden durch Forschende oder umgekehrt. Zu komplex, zu fehleranfällig, zu datenschutzproblematisch.

**Keine Verfolgung von Kontaktanfragen:** Das System protokolliert nicht, wer wen kontaktiert hat. Dies würde Profiling ermöglichen, das datenschutzrechtlich nicht gerechtfertigt ist.

### 6.4 Datenvolumen-Schätzung

Für die Schweiz realistisches Zieldatenvolumen in Phase 1 (24 Monate):

| Entität | Zielgrösse | Begründung |
|---|---|---|
| Profile (Individuen) | 50–120 | Basierend auf SCTO-Mapping aktiver PPI-Personen; JDR Erfahrung: 80 Erstregistrierungen Jahr 1 |
| Engagements (Portfolio) | 100–300 | Ca. 2–3 Einträge pro aktivem Profil |
| Organisationsprofile | 15–30 | Aktive Schweizer Patientenorganisationen mit PPI-Fokus |
| Taxonomie-Einträge | ~150 | Stabile Referenzdaten |

Dieses Volumen ist mit jeder Datenbanklösung problemlos handhabbar. Technische Skalierbarkeit ist kein relevantes Entscheidungskriterium in Phase 1.

---

## 7. Datenschutzanalyse (Schweiz)

### 7.1 Rechtsrahmen

Für ein PPI-Register in der Schweiz sind drei Rechtsquellen massgeblich:

**Schweizer Datenschutzgesetz (nDSG, SR 235.1, in Kraft seit 1. September 2023)**

Das nDSG klassifiziert Gesundheitsdaten als "besonders schützenswerte Personendaten" (Art. 5 lit. c Ziff. 2 nDSG). Dies setzt erhöhte Schutzanforderungen voraus: explizite Einwilligung ist ein möglicher Rechtfertigungsgrund, daneben überwiegendes privates oder öffentliches Interesse oder gesetzliche Grundlage (Art. 31 nDSG).

**Bundesgesetz über die Forschung am Menschen (HFG/HRA, SR 810.30)**

Das HRA gilt für Forschung "am Menschen" im biomedizinischen Sinne — Forschung über Krankheiten oder die Funktionsweise des menschlichen Körpers. Es gilt **nicht** für ein PPI-Beteiligungsregister, solange dieses:
- keine Gesundheitsdaten im biomedizinischen Sinne erhebt (also keine Diagnosen, Labordaten, Behandlungsverläufe)
- PPI-Mitwirkende als Berater/Partner behandelt, nicht als Forschungssubjekte
- keine Rohdaten über den Gesundheitszustand der Registrierten generiert

Bestätigung: Swissethics und SCTO unterscheiden explizit zwischen PPI-Beteiligung (keine HRA-Regulierung) und Forschungssubjekt-Status (HRA-reguliert). Ein Beteiligungsregister ohne Gesundheitsdaten-Erhebung fällt nicht unter das HRA. (Swissethics BASEC FAQ, Swissethics Overview Data Registries v2.0, Mai 2024)

**DSGVO als Referenz (EuGH-Rechtsprechung)**

Die Schweiz ist nicht EU-Mitglied, aber die EuGH-Rechtsprechung zu Art. 9 DSGVO ist als Interpretationshilfe für das nDSG hochrelevant, da das nDSG eng an der DSGVO orientiert ist und die FDPIC-Praxis europäische Entwicklungen berücksichtigt.

### 7.2 Das zentrale Datenschutzproblem: Implizite Gesundheitsdaten

Das wichtigste Datenschutz-Problem eines PPI-Registers ist nicht offensichtlich: Es liegt nicht in der expliziten Erhebung von Diagnosen — die von Anfang an ausgeschlossen sein sollte. Es liegt in der impliziten Gesundheitsdatenqualität von Profil-Feldern.

**EuGH C-21/23 (Lindenapotheke, 4. Oktober 2024, Grosse Kammer):**

Der EuGH hat entschieden, dass selbst grundlegende Kaufdaten (Kundenname + Lieferadresse + Produktname) beim Kauf apothekenreservierter Produkte als "Gesundheitsdaten" im Sinne von Art. 9 DSGVO gelten — unabhängig von der Absicht des Verarbeiters.

**EuGH C-184/20 (OT v. Vyriausioji, 1. August 2022, Grosse Kammer):**

Daten, die "geeignet sind, mittelbar" Gesundheitsinformationen zu offenbaren, lösen Art. 9 aus. "Mittelbar" bedeutet: durch eine "intellektuelle Operation des Vergleichs oder der Schlussfolgerung" kann auf eine besondere Kategorie geschlossen werden.

**Konsequenz für ein PPI-Register:**

| Profilfeld | Gesundheitsdaten? | Begründung |
|---|---|---|
| Erfahrungsbereich (z.B. "Erkrankungen des Nervensystems") | **Ja — implizit** | Mittelbare Offenbarung: Aus dem Erfahrungsfeld kann auf persönliche Betroffenheit geschlossen werden |
| Perspektivtyp A ("Gelebte Erfahrung") | **Ja — implizit** | Perspektivtyp A impliziert eigene oder nahestehende Erkrankungserfahrung |
| Engagementportfolio (z.B. "Diabetes-Forschungsprojekt, 2024") | **Ja — implizit** | Aus Projektthema kann auf persönliche Betroffenheit geschlossen werden |
| Alias allein (ohne weitere Profilfelder) | **Nein** | Keine Verbindung zu Gesundheitsinformation |
| Kontakt-E-Mail allein | **Nein** | Kontaktdaten ohne Kontext |

**Fazit:** Sobald ein Profil einen Erfahrungsbereich enthält, handelt es sich datenschutzrechtlich um die Verarbeitung besonders schützenswerter Personendaten — auch ohne explizite Diagnoseangaben.

### 7.3 Datenschutz-Architektur-Optionen

**Option A — Minimales Alias-Register (niedrigstes Risiko)**

- Öffentliches Profil enthält: Alias, Beitragstypen, Sprachen, Region, Verfügbarkeit
- **Kein Erfahrungsbereich im öffentlichen Profil**
- Erfahrungsbereich wird intern gespeichert und nur bei opt-in-Kontaktanfrage freigegeben
- Konsequenz: Forschende können nicht nach Erkrankungsfeld suchen, ohne eine Kontaktanfrage zu stellen

**Option B — Pseudonymisiertes Kompetenzregister (mittleres Risiko)**

- Öffentliches Profil enthält: Alias, Erfahrungsbereich (auf Kapitel-Ebene, nicht Diagnose), Beitragstypen, Sprachen, Region, Verfügbarkeit
- Explizite Einwilligung für Erfahrungsbereich-Anzeige erforderlich
- DSFA (Datenschutz-Folgenabschätzung) erforderlich
- Realer Name getrennt gespeichert, nur nach eigener Freigabe sichtbar

**Option C — Volles Profil ohne Alias (höchstes Risiko)**

- Öffentliches Profil mit echtem Namen, Erfahrungsbereich, Engagementportfolio
- Höchste Anforderungen: explizite Einwilligung, DSFA, möglicherweise Swissethics-Beratung
- Für Phase 1 nicht empfohlen

**Empfehlung: Option B mit Alias-Angebot**

- Alias optional aber empfohlen (Default: Alias)
- Erfahrungsbereich nur mit expliziter, informierter, spezifischer Einwilligung
- DSFA vor dem Launch obligatorisch
- Swissethics-Beratung (freiwillig, aber für Seriosität wertvoll)

### 7.4 Einwilligungsmodell

Für Personen, die sich im Register erfassen lassen, sind folgende Einwilligungen separat einzuholen:

| Verarbeitungszweck | Einwilligungstyp | Widerrufbarkeit |
|---|---|---|
| Profil im Register führen (Alias + Beitragstypen + Verfügbarkeit) | Informierte Einwilligung | Jederzeit (Profil löschen) |
| Erfahrungsbereich im Profil anzeigen | Explizite Einwilligung (gesondert) | Jederzeit (Feld ausblenden) |
| Kontaktanfragen empfangen | Opt-in (Standard: Nein) | Jederzeit |
| Freigabe des echten Namens bei Kontaktanfrage | Einzelfall-Einwilligung | Pro Anfrage |
| Portfolio-Einträge öffentlich anzeigen | Informierte Einwilligung (per Eintrag) | Per Eintrag löschbar |

### 7.5 Datenschutz-Folgenabschätzung (DSFA)

Eine DSFA ist erforderlich, wenn das Register Erfahrungsbereiche (implizite Gesundheitsdaten) verarbeitet — auch wenn keine Diagnosen direkt erhoben werden. Dies folgt aus Art. 22 nDSG i.V.m. Art. 14 VDSG und dem Analogieschluss zu DSGVO Art. 35.

Die DSFA muss folgende Elemente enthalten:
- Beschreibung der Verarbeitungsvorgänge und Zwecke
- Notwendigkeit und Verhältnismässigkeit der Verarbeitung
- Identifikation und Bewertung der Risiken für die Rechte der Betroffenen
- Massnahmen zur Risikobewältigung

**Abkürzungsmöglichkeit:** Option A (Erfahrungsbereich nicht im öffentlichen Profil) vermeidet die DSFA-Pflicht weitgehend, schränkt aber die Nützlichkeit des Registers ein.

---

## 8. Technische Architekturvarianten

### 8.1 Bewertungsrahmen

Für ein kleines Schweizer PPI-Register ohne professionelle Geschäftsstelle gelten folgende Prioritäten (absteigend):

1. **Datenschutz** (nDSG-Konformität, Datenhoheit in CH)
2. **Wartbarkeit** (wer pflegt das System in 3 Jahren?)
3. **Aufwand** (wie lange bis zum Betrieb?)
4. **Kosten** (monatliche Betriebskosten)
5. **Skalierbarkeit** (nur relevant ab Phase 2)

### 8.2 Variante A — Hugo + Airtable

**Was es ist:**  
Hugo ist ein statischer Site-Generator (Open Source, Go-basiert). Airtable ist eine no-code Datenbank mit API und Formularen (US-amerikanischer Anbieter, SaaS).

**Wie es funktioniert:**  
Registrierungsformulare → Airtable API → Hugo liest Daten → statische Profilseiten oder dynamische Suche via Airtable API direkt im Browser.

**Datenschutz:**  
Airtable hat Serverstandorte in den USA. Airtable bietet EU-Datenresidenz nur auf Enterprise-Tier (ab ca. USD 45/User/Monat, Mindestgrösse). Für ein kleines Schweizer Register ist Enterprise nicht zumutbar. Standard-Pläne speichern Daten auf US-Servern — dies ist unter nDSG für besonders schützenswerte Personendaten problematisch ohne angemessene Garantien (Angemessenheitsbeschluss liegt vor für EU, aber die Schweiz hat eigene Anforderungen an Drittlandstransfers nach Art. 16 nDSG).

**Bewertung:**

| Kriterium | Bewertung | Bemerkung |
|---|---|---|
| Datenschutz (Datenhoheit) | ★★☆☆☆ | US-Server, EU-Residenz nur Enterprise |
| Wartbarkeit | ★★★★☆ | No-Code, leicht für Nicht-Techniker |
| Aufwand bis Betrieb | ★★★★★ | Sehr schnell, wenige Tage |
| Kosten | ★★★☆☆ | Airtable Team ca. CHF 25–55/Monat |
| Skalierbarkeit | ★★★★☆ | Gut bis ~50k Zeilen |
| nDSG-Konformität | ★★☆☆☆ | Problematisch für Gesundheitsdaten |

**Fazit Variante A:** Gut für einen schnellen Prototyp ohne Gesundheitsdaten. Nicht empfohlen für den Produktivbetrieb mit Erfahrungsbereichen in der Datenbank.

### 8.3 Variante B — Hugo + PocketBase

**Was es ist:**  
PocketBase ist eine Open-Source-Backend-Lösung (Go-basiert, MIT-Lizenz, seit 2022 aktiv entwickelt). Sie kombiniert SQLite-Datenbank, REST-API, Auth-System und Admin-UI in einer einzigen ausführbaren Datei. Wird selbst-gehostet.

**Wie es funktioniert:**  
Hugo generiert die statische Website. PocketBase läuft auf einem selbst-verwalteten Server (VPS) und stellt API für Registrierungsformulare, Profilsuche und Kontaktanfragen bereit.

**Datenschutz:**  
Vollständige Datenhoheit. Server kann in der Schweiz betrieben werden (z.B. Exoscale CH, Hetzner CH, Init7). Keine Abhängigkeit von US-Anbietern. Alle Daten bleiben im CH-Jurisdiktionsbereich.

**Hosting-Empfehlung für CH:**
- Exoscale (Swiss operator, Rechenzentrum CH): ~CHF 15–30/Monat für VM
- Init7 (CH-Betreiber): ~CHF 20–40/Monat

**Bewertung:**

| Kriterium | Bewertung | Bemerkung |
|---|---|---|
| Datenschutz (Datenhoheit) | ★★★★★ | Vollständig selbst-kontrolliert, Server in CH |
| Wartbarkeit | ★★★☆☆ | Technischer als Airtable; braucht jemanden mit grundl. Serverkenntnissen |
| Aufwand bis Betrieb | ★★★☆☆ | 2–4 Wochen für minimale Version |
| Kosten | ★★★★★ | ~CHF 15–30/Monat Hosting, sonst kostenlos |
| Skalierbarkeit | ★★★★☆ | Bis ca. 100k Datensätze problemlos |
| nDSG-Konformität | ★★★★★ | Beste Position für sensitive Daten |

**Fazit Variante B:** Empfohlen für den Produktivbetrieb. Hauptrisiko ist technische Abhängigkeit: wer wartet den Server, wenn die Person, die ihn eingerichtet hat, nicht mehr verfügbar ist?

### 8.4 Variante C — Einfaches Formular + Spreadsheet (Minimal-Pilot)

**Was es ist:**  
Google Forms / Tally.so für Registrierungsformulare + Google Sheets / Notion-Datenbank als Backend. Kein öffentliches Profil, nur interne Suche durch Koordinationsperson.

**Wie es funktioniert:**  
Forschende wenden sich an eine Koordinationsperson (z.B. SCTO-Mitarbeitende). Diese sucht manuell in der internen Liste und vermittelt opt-in-Kontakte.

**Datenschutz:**  
Google Sheets und Tally (je nach Konfiguration) haben Datenschutzprobleme ähnlich wie Airtable. Notion hat Serverstandorte in den USA.  
Empfehlung: Nextcloud auf Schweizer Server (ETH, SWITCH, kommerzieller CH-Anbieter) als datenschutzfreundliche Alternative.

**Bewertung:**

| Kriterium | Bewertung | Bemerkung |
|---|---|---|
| Datenschutz | ★★★☆☆ | Abhängig von Hosting-Wahl |
| Wartbarkeit | ★★★★★ | Kein technisches Wissen nötig |
| Aufwand bis Betrieb | ★★★★★ | Tage |
| Kosten | ★★★★★ | CHF 0–5/Monat |
| Skalierbarkeit | ★★☆☆☆ | Bricht bei >100 Einträgen ohne Prozess zusammen |
| Öffentliche Sichtbarkeit | ★☆☆☆☆ | Keine |

**Fazit Variante C:** Sinnvoll als Pilot-Instrument vor dem offiziellen Register-Launch. Nicht für öffentliche Sichtbarkeitszwecke geeignet.

### 8.5 Entscheidungsempfehlung

```
Phase 0 (Pilotphase, 0–6 Monate):
Variante C — Formular + Spreadsheet (Nextcloud/SWITCH)
Zweck: Community aufbauen, Taxonomie testen, 20-30 Erstregistrierungen sammeln

Phase 1 (Produktiv, 6–24 Monate):
Variante B — Hugo + PocketBase (Server auf Exoscale CH)
Zweck: Öffentliches Register, datenschutzkonform, wartbar

Phase 2 (Erweiterung, ab Monat 24):
Variante B mit Erweiterungen oder Übergang zur Clearingstelle-Infrastruktur
```

**Monatliche Betriebskosten (Variante B, Phase 1):**

| Position | Kosten |
|---|---|
| VPS Hosting (Exoscale CH) | CHF 20–30 |
| Domain | CHF 2–5 |
| E-Mail-Hosting (optional) | CHF 0–5 |
| **Total Technologie** | **CHF 22–40/Monat** |
| Koordination (5–10% FTE) | CHF 500–1.000/Monat (je nach Lohnmodell) |

Technologie ist der kleinste Kostenfaktor. Die grösste Investition ist menschliche Zeit für Community-Aufbau und Pflege.

---

## 9. Risiken

### 9.1 Risiko 1 — Das Geisterregister

**Beschreibung:** Das Register wird gebaut, aber nicht genutzt. Profile werden nicht aktualisiert, Forschende finden keine Mehrwert gegenüber ihren bestehenden Netzwerken.

**Wahrscheinlichkeit:** Hoch, wenn keine Community-Arbeit flankiert. NIHR Be Part of Research ist ein warnendes Beispiel: 528.389 Registrierungen, aber nur ~9,5 % aktive Nutzung (NIHR, September 2024).

**Ursache:** Das Register löst ein Angebots-Problem (wo finde ich PPI-Mitwirkende?), aber nicht das Nachfrage-Problem (wollen Forschende überhaupt PPI?).

**Gegenmassnahmen:** Aktives Community-Management, direkte Ansprache von Forschenden, Pflicht-Anzeige-Wert durch Institutionen (SNF-Anforderung).

### 9.2 Risiko 2 — Datenschutzverletzung durch Design

**Beschreibung:** Das Register enthält implizite Gesundheitsdaten (Erfahrungsbereiche), die durch einen Datenleck oder missbräuchliche Abfragen zu Diskriminierung führen können.

**Wahrscheinlichkeit:** Mittel, wenn kein Alias-Modell und keine Zugriffsbeschränkungen.

**Ursache:** EuGH Lindenapotheke (C-21/23) hat klargestellt, dass auch indirekte Verbindungen zu Erkrankungen Gesundheitsdaten konstituieren — auch ohne Diagnoseangaben.

**Gegenmassnahmen:** Alias-Modell als Default, Erfahrungsbereich nur mit expliziter Einwilligung, DSFA vor Launch, Zugriffsbeschränkung für Suche (nur registrierte Forschende mit verifiziertem Institutionshintergrund).

### 9.3 Risiko 3 — Repräsentativitätsbias

**Beschreibung:** Das Register spiegelt nicht die Vielfalt der Schweizer Bevölkerung wider. Gut organisierte, urbane, deutschsprachige, höher gebildete Gruppen sind überrepräsentiert; junge Menschen, Migranten, Menschen mit psychischen Erkrankungen, sozioökonomisch benachteiligte Gruppen fehlen.

**Wahrscheinlichkeit:** Hoch ohne aktives Diversity-Management. Belegt durch Literatur: Gruppen mit niedrigerer Bildung, Erwerbstätigkeit, ethnischer Minorität sind in PPI systematisch unterrepräsentiert (PMC10726264, 2023).

**Gegenmassnahmen:** Gezielte Rekrutierung über Organisationen, die schwer erreichbare Gruppen vertreten. Keine Alias-Pflicht (senkt Hemmschwelle). Mehrsprachigkeit (DE/FR/IT) als Grundanforderung.

### 9.4 Risiko 4 — Taxonomie-Veraltung

**Beschreibung:** Die Taxonomien (Erfahrungsbereiche, Beitragstypen) veralten oder werden zu starr. Neue Erkrankungsfelder, neue PPI-Formen passen nicht in die vorhandenen Kategorien.

**Wahrscheinlichkeit:** Mittel (Taxonomien müssen periodisch überprüft werden).

**Gegenmassnahmen:** Taxonomie-Review alle 24 Monate. Überschaubare initiale Taxonomie (lieber weniger, dafür wartbar). Freitextfeld für "nicht abgedeckte Bereiche" als Feedback-Kanal.

### 9.5 Risiko 5 — Tokenismus-Gefahr

**Beschreibung:** Das Register erzeugt Token-PPI: Forschende kontaktieren Registrierte für Pro-forma-Beteiligungen, um Förderanforderungen zu erfüllen, ohne echte Integration der Perspektiven.

**Wahrscheinlichkeit:** Mittel bis hoch, wenn kein Qualitätssicherungsmechanismus.

**Ursache:** Das Register löst das Infrastruktur-Problem, nicht das Kultur-Problem. Tokenismus ist ein Governance- und Anreizsystem-Problem (Brett et al. 2014; PMC7153227, 2020).

**Gegenmassnahmen:** Das Register kann Tokenismus nicht verhindern. Es kann ihn aber sichtbar machen, wenn Portfolio-Einträge auf der Seite der Mitwirkenden dokumentiert werden und Muster erkennbar werden.

### 9.6 Risiko 6 — Nachhaltigkeit und Finanzierungslücken

**Beschreibung:** Das Register entsteht mit Projektfinanzierung und stirbt, wenn diese ausläuft. Profile veralten, Community löst sich auf.

**Wahrscheinlichkeit:** Hoch für Register, die nicht in institutionelle Strukturen eingebettet sind.

**Gegenmassnahmen:** Von Anfang an Trägerschaft klären (SCTO, SNF, Patientenorganisations-Konsortium). Keine Finanzierung ohne Betriebskommitment für mindestens 3 Jahre. Minimale Technologiekosten senken die Betriebshürde.

---

## 10. Empfehlungen

### 10.1 Sofort (0–3 Monate)

**1. SCTO-Koordination aufnehmen**  
Das Register sollte nicht parallel zu bestehenden SCTO-Aktivitäten entwickelt werden. SCTO hat das PPI-Mapping abgeschlossen und baut nationale Infrastruktur auf. Koordinationsgespräch als erste Massnahme.

**2. Taxonomie-Workshop mit PPI-Community**  
Bevor irgendeine Technologie gewählt wird: Workshop mit 10–15 PPI-erfahrenen Personen aus der Schweiz. Welche Felder braucht ein Profil? Welche Taxonomie-Begriffe funktionieren in der Praxis? Erfahrungen aus JDR (UK), EUPATI, SCTO-Netzwerk einbeziehen.

**3. Datenschutz-Analyse beauftragen**  
Bevor irgendein System geht live: DSFA durch datenschutzrechtlich kompetente Stelle (nicht intern). Swissethics-Beratung anfragen (freiwillig, aber stärkt Glaubwürdigkeit).

**4. Trägerschaft klären**  
Wer betreibt das Register in 5 Jahren? Ohne klare Antwort kein Launch.

### 10.2 Phase 0 — Pilot (3–9 Monate)

**Pilotregister mit 20–40 Personen**  
Variante C (Formular + Nextcloud-Spreadsheet) für interne Nutzung. Ziel: Taxonomie validieren, Community-Dynamik verstehen, Kontaktanfrage-Prozess testen.

**Keine öffentliche Website in Phase 0**  
Das Pilotregister ist intern. Forschende wenden sich an eine Koordinationsperson. Diese sucht manuell. Dies schützt Datenschutz und ermöglicht Taxonomie-Iteration ohne technischen Aufwand.

**Erfolgsmessung Phase 0:**
- Anzahl Registrierungen
- Anzahl Kontaktanfragen von Forschenden
- Qualität des Taxonomie-Feedbacks
- Gefundene Datenschutz-Lücken

### 10.3 Phase 1 — Produktives Register (9–24 Monate)

**Öffentliches Register auf Hugo + PocketBase (Variante B)**  
Server in der Schweiz (Exoscale CH). Alias als Standard. Erfahrungsbereiche nur mit expliziter Einwilligung. DSFA abgeschlossen.

**Zielgrösse Phase 1:** 50–100 aktive Profile, 15–25 Organisationsprofile, 3–5 Erfahrungsbereiche als thematische Schwerpunkte.

**Community-Arbeit > Technologie**  
5 Stunden/Woche für persönliche Ansprache, Veranstaltungsbesuche, Newsletter. Ohne Community-Investment stirbt das Register.

**Erfolgsmessung Phase 1:**
- Anzahl aktiver Profile (Bereitschaftsstatus = aktiv)
- Anzahl Kontaktanfragen durch Forschende
- Anzahl daraus entstandener PPI-Engagements
- Anteil Profile, die nach 12 Monaten noch aktuell sind (Selbst-Aktualisierungsrate)

### 10.4 Phase 2 — Übergang zur Clearingstelle (ab Monat 24)

Wenn Phase 1 zeigt, dass:
- 80+ aktive Profile vorhanden
- 20+ Kontaktanfragen/Jahr eingehen
- Community stabil ist

dann ist der Übergang zur Clearingstelle-Logik sinnvoll: Koordinationsperson übernimmt aktive Vermittlungsfunktion, nicht nur reaktive Datenbank-Pflege.

Das Register bleibt als Infrastruktur bestehen. Die Clearingstelle baut darauf auf.

---

## 11. Kritische Würdigung der Grundidee

### 11.1 Was an der Idee trägt

**Das Problem ist real:** Gegenseitige Unsichtbarkeit zwischen PPI-willigen Personen und Forschenden ist das klar identifizierbare Problem. Ein Register löst es direkter und günstiger als eine Matching-Plattform.

**Der Ansatz ist proportional:** Für ein Ökosystem mit 50–150 PPI-relevanten Projekten/Jahr ist ein menschlich koordiniertes Register mit 5–10 % FTE-Aufwand sinnvoller als eine technologiegetriebene Matching-Plattform.

**Die Idee ist realistisch finanzierbar:** CHF 22–40/Monat Technologiekosten sind keine Hürde. Der echte Aufwand ist Personalzeit, die in bescheidenem Umfang (5–10 h/Woche) realistisch ist.

**Der Ansatz lässt sich schrittweise skalieren:** Ein Register in Phase 1 baut Infrastruktur, Taxonomie und Community auf — alles Voraussetzungen für eine Clearingstelle in Phase 2.

### 11.2 Was an der Idee fragwürdig bleibt

**Aktivierungsproblem:** Alle grossen Register-Projekte kämpfen damit. NIHR BPOR (9,5 % Aktivierung), ResearchMatch (1 von 5 Kontakten antwortete, Vanderbilt). Nur JDR mit krankheitsspezifischer Community und aktivem Community-Management erreichte 67,9 % (PMC8659591). Ein Register ohne aktive Community-Arbeit ist wahrscheinlich ein Geisterregister.

**Das eigentliche PPI-Problem ist kein Register-Problem:** Die PPI-Beteiligung in Schweizer Forschung ist nicht primär gering, weil Forschende keine PPI-Mitwirkenden finden — sondern weil die Forschungskultur, Anreizsysteme und institutionellen Strukturen PPI nicht hinreichend wertschätzen. Ein Register löst das zweite Problem nicht. Wie eine systematische Review (Wearn et al., 2025, PMC11751718) zeigt: trotz 19 untersuchter Evaluationsstudien zu PPI-Infrastruktur wurden keine spezifischen Outcome-Evaluationen gefunden.

**Datenschutz ist schwieriger als erwartet:** Die intuitive Annahme "wir erheben keine Diagnosen, also kein Problem" ist durch EuGH-Rechtsprechung (Lindenapotheke, C-21/23; OT v. Vyriausioji, C-184/20) überholt. Das Register muss als Gesundheitsdaten-verarbeitendes System gebaut werden, auch wenn keine Diagnosen erfasst werden. Dies erhöht den Compliance-Aufwand erheblich.

**Taxonomie-Komplexität:** Ein Erfahrungsbereich-Feld, das bei 50 Profilen funktioniert, bricht bei 500 zusammen oder wird zu granular für sinnvolle Suche. Taxonomien sind wartungsintensiv.

### 11.3 Wo die Hypothese angepasst werden sollte

Die ursprüngliche Hypothese lautet:

> "Die Plattform macht Erfahrungen, Perspektiven, Kompetenzen, Engagements und Beteiligungsbereitschaft von PPI-Mitwirkenden sichtbar und unterstützt die datenschutzkonforme Kontaktanbahnung innerhalb des Schweizer PPI-Ökosystems."

**Präzisierung 1:** Das Register macht **strukturierte Profile** sichtbar — nicht ungefilterte Erfahrungen. Die Strukturierung durch Taxonomien ist keine Einschränkung, sondern eine Notwendigkeit.

**Präzisierung 2:** Das Register löst das Sichtbarkeitsproblem nur für Personen, die sich aktiv registrieren. Es löst es nicht für PPI-willige Personen, die nichts von der Existenz des Registers wissen — das ist die grössere Gruppe.

**Präzisierung 3:** "Datenschutzkonforme Kontaktanbahnung" erfordert mehr als eine DSGVO-Checkbox. Sie erfordert ein durchdachtes Consent-Modell, eine DSFA, Swissethics-Beratung und technische Massnahmen (Alias-Modell, Zugangsbeschränkungen).

**Überarbeitete Hypothese:**

> "Das Register schafft eine strukturierte, datenschutzkonforme Sichtbarkeit für PPI-Mitwirkende in der Schweiz, die sich aktiv einbringen wollen. Es ermöglicht forschenden Personen, kompetente PPI-Partner zu finden, und bietet PPI-Mitwirkenden einen geschützten Raum zur Selbstdarstellung und Vernetzung — als erste Aufbauphase eines nationalen PPI-Ökosystems, nicht als finaler Zustand."

---

## 12. Schlussfrage: Register als erster Schritt?

> **Ist ein nationales PPI-Kompetenz- und Engagementregister ein sinnvoller, realistischer und finanzierbarer erster Schritt für die Schweiz — oder sollte ein anderer Ansatz verfolgt werden?**

### Antwort

**Ja — mit drei unverhandelbaren Bedingungen.**

**1. Sinnvoll:** Das Register löst ein real existierendes Problem (gegenseitige Unsichtbarkeit) mit einem proportionalen Mittel. Es ist weniger komplex als eine Clearing-stelle und weniger riskant als eine technologiegetriebene Matching-Plattform. Internationale Erfahrungen (NIHR, JDR, SCTO-Mapping) bestätigen, dass Register ein etablierter erster Schritt in der PPI-Infrastrukturentwicklung sind.

**2. Realistisch:** Realistisch, wenn drei Bedingungen erfüllt sind:
- **Community-Arbeit flankiert die Technologie.** Ohne aktive Rekrutierung und Begleitung entsteht ein Geisterregister (NIHR BPOR: 9,5 % Aktivierungsrate trotz NHS-Infrastruktur).
- **Koordination mit SCTO von Anfang an.** SCTO ist der natürliche Partner und Träger. Parallelentwicklung wäre Ressourcenverschwendung.
- **Datenschutz als Designprinzip.** Die EuGH-Rechtsprechung (Lindenapotheke 2024, OT v. Vyriausioji 2022) macht klar: Erfahrungsbereiche im Profil konstituieren Gesundheitsdaten. Eine DSFA ist obligatorisch, das Alias-Modell ist Grundvoraussetzung.

**3. Finanzierbar:** Ja — aber nicht im technischen Sinne. Die Technologiekosten (CHF 22–40/Monat) sind trivial. Die reale Finanzierungsfrage ist: Wer stellt 5–10 Stunden Personalzeit pro Woche für Community-Management, Profilpflege und Koordination bereit? Diese Frage muss vor dem Launch beantwortet sein.

### Was stattdessen verfolgt werden sollte, wenn nicht das Register

Falls das Register aufgrund fehlender Trägerschaft, fehlender Community-Basis oder fehlender Datenschutz-Compliance nicht realisierbar ist, gibt es zwei sinnvolle Alternativen:

**Alternative 1 — SCTO-Integration:** Keine eigenständige Infrastruktur, sondern Integration in die bestehenden SCTO-PPI-Aktivitäten. SCTO wird zum Ansprechpartner und betreibt intern eine Datenbank. Niedrigste Hürde, kein öffentliches Register, aber sofort umsetzbar.

**Alternative 2 — Thematisches Pilot-Register:** Anstatt eines nationalen Allround-Registers: ein Register für einen spezifischen Erkrankungsbereich (z.B. Onkologie oder Seltene Erkrankungen) mit einer Trägerorganisation, die in diesem Bereich aktiv ist. Fokus erhöht Aktivierungsrate (JDR-Beispiel: 67,9 %) und senkt Komplexität.

**Keine sinnvolle Alternative** ist eine direkte Vollimplementierung einer Matching-Plattform ohne vorgängigen Aufbau von Community, Taxonomie und Vertrauen. Technologie kann nicht lösen, was ein Ecosystem-Problem ist.

---

## 13. Quellenverzeichnis

**PPI-Register und Infrastruktur**

- NIHR. (2024, September). *Half a million people sign up to Be Part of Research.* National Institute for Health and Care Research. https://www.nihr.ac.uk/news/half-million-people-sign-be-part-research

- A national open-access research registry to improve recruitment to clinical studies — Join Dementia Research. *PMC8659591.* https://pmc.ncbi.nlm.nih.gov/articles/PMC8659591/

- SCTO. (2023). *PPI Mapping Switzerland.* Swiss Clinical Trial Organisation. https://www.scto.ch/en/patient-and-public-involvement/ppi-mapping.html

- SCTO. *Patient and Public Involvement.* https://www.scto.ch/patient-public-involvement/

- SNF. (2024). *SCTO Factsheet PPI.* Schweizerischer Nationalfonds. https://www.snf.ch/api/media/en/o5yqCe4GPIVk2RUG/scto-factsheet-ppi-en.pdf

- EUPATI. *European Patients' Academy on Therapeutic Innovation.* https://eupati.eu/

- Oxford Nuffield Department of Primary Care Health Sciences. *PPI Register Your Interest.* https://www.phc.ox.ac.uk/forms/patient-and-public-involvement-in-research-register-your-interest

- IMI PARADIGM. *Patients Active in Dialogue and Governance for Improved Medicines.* https://imi-paradigm.eu/

**PPI-Wirksamkeit und Aktivierungsraten**

- Brett, J. et al. (2014). Mapping the impact of patient and public involvement on health and social care research: A systematic review. *Health Expectations.* PMC5060910. https://pmc.ncbi.nlm.nih.gov/articles/PMC5060910/

- RAPPORT Study. (2015). *ReseArch with Patient and Public invOlvement: a RealisT evaluation.* NIHR. https://www.ncbi.nlm.nih.gov/books/NBK315999/

- Wearn, A. et al. (2025). Evaluating process and outcomes of public involvement in applied health and social care research: A rapid systematic review. *Health Expectations.* PMC11751718. https://pmc.ncbi.nlm.nih.gov/articles/PMC11751718/

- Patient and public involvement in systematic reviews: frequency, determinants, stages, barriers, and dissemination. *Journal of Clinical Epidemiology, 2024.* PubMed 38604271.

- Patient and public involvement in research: From tokenistic box ticking to valued team members. *BMC Medicine, 2020.* PMC7153227. https://pmc.ncbi.nlm.nih.gov/articles/PMC7153227/

- Diversity in patient and public involvement in healthcare research and education. *PMC10726264, 2023.* https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10726264/

- NIHR Oxford BRC. (2017). *A Researcher's Guide to Patient and Public Involvement.* https://oxfordbrc.nihr.ac.uk/wp-content/uploads/2017/03/A-Researchers-Guide-to-PPI.pdf

**PPI-Taxonomien und Frameworks**

- Staniszewska, S. et al. (2017). GRIPP2 reporting checklists: tools to improve reporting of patient and public involvement in research. *PMC5539518.* https://pmc.ncbi.nlm.nih.gov/articles/PMC5539518/

- Systematic review on the frequency and quality of reporting PPI in patient safety research. *BMC Health Services Research, 2024.* PMC11046929. https://pmc.ncbi.nlm.nih.gov/articles/PMC11046929/

**Datenschutz — EU/DSGVO**

- EuGH, Urteil vom 4. Oktober 2024, C-21/23 (Lindenapotheke). https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A62023CJ0021

- EuGH, Urteil vom 1. August 2022, C-184/20 (OT v. Vyriausioji tarnybinės etikos komisija). https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:62020CJ0184

- WP29. (2015). *Letter on health data processed by lifestyle and wellbeing apps.* https://www.huntonprivacyblog.com/2015/02/09/article-29-working-party-clarifies-scope-health-data-processed-lifestyle-wellbeing-apps/

- EDPB. (2020). *Guidelines 03/2020 on the processing of data concerning health for the purpose of scientific research.* https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-032020-processing-data-concerning-health-purpose_en

- ICO. *What is special category data?* https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/lawful-basis/special-category-data/what-is-special-category-data/

**Datenschutz — Schweiz**

- Bundesgesetz über den Datenschutz (DSG/nDSG, SR 235.1, in Kraft seit 1. September 2023). https://www.fedlex.admin.ch/eli/cc/2022/491/de

- Bundesgesetz über die Forschung am Menschen (HFG/HRA, SR 810.30). https://www.fedlex.admin.ch/eli/cc/2014/245/de

- Swissethics. (2024). *Overview of Data Registries and Biobanks v2.0 (Mai 2024).* https://swissethics.ch/assets/themen/240516_overview-data-registries_biobanks_v2.0.pdf

- Swissethics. (2024). *Regulations for health-related personal data registries (Dezember 2024).* https://swissethics.ch/en/news/2024/12/17/regulations-for-health-related-personal-data-registries

- EDOEB. *Research and data protection.* https://www.edoeb.admin.ch/en/research-and-data-protection

- SCTO. (2023). *nFADP Guidance for Clinical Trials (September 2023).* https://www.sctoplatforms.ch/admin/data/files/section_asset/file/53/the-new-federal-act-on-data-protection-(nfadp)-guidance-for-clinical-trials_scto_sept2023.pdf

- DLA Piper. *Data Protection Laws of the World — Switzerland.* https://www.dlapiperdataprotection.com/?t=law&c=CH

**Technologie**

- PocketBase. *Open Source backend for your next SaaS and Mobile app.* https://pocketbase.io/

- Exoscale. *Swiss Cloud Infrastructure.* https://www.exoscale.com/

**Ethik und Governance**

- HRA. (2024). *Public Involvement Guidance for Researchers.* https://www.hra.nhs.uk/planning-and-improving-research/best-practice/public-involvement/guidance-for-researchers/

- NIHR SPCR. *Do I need ethical approval to run an involvement activity?* https://www.spcr.nihr.ac.uk/PPI/resources-for-researchers/faq/do-i-need-ethical-approval-to-run-an-involvement-activity

- University of Oxford. *Ethical approval and PPI.* https://www.medsci.ox.ac.uk/research/patient-and-public-involvement/section-2-what-is-patient-and-public-involvement/ethical-approval

---

*Konzeptstudie V1 — PPI-Kompetenz- und Engagementregister Schweiz | 18. Juni 2026*  
*Entwickelt auf Basis von: PPI-Matching-Plattform-Schweiz-Fachkonzept-V1, V2, V3 und PPI-Modellkorrektur-Patientenorganisationen*
