---
title: Neustart
layout: post
published: 2010-11-01T11:00:00Z
category: blog
tags: [neustart, backup, wget]
---

Seit längerer Zeit hat sich auf diesem Blog nichts mehr getan, deshalb
nun ein radikaler Schritt, um das Blog wieder zum Leben zu erwecken:
alles plattmachen und neu anfangen.

Mein altes Blog habe ich natürlich nicht gelöscht, sondern ein Backup
erstellt, einmal mit der Export-Funktion von Wordpress
([download](http://old.7h0ma5.org/7h0ma5-wordpress-export.tar.gz)),
und zusätzlich einen statischen Dump mit *wget*, der auch alle Bilder
und Dateien enthält
([download](http://old.7h0ma5.org/old-7h0ma5-org.tar.gz),
[online](http://old.7h0ma5.org)).

Mit *wget* lässt sich ganz einfach ein Dump einer kompletten Webseite
erstellen:

``` bash
$ wget -r -E -T 2 -np -R xmlrpc.php,trackback -k [URL]
```

Jetzt hoffe ich, dass ich in nächster Zeit wieder mehr Motivation
bzw. Zeit habe, hier ein paar Beiträge zu posten.
