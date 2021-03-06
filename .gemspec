#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'trith'
  gem.homepage           = 'http://trith.org/'
  gem.license            = 'Public Domain' if gem.respond_to?(:license=)
  gem.summary            = 'An experimental concatenative programming language.'
  gem.description        = 'An experimental concatenative programming language founded on the unholy trinity of Forth, Lisp and RDF triples.'
  gem.rubyforge_project  = 'trith'

  gem.author             = 'Arto Bendiken'
  gem.email              = 'trith@googlegroups.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS CREDITS README UNLICENSE VERSION) + Dir.glob('etc/*.{ttl,nt}') + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w(3th 3sh 3vm 3cc)
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.1'
  gem.requirements               = []
  gem.add_runtime_dependency     'ffi',       '>= 1.0'
  gem.add_runtime_dependency     'backports', '>= 1.18'
  gem.add_runtime_dependency     'promise',   '>= 0.3'
  gem.add_runtime_dependency     'sxp',       '>= 0.0.12'
  gem.add_runtime_dependency     'rdf',       '>= 0.3'
  gem.add_development_dependency 'yard' ,     '>= 0.6.0'
  gem.add_development_dependency 'rspec',     '>= 1.3.0'
  gem.add_development_dependency 'buildr' ,   '>= 1.4.0'
  gem.post_install_message       = nil
end
