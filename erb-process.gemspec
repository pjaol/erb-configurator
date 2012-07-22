$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'erbprocess/version'

Gem::Specification.new do |s|
  s.name        = 'erb-process'
  s.version     = ERBProcess::VERSION
  s.date        = '2012-07-21'
  s.summary     = "Merges a variables file and an ERB file"
  s.description = "First Argument is a variables file, second is an ERB template, outputs to STDOUT"
  s.authors     = ["Patrick O'Leary"]
  s.email       = 'pjaol@pjaol.com'
  s.files       = Dir.glob("lib/**/*.rb")
  s.executables = "erb-process"
  s.test_files  = Dir.glob("test/**")
  s.homepage    = 'http://rubygems.org/gems/erb-process'
end