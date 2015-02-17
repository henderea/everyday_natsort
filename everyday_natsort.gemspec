# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everyday_natsort/version'

Gem::Specification.new do |spec|
  spec.name          = 'everyday_natsort'
  spec.version       = EverydayNatsort::VERSION
  spec.authors       = ['Eric Henderson']
  spec.email         = ['henderea@gmail.com']
  spec.summary       = %q{A gem for natural sorting and accent stripping.  Based on the naturalsort gem.}
  spec.description   = %q{A gem for natural sorting and accent stripping.  Based on the naturalsort gem, but with enhancements to handle accented characters and hyphen versus underscore.  Accents handling is also available as a separate module.}
  spec.homepage      = 'https://github.com/henderea/everyday_natsort'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec'
end
