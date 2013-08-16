---
title: Mutt mit Gmail und IMAP
layout: post
date: 2010-12-18 15:00:00
category: software
tags: [mutt, configuration, gmail, google, mail]
---

Google Mail hat zwar ein sehr gutes Webinterface, doch einen
Text-basierten Client wie [Mutt](http://www.mutt.org/)
zu benutzen hat auch einige Vorteile. Zum Beispiel unterstützt
mutt GnuPG vollständig und über eine SSH-Verbindnung kann man
von überall aus sicher auf seine E-Mails zugreifen.

Damit Mutt richtig mit Gmail zusammenarbeitet, muss
man einige Einstellungen in der *.muttrc* vornehmen:

### Account-Daten

    set imap_user = "myname@googlemail.com"
    set imap_pass = "secretpassword"

    set smtp_url = "smtp://myname@smtp.googlemail.com:587/"
    set smtp_pass = "secretpassword"

### Ordner
Ein Problem ist die Ordner-Struktur,
die Google verwendet, denn alle Ordner befinden
sich in dem Unterverzeichnis *\[Google Mail\]*.
Damit mutt die richtigen Ordner verwendet, werden hier
die richtigen Ordner definiert:

    set folder = "imaps://imap.googlemail.com:993"
    set spoolfile = "+INBOX"
    set postponed = "+[Google Mail]/Drafts"

### Shortcuts
Um E-Mails richtig zu archivieren oder als Spam
zu kennzeichnen, werden dafür die Shortcuts *y* und
*s* definiert:

    macro index,pager y "<save-message>=[Google<quote-char> Mail]/All<quote-char> Mail<enter><enter>" "Archive"
    macro index,pager s "<save-message>=[Google<quote-char> Mail]/Spam<enter><enter>" "Spam"

Um in die anderen Ordner zu wechseln, hier noch ein paar
Shortcuts, die auch im Webinterface funktionieren:

    macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
    macro index ga "<change-folder>=[Google<quote-char> Mail]/All<quote-char> Mail<enter>" "Go to all mail"
    macro index gt "<change-folder>=[Google<quote-char> Mail]/Sent<quote-char> Mail<enter>" "Go to sent Mail"
    macro index gd "<change-folder>=[Google<quote-char> Mail]/Drafts<enter>" "Go to drafts"
    macro index gs "<change-folder>=[Google<quote-char> Mail]/Spam<enter>" "Go to Spam"

### Sonstiges

Damit mutt richtig mit Gmail zusammenarbeitet,
habe ich noch folgende Einstellungen gesetzt:

    set imap_keepalive = 900
    set timeout=15
    set mail_check=60

    set sort = 'threads'
    set sort_aux = 'last-date-received'
    set charset="utf-8"

    set delete = yes
    set move = no

Jetzt sollte alles perfekt funktionieren.
