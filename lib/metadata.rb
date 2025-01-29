# frozen_string_literal: true

# code: language=ruby

# Module containing metadata for the GHC gem specification
module Metadata
  def self.version
    '0.0.3'
  end

  def self.name
    'ghc'
  end

  def self.summary
    'GitHub helper'
  end

  def self.description
    'A tool to help manage GitHub repositories'
  end

  def self.author
    'Dave Williams'
  end

  def self.email
    'dave@dave.io'
  end

  def self.files
    ['lib/ghc.rb']
  end

  def self.executables
    ['ghc']
  end

  def self.authors
    ['Dave Williams']
  end

  def self.license
    'MIT'
  end

  def self.homepage
    'https://github.com/daveio/ghc'
  end

  def self.required_ruby_version
    '>= 3.3.6'
  end

  def self.dependencies
    {
      'commander' => '~> 5.0.0',
      'terminal-table' => '~> 4.0.0'
    }
  end

  def self.development_dependencies
    {
      'pry' => '~> 0.15.2',
      'rubocop' => '~> 1.71.0',
      'rubocop-rspec' => '~> 3.4.0',
      'rspec' => '~> 3.13.0'
    }
  end
end
