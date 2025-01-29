# frozen_string_literal: true

module Commands
  # Command to clone GitHub repositories
  class Clone
    def initialize(args, options)
      @args = args
      @options = options
      run
    end

    def run
      puts 'Cloning...'
    end
  end
end
