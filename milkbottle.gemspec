# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'milkbottle/version'

Gem::Specification.new do |spec|
  spec.name          = "milkbottle"
  spec.version       = Milkbottle::VERSION
  spec.authors       = ["Mathew Hartley"]
  spec.email         = ["matt@storypark.com"]
  spec.summary       = %q{Gem to wrap the Milk Books API.}
  spec.description   = %q{Gem to wrap the Milk Books API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"

  spec.add_dependency "sawyer"
  spec.add_dependency "jwt"
end
