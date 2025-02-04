# frozen_string_literal: true

# code: language=ruby

require 'rubygems'
require 'commander'
require_relative 'metadata'
require_relative 'commands/clone'
require_relative 'commands/version'

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
    program :help, 'Documentation', 'https://github.com/daveio/ghc'
  end

  def setup_commands
    setup_clone_command
    setup_version_command
  end

  def setup_clone_command
    command :clone do |c|
      c.syntax = 'ghc clone [user]/[repo]'
      c.summary = 'Clone a repository'
      c.description = c.summary
      c.example c.summary, 'ghc clone daveio/ghc'
      # c.option '--some-switch', 'Some switch that does something'
      c.when_called Commands::Clone
    end
  end

  def setup_version_command
    command :version do |c|
      c.syntax = 'ghc version'
      c.summary = 'Show the version of the running GHC'
      c.description = c.summary
      c.example c.summary, 'ghc version'
      c.when_called Commands::Version
    end
  end
end
