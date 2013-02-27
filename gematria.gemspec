# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gematria/version'

Gem::Specification.new do |gem|
  gem.name          = "gematria"
  gem.version       = Gematria::VERSION
  gem.authors       = ["Adam Zaninovich"]
  gem.email         = ["adam.zaninovich@gmail.com"]
  gem.description   = %q{A Ruby gem that calculates Gematria. The gem comes with built-in correspondence tables for English and Hebrew text, but allows for user-configurable tables. The gem supports raw conversion to number (by simple summation), mapping (breakdown of individual numbers), and reduction to a single digit (mispar katan mispari).}
  gem.summary       = %q{A Ruby gem that calculates Gematria}
  gem.homepage      = "http://github.com/adamzaninovich/gematria"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
