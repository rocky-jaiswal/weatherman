# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weatherman/version'

Gem::Specification.new do |spec|
  spec.name          = "weatherman-rb"
  spec.version       = Weatherman::VERSION
  spec.authors       = ["Rocky Jaiswal"]
  spec.email         = ["rocky.jaiswal@gmail.com"]
  spec.description   = %q{A wrapper over GlobalWeather SOAP services}
  spec.summary       = %q{Get the current weather for major cities of the world}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.3.0"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
