---
layout: post
title: Alternativen zu Google
date: 2012-01-30 15:00:00
category: internet
tags: [google,alternativen,suche,email,gmail,kalender,kontakte,analytics]
---

Google hat sich seit seiner Gründung 1998 von einer einfachen
Suchmaschine zu einem Anbieter von vielen verschiedenen Diensten
entwickelt. Diese Dienste sind bis jetzt zwar alle kostenlos, doch das
kann sich jedoch jederzeit ändern. Google finanziert sich durch die
Anzeige von personalisierter Werbung, bei der Suche personalisiert
durch die Suchbegriffe, bei Google Mail sogar durch den Inhalt der
E-Mails. Mit Googles neuen Nutzungsbedingungen will Google diese Daten
nun auch zusammenlegen und dienstübergreifend
benutzen[^google-nutzungsbedingungen].

Wegen der Einfachheit und dem minimalen Konfigurationsaufwand habe ich
viele Jahre die Dienste von Google benutzt. Seit ungefähr einem Jahr
bin ich auf der Suche nach brauchbaren Alternativen, bei denen man,
wenn möglich, die volle Kontrolle über seine Daten hat. Um das zu
erreichen, kommt man an einem eigenen Server, bzw. einen Computer, der
dauerhaft mit dem Internet verbunden ist, nicht vorbei.

### Suche

Für die Suche, die wichtigste Funktion von Google, ist es am
schwierigsten einen wirklich brauchbaren Ersatz zu finden. Der
Suchalgorithmus von Google scheint unter allen Suchmaschinen die
besten Ergebnisse zu liefern.

Da Google gewinnorientiert arbeitet, ist eine Suche aber nicht
kostenlos, man bezahlt Google mit persönlichen Daten. Google legt für
jeden Benutzer ein Profil an, in das Suchbegriffe, angeklickte
Suchergebnisse und viele andere Dinge einfließen. Damit zeigt Google
einem nicht nur personalisierte Werbung an, sondern nimmt zudem Google
eine Filterung der Suchergebnisse vor, was dazu führt, dass jeder
Benutzer unterschiedliche Suchergebnisse bekommen kann.

Yahoo und Bing benutzen ebenfalls personalisierter Werbung, sie sind
also keine wirkliche Alternative zu Google. Die Suchmaschine
[DuckDuckGo][ddg] hingegen gibt an, keinerlei Daten über den Benutzer
zu speichern und bietet ein paar Spezialfunktionen, wie die
WolframAlpha-Integration und die *!Bang*-Syntax zur schnellen
Benutzung anderer Suchmaschinen, zum Beispiel "!wde Kurbelwelle" um
die deutsche Wikipedia zu durchsuchen.

Ein vollständig anderes Prinzip verfolgt die dezentrale Suchmaschine
[YaCy][yacy], welche den Suchindex auf beliebig viele Peers aufteilt
und so ein zensursicheres Suchnetzwerk schafft. Jeder Benutzer kann
eine eigene Instanz der YaCy-Software betreiben, welche aus einem
Crawler, einer Datenbank und einem Suchinterface besteht. So hat jeder
Benutzer seinen einen unabhängigen Index, den er durchsuchen und mit
dem Crawler erweitern kann. Das größte Potenzial bietet YaCy aber
durch die Kombination der verteilten Suchindizes, die das Netz zensur-
und ausfallsicher macht.

### E-Mail

Die sicherste Alternative zu einem E-Mail-Provider und die volle
Kontrolle über den E-Mail-Verkehr bringt das Aufsetzen eines eigenen
Mailservers. Das hört sich ziemlich aufwendig an, ist aber gar nicht
so schwer. Man benötigt eine Domain und einen Computer, der dauerhaft
mit dem Internet verbunden ist und vorzugsweise eine feste IP-Adresse
hat. Mit dem [Postfix][pf]-MTA und dem IMAP-Server [Dovecot][dc] ist
ein funktionierendes Setup relativ schnell eingerichtet. Ein
Webinterface, das so gut zu bedienen ist wie das von GMail, habe ich
bis jetzt noch nicht gefunden, die derzeit beste Alternative ist
meiner Meinung nach [Roundcube][rc].

### Kalender

Der Kalender von Google lässt sich mit dem CalDAV-Protokoll einfach
zwischen verschiedenen Computern und Smartphones synchronisieren.
Hier bietet sich der in Python geschriebene CalDAV-Server
[Radicale][rdcl] als Ersatz an, auf das Webinterface muss man hier
leider verzichten.

### Kontakte

Für die Verwaltung von Kontakten habe ich bis jetzt keine brauchbare
Lösung gefunden. Das CardDav-Protokoll zum Synchronisieren von
Kontakten wird meist nur von Groupware-Software unterstützt, die meist
viele überflüssige Funktionen mitbringt. Die meisten Smartphones und
E-Mail-Clients unterstützen auch LDAP, was aber nur eine
Abfrage-Möglichkeit und keine Synchronisation bietet.

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
wird. Hier benutze ich die GPL-lizenzierte Software [Piwik][piwik],
die man auf dem eigenen Server betreiben kann und so keine Daten an
andere Dienste geben muss.

[ddg]: http://www.duckduckgo.com
[yacy]: http://www.yacy.net
[pf]: http://www.postfix.org
[dc]: http://www.dovecot.org
[rc]: http://www.roundcube.net
[rdcl]: http://radicale.org
[osm]: http://www.openstreetmap.org
[ors]: http://www.openrouteservice.org
[piwik]: http://www.piwik.org

[^google-nutzungsbedingungen]: [**heise online** &ndash; Google bildet diensteübergreifende Benutzerprofile](http://www.heise.de/newsticker/meldung/Google-bildet-diensteuebergreifende-Benutzerprofile-1421163.html)
[^gmaps-kostenpflichtig]: [**heise iX** &ndash; Schluss mit Gratis: Google verlangt Geld für Kartennutzung](http://www.heise.de/ix/meldung/Schluss-mit-gratis-Google-verlangt-Geld-fuer-Kartennutzung-1368176.html)

*[MTA]: Mail Transfer Agent
*[LDAP]: Lightweight Directory Access Protocol
*[GPL]: GNU General Public License
*[IMAP]: Internet Message Access Protocol
