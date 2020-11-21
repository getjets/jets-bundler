# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

rails_version = "~> 6.0"

Gem::Specification.new do |s|
  s.name = "jets-bundler"
  s.version = "0.1.0"
  s.authors = ["Lauri Jutila"]
  s.summary = "Bundler patches for Jets"
  s.description = "Bundler patches for Jets"

  s.files = Dir["{config,lib}/**/*", "Rakefile"]

  # Core
  s.add_dependency "bundler", ">= 2"

  s.add_development_dependency "bundler", ">= 2"
  s.add_development_dependency "pry-byebug", "~> 3.6"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec"

  # Formatters
  # Progressbar-like formatter for RSpec
  s.add_development_dependency "fuubar", "~> 2.5"
  s.add_development_dependency "rspec-instafail", "~> 1.0"
  s.add_development_dependency "rspec_junit_formatter", "~> 0.4"

  # Internal
  s.add_development_dependency "jets-rubocop"
end
