# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'UNESCO_World_Heritage_Sites/version'

Gem::Specification.new do |spec|
  spec.name          = "UNESCO_World_Heritage_Sites"
  spec.version       = UNESCOWorldHeritageSites::VERSION
  spec.authors       = ["Matthew McGowan"]
  spec.email         = ["matthewpaulmcgowan@gmail.com"]
  spec.summary       = %q{A CLI to search through UNESCO World Heritage Sites}
  spec.description   = %q{Scrapes pages throughout the whc.unesco.org website, organizes sites by country and allows the user to select which site they would like to learn more about.}
  spec.homepage      = "https://github.com/matthewpaulmcgowan/UNESCO_World_Heritage_Sites_CLI_Data_Gem"
  spec.license       = "MIT"
  spec.files         = ["lib/UNESCO_World_Heritage_Sites.rb","lib/UNESCO_World_Heritage_Sites/cli.rb","lib/UNESCO_World_Heritage_Sites/countries.rb","lib/UNESCO_World_Heritage_Sites/scraper.rb","lib/UNESCO_World_Heritage_Sites/sites.rb","lib/UNESCO_World_Heritage_Sites/user_favorites.rb","lib/UNESCO_World_Heritage_Sites/version.rb"]
  spec.bindir        = "bin"
  spec.executables   << "UNESCO_World_Heritage_Sites"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri"
end
