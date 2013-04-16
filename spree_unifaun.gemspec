# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_unifaun/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_unifaun'
  s.version      = SpreeUnifaun::VERSION.dup
  s.summary      = 'Unifaun Packsoft ERPConnect for Spree Commerce'
  s.description  = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.author       = 'Tobias Bohwalli'
  s.email        = 'hi@futhr.io'
  s.homepage     = 'https://github.com/hydrogarden/spree-unifaun'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '~> 2.0.0.beta'
  s.add_runtime_dependency 'spree_core', spree_version
  s.add_runtime_dependency 'spree_frontend', spree_version
  s.add_runtime_dependency 'spree_backend', spree_version
  s.add_runtime_dependency 'spree_api', spree_version

  s.add_development_dependency 'spree_auth_devise'
  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  # s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'shoulda-matchers', '~> 2.0'
  s.add_development_dependency 'i18n-spec', '~> 0.4.0'
  s.add_development_dependency 'fuubar', '>= 0.0.1'
  s.add_development_dependency 'launchy', '~> 2.2'
  s.add_development_dependency 'pry'
end