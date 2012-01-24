---
layout: post
title: Alternativen zu Google
date: 2012-01-04 20:00:00
category: internet
tags: [google]
---

### Suche

Für die Suche, die wichtigste Funktion von Google, ist es am
schwierigsten einen wirklich brauchbaren Ersatz zu finden. Der
Suchalgorithmus von Google scheint unter allen Suchmaschinen die
besten Ergebnisse zu liefern. Google nimmt zudem eine starke Filterung
der Suchergebnisse vor, die sogar vom Surfverhalten des Benutzers
abhängt.

Yahoo und Bing benutzen ebenfalls personalisierter Werbung, sie sind
also keine wirkliche Alternative zu Google. Die Suchmaschine
[DuckDuckGo][ddg] hingegen speichert keine Daten über den Benutzer und
bietet ein paar Spezialfunktionen, wie die WolframAlpha-Integration
und die *!Bang*-Syntax zur schnellen Benutzung anderer Suchmaschinen,
zum Beispiel “!wde Kurbelwelle” um die deutsche Wikipedia zu
durchsuchen.

Ein vollständig anderes Prinzip verfolgt die dezentrale Suchmaschine
[YaCy][yacy], welche den Suchindex auf beliebig viele Peers aufteilt
und so ein zensursicheres Suchnetzwerk schafft. Jeder Benutzer kann
eine eigene Instanz der YaCy-Software betreiben, welche aus einem
Crawler, einer Datenbank und einem Suchinterface besteht.  So hat
jeder Benutzer seinen einen unabhängigen Index, den er durchsuchen und
mit dem Crawler erweitern kann. Das größte Potential bietet YaCy aber
durch die Kombination der verteilten Suchindizes, die das Netz zensur-
und ausfallsicher macht.

### E-Mail

Die sicherste Alternative zu einem E-Mail-Provider und die volle
Kontrolle über den E-Mail-Verkehr bringt das Aufsetzen eines eigenen
Mailservers. Das hört sich wahrscheinlich ziemlich aufwendig an, ist
aber gar nicht so schwer. Man benötigt eine Domain und einen Computer,
der dauerhaft mit dem Internet verbunden ist und eine feste IP-Adresse
besitzt. Mit dem [Postfix][pf]-MTA und dem IMAP-Server [Dovecot][dc]
ist ein funktionierendes Setup relativ schnell eingerichtet. Ein
Webinterface, das so gut zu bedienen ist wie das von GMail, habe ich
bis jetzt noch nicht gefunden, die derzeit beste Alternative ist
meiner Meinung nach [Roundcube][rc].

### Kalender

Der Kalendar von Google lässt sich mit dem CalDAV-Protokoll einfach
zwischen verschiedenen Computern und Smartphones synchronisieren.
Hier bietet sich der in Python geschriebene CalDAV-Server
[Radicle][rdcl] als Ersatz an, auf das Webinterface muss man hier
leider verzichten.

### Kontakte

Für die Verwaltung von Kontakten habe ich bis jetzt keine brauchbare
Lösung gefunden. Das CardDav-Protokoll zum synchronisieren von
Kontakten wird meist nur von Groupware-Software unterstützt, die meist
viel zu viele überflüssige Funktionen mitbringt. Die meisten Programme
unterstützen auch LDAP, was aber nur eine Abfrage-Möglichkeit und
keine Synchronisation bietet.

### Maps

[OpenStreetMap][osm] ist mittlerweile die bessere Alternative zu
Google Maps, da die Karte durch Beiträge vieler Mitwirkender
detailreicher ist. OpenStreetMap selbst besitzt noch keine
Routing-Funktion, dafür gibt es unter anderem den Dienst
[OpenRouteService][ors], welcher von der Uni Heidelberg bereitgestellt
wird und Routen auf Basis der OpenStreetMap-Daten berechnet.

Das Einbetten von Google Maps-Karten für gewinnorientierte Projekte
wurde von Google sogar kurzerhand als kostenpflichtig
deklariert[^gmaps-kostenpflichtig], was zeigt, dass man sich nicht auf
die kostenlosen Dienste von Google verlassen sollte.

### Analytics

Google Analytics ermöglicht Google sogar eine Überwachung der Benutzer
außerhalb ihrer eigenen Webseiten, da bei jedem Seitenaufruf einer
Seite mit Google Analytics auch eine Anfrage an Google gesendet
wird. Hier benutze ich die GPL-lizensierte Software
[Piwik][piwik], die man auf dem eigenen Server betreiben
kann und so keine Daten an andere Dienste geben muss.

[ddg]: http://www.duckduckgo.com
[yacy]: http://www.yacy.net
[pf]: http://www.postfix.org
[dc]: http://www.dovecot.org
[rc]: http://www.roundcube.net
[rdcl]: http://radicale.org
[osm]: http://www.openstreetmap.org
[ors]: http://www.openrouteservice.org
[piwik]: http://www.piwik.org

[^gmaps-kostenpflichtig]: [**heise iX** &ndash; Schluss mit Gratis: Google verlangt Geld für Kartennutzung](http://www.heise.de/ix/meldung/Schluss-mit-gratis-Google-verlangt-Geld-fuer-Kartennutzung-1368176.html)

*[MTA]: Mail Transfer Agent
*[LDAP]: Lightweight Directory Access Protocol
*[GPL]: GNU General Public License
*[IMAP]: Internet Message Access Protocol
