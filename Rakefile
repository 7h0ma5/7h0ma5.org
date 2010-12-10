def jekyll(opts="")
  sh "rm -rf _site"
  sh "jekyll " + opts
end

task :build do
  jekyll
end

task :default do
  jekyll "--server --auto"
end

task :deploy => :build do
  sh "rsync -rtz --delete _site/ root@t0g.de:/var/www/vhosts/7h0ma5.org/"
end
