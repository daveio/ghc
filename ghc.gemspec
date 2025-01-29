# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'ghc'
  s.version     = '0.0.3'
  s.summary     = 'GitHub helper'
  s.description = 'A tool to help manage GitHub repositories'
  s.authors     = ['Dave Williams']
  s.email       = 'dave@dave.io'
  s.files       = ['lib/ghc.rb']
  s.homepage    =
    'https://rubygems.org/gems/ghc'
  s.license = 'MIT'
  s.required_ruby_version = '>= 3.4.0'
  s.executables << 'ghc'
  # dependencies
  # s.add_dependency 'name', '~> 1.23.4'
  s.add_dependency 'commander', '~> 5.0.0'
  # development dependencies
  # s.add_development_dependency 'name', '~> 1.23.4'
end
