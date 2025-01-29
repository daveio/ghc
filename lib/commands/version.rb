# frozen_string_literal: true

require_relative '../metadata'

module Commands
  # Command to get GHC version
  class Version
    def initialize(args, options)
      @args = args
      @options = options
      run
    end

    def run
      puts "ghc #{Metadata.version}"
    end
  end
end
