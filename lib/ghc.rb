# frozen_string_literal: true

# code: language=ruby

require 'rubygems'
require 'commander'
require 'terminal-table'
require_relative 'metadata'

# Main application class for GHC command-line interface
class GHC
  include Commander::Methods
  # include whatever modules you need

  def run
    setup_program
    setup_commands
    run!
  end

  private

  def setup_program
    program :name, Metadata.name
    program :version, Metadata.version
    program :description, Metadata.description
  end

  def setup_commands
    setup_clone_command
    setup_version_command
  end

  def setup_clone_command
    command :clone do |c|
      c.syntax = 'ghc clone [options]'
      c.summary = ''
      c.description = ''
      c.example 'description', 'command example'
      c.option '--some-switch', 'Some switch that does something'
      c.action do |args, options|
        # Do something or c.when_called Ghc::Commands::Clone
      end
    end
  end

  def setup_version_command
    command :version do |c|
      c.syntax = 'ghc version [options]'
      c.summary = ''
      c.description = ''
      c.example 'description', 'command example'
      c.option '--some-switch', 'Some switch that does something'
      c.action do |args, options|
        # Do something or c.when_called Ghc::Commands::Version
      end
    end
  end
end
