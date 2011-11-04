def jekyll(opts="")
  sh "rm -rf _site"
  sh "jekyll " + opts
end

task :build do
  jekyll
end

task :default do
  jekyll "--server --auto --future"
end

task :deploy => :build do
  sh "rsync -rtz --delete _site/ root@t0g.de:/var/www/vhosts/7h0ma5.org/"
end

task :post do
  STDOUT.write "Title: "
  title = STDIN.gets.chop!

  STDOUT.write "URL short: "
  url_short = STDIN.gets.chop!

  date_prefix = Time.now.strftime("%Y-%m-%d")
  date_header = Time.now.strftime("%Y-%m-%d %H:%M:%I")
  file = "_posts/#{date_prefix}-#{url_short}.md"

  dummy = <<-END
---
layout: post
title: #{title}
date: #{date_header}
---
END

  File.open(file, 'w') do |f|
    f << dummy
  end

  system("emacs", file)

  STDOUT.write "Commit? [y/n]: "
  commit = STDIN.gets.chop!
  if commit == "y"
    system("git", "ci -a -m \"adds new post '#{title}'\"")
    system("git", "push origin master")
  end

  STDOUT.write "Deploy? [y/n]: "
  dep = STDIN.gets.chop!
  if dep == "y"
    Rake::Task["deploy"].invoke
  end
end
