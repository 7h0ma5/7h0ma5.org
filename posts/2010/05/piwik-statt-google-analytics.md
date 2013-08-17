---
title: Piwik statt Google Analytics
published: 2010-05-09T10:00:00Z
tags: web, analytics, google, piwik
---

Seit mehr als zwei Jahren habe ich [Google Analytics][ga] zur Erstellung von
Besucher­statistiken benutzt. Google Analytics bietet natürlich viele
Vorteile, zum Beispiel muss man es nicht selbst hosten und hat somit
am wenigesten Arbeit damit. Doch es besteht ein gravierender Nachteil:
Man gibt alle Statistiken direkt an Google weiter. Es ist nicht
sicher, wofür Google die Daten verwendet, aber man ermöglicht Google
so, Internet-Nutzer auch außerhalb von Googles eigenen Webseiten
weiter zu verfolgen.

Aus diesem Grund habe ich nach brauchbaren Alternativen zu Google
Analytics gesucht und bin unter anderem auf [Piwik][piwik] gestoßen.

Piwik ist OpenSource und orientiert sich an der Funktionsweise von
Google Analytics, muss aber selbst gehostet werden. Zur Installation
wird lediglich Webspace mit PHP und einer MySQL-Datenbank benötigt. Die
Installation funktioniert sehr einfach, das Hinzufügen einer Webseite
erfolgt ähnlich wie bei Google Analytics, man muss ein Stück
JavaScript in die zu trackenden Webseite kopieren.

[ga]: http://google.com/analytics
[piwik]: http://piwik.org