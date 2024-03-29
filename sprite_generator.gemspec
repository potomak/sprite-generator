# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprite_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "sprite_generator"
  spec.version       = SpriteGenerator::VERSION
  spec.authors       = ["Giovanni Cappellotto"]
  spec.email         = ["potomak84@gmail.com"]
  spec.description   = %q{Create sprites programmatically}
  spec.summary       = %q{Create sprites programmatically}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rmagick"
  spec.add_dependency "color"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
