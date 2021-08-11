#!/usr/bin/env ruby

system "find . -name '*.rb' | ctags -f .tags -L -"

if File.exist? './Gemfile'
  require 'bundler'
  paths = Bundler.load.specs.map(&:full_gem_path).join(' ')
  print "all paths is ", paths, '\n'
  system "ctags -R -f .gemtags #{paths}"
end