# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chimper/version'

Gem::Specification.new do |spec|
  spec.name          = "chimper"
  spec.version       = Chimper::VERSION
  spec.authors       = ["Jacob Burenstam"]
  spec.email         = ["burenstam@gmail.com"]

  spec.summary       = %q{Gibbon on POROs.}
  spec.description   = %q{Gibbon on POROs, don't want a Hash returned? With this gem you'll get a plain ol' Ruby object back.}
  spec.homepage      = "https://github.com/buren/chimper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gibbon", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "simplecov"
end
