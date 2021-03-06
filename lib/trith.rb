require 'bigdecimal'
require 'rational'
require 'digest/sha1'

# @see http://rubygems.org/gems/backports
require 'backports/1.9.1'        if RUBY_VERSION < '1.9.1'
require 'backports/basic_object' if RUBY_VERSION < '1.9.1'

# @see http://rubygems.org/gems/promise
require 'future'

# @see http://rubygems.org/gems/sxp
require 'sxp'

# @see http://rubygems.org/gems/rdf
require 'rdf'
require 'rdf/ntriples'
require 'rdf/nquads'

# @see http://rubygems.org/gems/ffi
require 'ffi'

module Trith
  include RDF

  autoload :VERSION,  'trith/version'

  # Runtime
  autoload :Cache,    'trith/cache'
  autoload :Compiler, 'trith/compiler'
  autoload :Function, 'trith/function'
  autoload :Machine,  'trith/machine'
  autoload :Reader,   'trith/reader'
  autoload :Shell,    'trith/shell'

  # Vocabularies
  autoload :Core,     'trith/vocab/core'
  autoload :Math,     'trith/vocab/math'
end
