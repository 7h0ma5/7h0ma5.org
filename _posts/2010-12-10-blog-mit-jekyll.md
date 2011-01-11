---
title: Blog mit Jekyll
layout: post
date: 2010-12-10 22:00:00
categories:
- blog
---

3 Jahre lang lief dieses Blog mit Wordpress,
was auch ohne größere Probleme immer funktioniert hat.
Wordpress musste natürlich immer auf dem neusten Stand
gehalten werden um keine Sicherheitslücken zu
bieten. Außerdem ging die Performance wegen MySQL und PHP
bei viel Traffic in den Keller. Aus diesen Gründen bin
ich jetzt auf [Jekyll](http://www.jekyllrb.com) umgestiegen.

Jekyll ist kein CMS, sondern ein *Static-Site-Generator*,
denn Jekyll spuckt einfach nur statisches HTML aus. Das
hört sich jetzt vielleicht nach einer längst überholten
Technik an, doch kombiniert mit Git, Markdown bzw. Textile
und Liquid (einer Template-Engine) hat man ein sehr
flexibles System, was vor allem schnell und sicher ist.

Das die generierten Seiten statisch sind, bringt natürlich
auch Nachteile mit sich, denn man muss auf eingebaute
interaktive Funktionen, wie die Kommentar und Trackback-Funktion,
verzichten oder eine Alternative finden. Hier benutze ich zum
Beispiel [Disqus](http://www.disqus.com) für die Kommentare.

### Installation
Da Jekyll auf Ruby basiert, ist die Installation sehr einfach,
soweit man Ruby und RubyGems bereits installiert hat.

{% highlight bash %}
$ gem install jekyll
{% endhighlight %}

### Konfiguration
Ein Blog mit Jekyll ist einfach nur ein Verzeichnis mit dieser
Struktur:

    _config.yml
    _layouts/
       default.html
       post.html
    _posts/
       2010-12-01-test-post.md
    index.html

Die config.yml-Datei enthält die Einstellungen, der
\_layouts-Ordner die Templates und der \_posts-Ordner
die Blog-Einträge. Alle anderen Dateien, die sich in dem
Verzeichnis befinden werden einfach mit in die generierte Seite
übernommen.

Einen neuen Blogpost kann man einfach in
 [Markdown](http://daringfireball.net/projects/markdown/)
oder [Textile](http://textile.thresholdstate.com/) schreiben und dann in
den \_posts-Ordner speichern.

Damit Jekyll die Dateien als Einträge erkennt,
muss sich am Anfang der Datei die sogenannte *YAML Front Matter* befinden, das ist
ein Block, der Variablen, wie den Titel des Betrags, enthält und
mit [YAML](http://www.yaml.org/) formatiert ist.

Ein Post sieht dann zum Beispiel so aus:

    ---
    layout: post
    title: Test Post
    ---
    Text, der mit *Markdown* formatiert ist.

Die layout-Variable gibt an, welches Template aus dem
\_layouts-Ordner für diesen Beitrag verwendet werden soll.
Ein Template besteht aus HTML, das mithilfe der Template-Engine
[Liquid](https://github.com/tobi/liquid/wiki/liquid-for-designers)
mit dem eigentlichen Inhalt gefüllt wird.

Ein Template sieht zum Beispiel so aus:

{% highlight html+django %}
<!DOCTYPE html>
<html>
  <head>
    <title>{{"{{page.title"}}}}</title>
  </head>
  <body>
    <h1>{{"{{page.title"}}}}</h1>
      {{"{{content"}}}}
    </body>
</html>
{% endhighlight %}

### Deployment
Um den Mix aus Templates und Markdown in eine statische HTML-Seite
umzwandeln, muss man nur mit der Konsole in das Verzeichnis wechseln
und `jekyll` ausführen. Die generierte Seite befindet sich nun im
automatisch angelegten \_site-Verzeichnis und kann jetzt auf einen
Webserver hochgeladen werden, wofür es mehrere Möglichkeiten gibt.

Eine Möglichkeit ist rsync:

{% highlight bash %}
$ jekyll && rsync -avz --delete _site/ user@host:/var/www/my_site
{% endhighlight %}

Wenn das git-Repository sowieso schon auf dem Webserver liegt, ist
es am einfachsten, die Seite mit einem *post-receive hook* bei einem *commit*
automatisch neu generieren zu lassen. Wie das genau funktioniert und noch ein
paar andere Möglichkeiten sind [hier](https://github.com/mojombo/jekyll/wiki/Deployment)
zu finden.

Weitere Informationen gibt es im [Wiki](https://github.com/mojombo/jekyll/wiki)
des [GitHub-Projektes](https://github.com/mojombo/jekyll/wiki) von Jekyll.

Der "Source-Code" meines Blogs liegt [hier](https://github.com/7h0ma5/7h0ma5.org).

*[HTML]: Hypertext Markup Language
*[CMS]: Content Management System
