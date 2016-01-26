# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'UNESCO_World_Heritage_Sites/version'

Gem::Specification.new do |spec|
  spec.name          = "UNESCO_World_Heritage_Sites"
  spec.version       = UNESCOWorldHeritageSites::VERSION
  spec.authors       = ["Matthew McGowan"]
  spec.email         = ["matthewpaulmcgowan@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{A CLI to search through UNESCO World Heritage Sites}
  spec.description   = %q{Scrapes many pages throughout the whc.unesco.org website, organizes sites by country and allows the user to select which site they would like to learn more about.}
  spec.homepage      = "https://github.com/matthewpaulmcgowan/UNESCO_World_Heritage_Sites_CLI_Data_Gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
end
