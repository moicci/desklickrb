# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'desklickrb/version'

Gem::Specification.new do |spec|
  spec.name          = "desklickrb"
  spec.version       = Desklickrb::VERSION
  spec.authors       = ["fukuda, minoru"]
  spec.email         = ["fukuda@bylo.jp"]
  spec.summary       = %q{Mac's Desktop Picture refresher using Flickr pictures}
  spec.description   = 'Gem for using Flickr API in Ruby - https://www.flickr.com/services/api/'
  spec.homepage      = "http://github.com/moicci/desklickrb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency('flickr.rb', ['>= 1.1.2'])
end
