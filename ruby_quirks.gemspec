# coding: utf-8
$LOAD_PATH << File.expand_path("../lib", __FILE__)
require "ruby_quirks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "ruby_quirks"
  s.version       = RubyQuirks::VERSION
  s.authors       = ["David Elner"]
  s.email         = ["david@streeteasy.com"]
  s.homepage      = "https://github.com/delner/ruby_quirks"
  s.summary       = "Hotfixes and common idioms for the Ruby language."
  s.description   = "Hotfixes and common idioms for the Ruby language."
  s.license       = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = `git ls-files -- {spec,features,gemfiles}/*`.split("\n")

  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")

  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.3"
  s.add_development_dependency "yard", "~> 0.8.7.6"
end
