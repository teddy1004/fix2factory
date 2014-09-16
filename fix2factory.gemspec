# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fix2factory/version'

Gem::Specification.new do |spec|
  spec.name          = "fix2factory"
  spec.version       = Fix2factory::VERSION
  spec.authors       = ["Teddy"]
  spec.email         = ["ivan.wang1004@gmail.com"]
  spec.summary       = %q{Fixtures to Factory Girl}
  spec.description   = %q{A simple tool convert Fixtures into Factory Girl}
  spec.homepage      = "https://github.com/teddy1004/fix2factory"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['fix2factory']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 4.7"

  spec.add_dependency "psych", "~> 2.0"
end
